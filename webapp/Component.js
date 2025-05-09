sap.ui.define(
	[
		'sap/ui/generic/app/AppComponent',
		'sap/ui/demoapps/rta/fiorielements/localService/mockserver',
		'sap/ui/rta/RuntimeAuthoring',
	],
	function (UIComponent, mockserver) {
		'use strict';

		const NAME = 'admin';
		const PASSWORD = 'admin';
		return UIComponent.extend(
			'sap.ui.demoapps.rta.fiorielements.Component',
			{
				metadata: {
					manifest: 'json',
				},

				/**
				 * Initialize MockServer & FakeLrep in constructor before model is loaded from the manifest.json
				 * @public
				 * @override
				 */
				constructor: function () {
					this.FakeLrepConnector = {};
					this._startMockServer();

					UIComponent.prototype.constructor.apply(this, arguments);

					// Проверяем, авторизован ли пользователь
					if (!localStorage.getItem('isAuthenticated')) {
						this.showLoginDialog();
					}

					this.getModel().attachMetadataLoaded(
						function () {}.bind(this)
					);

					$('[id*="logoutBtn-content"]').on();

					sap.ushell.Container.attachLogoutEvent(function () {
						localStorage.removeItem('isAuthenticated');
					});
				},

				showLoginDialog: function () {
					var oDialog = new sap.m.Dialog({
						title: 'Login',
						content: [
							new sap.m.Input({
								id: 'username',
								placeholder: 'Username',
							}),
							new sap.m.Input({
								id: 'password',
								placeholder: 'Password',
								type: 'Password',
							}),
						],
						buttons: [
							new sap.m.Button({
								text: 'Login',
								press: function () {
									var sUser = sap.ui
										.getCore()
										.byId('username')
										.getValue();
									var sPass = sap.ui
										.getCore()
										.byId('password')
										.getValue();

									if (sUser === NAME && sPass === PASSWORD) {
										localStorage.setItem(
											'isAuthenticated',
											'true'
										);
										oDialog.close();
										this.getModel().refresh(true); // Получает дефолтную модель
										this.getRouter().initialize(); // Инициализация роутера
									} else {
										sap.m.MessageToast.show(
											'Invalid credentials'
										);
									}
								}.bind(this),
							}),
						],
					});
					oDialog.open();
				},

				/**
				 * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
				 * @public
				 * @override
				 */
				init: function () {
					this._createODataModel();

					// call the base component's init function and start the application
					UIComponent.prototype.init.apply(this, arguments);
				},

				/**
				 * Start the MockServer
				 * @private
				 */
				_startMockServer: function () {
					mockserver.init(this.getManifestEntry.bind(this));
				},

				/**
				 * Create the ODataModel for the app
				 * @private
				 */
				_createODataModel: function () {
					if (this._oMainService.uri) {
						var oModel = new ODataModel(this._oMainService.uri, {
							settings: {
								metadataUrlParams: {
									'sap-documentation': 'heading',
								},
							},
						});
						oModel.setDefaultBindingMode('TwoWay');
						this.setModel(oModel);
					}
				},
			}
		);
	}
);
