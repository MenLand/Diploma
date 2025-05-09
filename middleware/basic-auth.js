const expressBasicAuth = require('express-basic-auth');

module.exports = function ({ users, challenge }) {
	return expressBasicAuth({
		users: users,
		challenge: challenge,
	});
};
