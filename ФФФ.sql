-- Создание таблицы I_Currency
CREATE TABLE I_Currency (
    Currency VARCHAR(5) PRIMARY KEY NOT NULL,
    Currency_Text VARCHAR(40),
    Decimals TINYINT,
    CurrencyISOCode VARCHAR(3),
    AlternativeCurrencyKey VARCHAR(3),
    IsPrimaryCurrencyForISOCrcy BOOLEAN
);

-- Создание таблицы I_DraftAdministrativeData
CREATE TABLE I_DraftAdministrativeData (
    DraftUUID UUID PRIMARY KEY NOT NULL,
    DraftIsKeptByUser BOOLEAN,
    EnqueueStartDateTime TIMESTAMP(7),
    DraftIsCreatedByMe BOOLEAN,
    DraftIsLastChangedByMe BOOLEAN,
    DraftIsProcessedByMe BOOLEAN,
    CreatedByUserDescription VARCHAR(80),
    LastChangedByUserDescription VARCHAR(80),
    InProcessByUserDescription VARCHAR(80),
    DraftEntityType VARCHAR(30),
    CreationDateTime TIMESTAMP(7),
    CreatedByUser VARCHAR(12),
    LastChangeDateTime TIMESTAMP(7),
    LastChangedByUser VARCHAR(12),
    DraftAccessType VARCHAR(1),
    ProcessingStartDateTime TIMESTAMP(7),
    InProcessByUser VARCHAR(12)
);

-- Создание таблицы I_Language
CREATE TABLE I_Language (
    Language VARCHAR(2) PRIMARY KEY NOT NULL,
    Language_Text VARCHAR(16),
    LanguageISOCode VARCHAR(2)
);

-- Создание таблицы SEPMRA_C_CurrencyValueHelp
CREATE TABLE SEPMRA_C_CurrencyValueHelp (
    Currency VARCHAR(5) PRIMARY KEY NOT NULL,
    Currency_Text VARCHAR(40)
);

-- Создание таблицы SEPMRA_C_PD_ContactPerson
CREATE TABLE SEPMRA_C_PD_ContactPerson (
    ContactPerson VARCHAR(10) PRIMARY KEY NOT NULL,
    BusinessPartner VARCHAR(10),
    FullName VARCHAR(81),
    EmailAddress VARCHAR(255),
    FaxNumber VARCHAR(30),
    MobilePhoneNumber VARCHAR(30),
    PhoneNumber VARCHAR(30)
);

-- Создание таблицы SEPMRA_C_PD_PoItmCube
CREATE TABLE SEPMRA_C_PD_PoItmCube (
    Product VARCHAR(10) NOT NULL,
    OrgUnitName VARCHAR(20) NOT NULL,
    PoItmQuantity DECIMAL(13,3),
    QuantityUnit VARCHAR(3),
    PRIMARY KEY (Product, OrgUnitName)
);

-- Создание таблицы SEPMRA_C_PD_Product
CREATE TABLE SEPMRA_C_PD_Product (
    Product VARCHAR(10) NOT NULL,
    DraftUUID UUID NOT NULL,
    IsActiveEntity BOOLEAN NOT NULL,
    Activation_ac BOOLEAN,
    Copy_ac BOOLEAN,
    Delete_ext_ac BOOLEAN,
    Edit_ac BOOLEAN,
    Favorites_add_ac BOOLEAN,
    Favorites_remove_ac BOOLEAN,
    Favorites_toggle_ac BOOLEAN,
    Mycart_add_ac BOOLEAN,
    Preparation_ac BOOLEAN,
    Review_delete_ac BOOLEAN,
    Review_modify_ac BOOLEAN,
    Validation_ac BOOLEAN,
    ProductForEdit_fc TINYINT,
    DimensionUnit VARCHAR(3) NOT NULL,
    ProductPictureURL VARCHAR(255),
    Supplier VARCHAR(10) NOT NULL,
    ProductBaseUnit VARCHAR(3) NOT NULL,
    ProductForEdit VARCHAR(10),
    Weight DECIMAL(13,3),
    WeightUnit VARCHAR(3) NOT NULL,
    OriginalLanguage VARCHAR(2),
    Name VARCHAR(255) NOT NULL,
    ProductCategory VARCHAR(40) NOT NULL,
    MainProductCategory VARCHAR(40) NOT NULL,
    Price DECIMAL(16,3),
    Currency VARCHAR(5) NOT NULL,
    Height DECIMAL(13,3),
    Width DECIMAL(13,3),
    Depth DECIMAL(13,3),
    DraftEntityCreationDateTime TIMESTAMP(7),
    DraftEntityLastChangeDateTime TIMESTAMP(7),
    HasActiveEntity BOOLEAN,
    HasDraftEntity BOOLEAN,
    PRIMARY KEY (Product, DraftUUID, IsActiveEntity)
);

-- Создание таблицы SEPMRA_C_PD_ProductImage
CREATE TABLE SEPMRA_C_PD_ProductImage (
    Product VARCHAR(10) NOT NULL,
    ProductImage VARCHAR(70) NOT NULL,
    FileName VARCHAR(255),
    MIMEType VARCHAR(100),
    Description VARCHAR(50),
    CreationDateTime DECIMAL(15,0),
    LastChangedDateTime DECIMAL(15,0),
    PRIMARY KEY (Product, ProductImage)
);

-- Создание таблицы SEPMRA_C_PD_ProductPriceRange
CREATE TABLE SEPMRA_C_PD_ProductPriceRange (
    Product VARCHAR(10) PRIMARY KEY NOT NULL,
    PriceClassification VARCHAR(10)
);

-- Создание таблицы SEPMRA_C_PD_ProductSalesData
CREATE TABLE SEPMRA_C_PD_ProductSalesData (
    ID VARCHAR(255) PRIMARY KEY NOT NULL,
    SalesOrder VARCHAR(10),
    SoldToPartyCompanyName VARCHAR(80),
    SoldToPartyCountry VARCHAR(3),
    SoldToPartyCountryName VARCHAR(50),
    NetAmount DECIMAL(16,3),
    Currency VARCHAR(5),
    CurrencyT VARCHAR(15),
    SalesOrderItem VARCHAR(10),
    DeliveryCalendarDate TIMESTAMP(0),
    DeliveryCalendarYear VARCHAR(4),
    DeliveryCalendarMonth VARCHAR(2),
    DeliveryCalendarMonthT VARCHAR(10),
    Product VARCHAR(10),
    ProductName VARCHAR(255),
    SoldToParty VARCHAR(10)
);

-- Создание таблицы SEPMRA_C_PD_ProductStock
CREATE TABLE SEPMRA_C_PD_ProductStock (
    Product VARCHAR(10) PRIMARY KEY NOT NULL,
    Quantity DECIMAL(13,3),
    QuantityUnit VARCHAR(3),
    StockAvailability TINYINT,
    MinimumStockQuantity DECIMAL(13,3)
);

-- Создание таблицы SEPMRA_C_PD_ProductText
CREATE TABLE SEPMRA_C_PD_ProductText (
    Product VARCHAR(10) NOT NULL,
    Language VARCHAR(2) NOT NULL,
    DraftUUID UUID NOT NULL,
    IsActiveEntity BOOLEAN NOT NULL,
    Preparation_ac BOOLEAN,
    Validation_ac BOOLEAN,
    Description_fc TINYINT,
    LanguageForEdit_fc TINYINT,
    Delete_mc BOOLEAN,
    Name VARCHAR(255) NOT NULL,
    LanguageForEdit VARCHAR(2),
    Description VARCHAR(255),
    DraftEntityCreationDateTime TIMESTAMP(7),
    DraftEntityLastChangeDateTime TIMESTAMP(7),
    ParentDraftUUID UUID,
    HasActiveEntity BOOLEAN,
    HasDraftEntity BOOLEAN,
    PRIMARY KEY (Product, Language, DraftUUID, IsActiveEntity)
);

-- Создание таблицы SEPMRA_C_PD_Review
CREATE TABLE SEPMRA_C_PD_Review (
    Product VARCHAR(10) PRIMARY KEY NOT NULL,
    AverageRatingValue DECIMAL(4,2),
    NumberOfReviewPosts INTEGER
);

-- Создание таблицы SEPMRA_C_PD_ReviewPost
CREATE TABLE SEPMRA_C_PD_ReviewPost (
    ProductReviewPostUUID UUID PRIMARY KEY NOT NULL,
    IsReviewOfCurrentUser BOOLEAN,
    Product VARCHAR(10),
    ReviewPostTitle VARCHAR(60),
    ReviewPostText TEXT,
    ReviewRatingValue TINYINT,
    NumberOfAffirmativeAnswers INTEGER,
    TotalNumberOfAnswers INTEGER,
    ReviewDate TIMESTAMP(0),
    ContactPerson VARCHAR(10)
);

-- Создание таблицы SEPMRA_C_PD_StorageBinTP
CREATE TABLE SEPMRA_C_PD_StorageBinTP (
    Product VARCHAR(10) NOT NULL,
    Bin VARCHAR(10) NOT NULL,
    DraftUUID UUID NOT NULL,
    IsActiveEntity BOOLEAN NOT NULL,
    Preparation_ac BOOLEAN,
    Validation_ac BOOLEAN,
    ToleranceRangeLow DECIMAL(14,3),
    ToleranceRangeHigh DECIMAL(17,3),
    DeviationRangeHigh DECIMAL(17,3),
    MinimumStock TINYINT,
    MaximumStock DECIMAL(13,3),
    PoItmQuantity DECIMAL(13,3),
    Quantity DECIMAL(13,3),
    LotSizeQuantity DECIMAL(13,3),
    MinimumStockQuantity DECIMAL(13,3),
    QuantityUnit VARCHAR(3),
    StockAvailability TINYINT,
    OrganizationalUnit VARCHAR(10),
    DeviationRangeLow DECIMAL(13,3),
    DraftEntityCreationDateTime TIMESTAMP(7),
    DraftEntityLastChangeDateTime TIMESTAMP(7),
    ParentDraftUUID UUID,
    HasActiveEntity BOOLEAN,
    HasDraftEntity BOOLEAN,
    PRIMARY KEY (Product, Bin, DraftUUID, IsActiveEntity)
);

-- Создание таблицы SEPMRA_C_PD_Supplier
CREATE TABLE SEPMRA_C_PD_Supplier (
    Supplier VARCHAR(10) PRIMARY KEY NOT NULL,
    CompanyName VARCHAR(80),
    EmailAddress VARCHAR(255),
    FaxNumber VARCHAR(30),
    PhoneNumber VARCHAR(30),
    URL TEXT
);

-- Создание таблицы SEPMRA_I_Address
CREATE TABLE SEPMRA_I_Address (
    AddressUUID UUID PRIMARY KEY NOT NULL,
    Longitude DECIMAL(15,12),
    FormattedAddress VARCHAR(129),
    AddressType VARCHAR(2),
    CityName VARCHAR(40),
    PostalCode VARCHAR(10),
    StreetName VARCHAR(60),
    HouseNumber VARCHAR(10),
    Country VARCHAR(3),
    AddressValidityStartDate TIMESTAMP(0),
    AddressValidityEndDate TIMESTAMP(0),
    Latitude DECIMAL(15,12)
);

-- Создание таблицы SEPMRA_I_DimensionUnit
CREATE TABLE SEPMRA_I_DimensionUnit (
    UnitOfMeasure VARCHAR(3) PRIMARY KEY NOT NULL,
    UnitOfMeasure_Text VARCHAR(6),
    UnitOfMeasureISOCode VARCHAR(3)
);

-- Создание таблицы SEPMRA_I_OrganizationalUnit
CREATE TABLE SEPMRA_I_OrganizationalUnit (
    OrganizationalUnit VARCHAR(10) PRIMARY KEY NOT NULL,
    OrganizationalUnitName VARCHAR(20)
);

-- Создание таблицы SEPMRA_I_PriceClassification
CREATE TABLE SEPMRA_I_PriceClassification (
    PriceClassification VARCHAR(10) PRIMARY KEY NOT NULL,
    PriceClassification_Text VARCHAR(60)
);

-- Создание таблицы SEPMRA_I_ProductCategory
CREATE TABLE SEPMRA_I_ProductCategory (
    ProductCategory VARCHAR(40) PRIMARY KEY NOT NULL,
    MainProductCategory VARCHAR(40)
);

-- Создание таблицы SEPMRA_I_ProductMainCategory
CREATE TABLE SEPMRA_I_ProductMainCategory (
    MainProductCategory VARCHAR(40) PRIMARY KEY NOT NULL
);

-- Создание таблицы SEPMRA_I_QuantityUnit
CREATE TABLE SEPMRA_I_QuantityUnit (
    UnitOfMeasure VARCHAR(3) PRIMARY KEY NOT NULL,
    UnitOfMeasure_Text VARCHAR(6),
    UnitOfMeasureISOCode VARCHAR(3)
);

-- Создание таблицы SEPMRA_I_StockAvailability
CREATE TABLE SEPMRA_I_StockAvailability (
    StockAvailability TINYINT PRIMARY KEY NOT NULL,
    StockAvailability_Text VARCHAR(60)
);

-- Создание таблицы SEPMRA_I_WeightUnit
CREATE TABLE SEPMRA_I_WeightUnit (
    UnitOfMeasure VARCHAR(3) PRIMARY KEY NOT NULL,
    UnitOfMeasure_Text VARCHAR(6),
    UnitOfMeasureISOCode VARCHAR(3)
);

-- Создание внешних ключей и связей

-- Связи для SEPMRA_C_PD_Product
ALTER TABLE SEPMRA_C_PD_Product ADD CONSTRAINT fk_product_currency 
    FOREIGN KEY (Currency) REFERENCES I_Currency(Currency);

ALTER TABLE SEPMRA_C_PD_Product ADD CONSTRAINT fk_product_dimension_unit 
    FOREIGN KEY (DimensionUnit) REFERENCES SEPMRA_I_DimensionUnit(UnitOfMeasure);

ALTER TABLE SEPMRA_C_PD_Product ADD CONSTRAINT fk_product_supplier 
    FOREIGN KEY (Supplier) REFERENCES SEPMRA_C_PD_Supplier(Supplier);

ALTER TABLE SEPMRA_C_PD_Product ADD CONSTRAINT fk_product_base_unit 
    FOREIGN KEY (ProductBaseUnit) REFERENCES SEPMRA_I_QuantityUnit(UnitOfMeasure);

ALTER TABLE SEPMRA_C_PD_Product ADD CONSTRAINT fk_product_weight_unit 
    FOREIGN KEY (WeightUnit) REFERENCES SEPMRA_I_WeightUnit(UnitOfMeasure);

ALTER TABLE SEPMRA_C_PD_Product ADD CONSTRAINT fk_product_main_category 
    FOREIGN KEY (MainProductCategory) REFERENCES SEPMRA_I_ProductMainCategory(MainProductCategory);

ALTER TABLE SEPMRA_C_PD_Product ADD CONSTRAINT fk_product_category 
    FOREIGN KEY (ProductCategory) REFERENCES SEPMRA_I_ProductCategory(ProductCategory);

-- Связи для SEPMRA_C_PD_ProductText
ALTER TABLE SEPMRA_C_PD_ProductText ADD CONSTRAINT fk_product_text_product 
    FOREIGN KEY (Product) REFERENCES SEPMRA_C_PD_Product(Product);

ALTER TABLE SEPMRA_C_PD_ProductText ADD CONSTRAINT fk_product_text_language 
    FOREIGN KEY (LanguageForEdit) REFERENCES I_Language(Language);

-- Связи для SEPMRA_C_PD_Review
ALTER TABLE SEPMRA_C_PD_Review ADD CONSTRAINT fk_review_product 
    FOREIGN KEY (Product) REFERENCES SEPMRA_C_PD_Product(Product);

-- Связи для SEPMRA_C_PD_ReviewPost
ALTER TABLE SEPMRA_C_PD_ReviewPost ADD CONSTRAINT fk_review_post_product 
    FOREIGN KEY (Product) REFERENCES SEPMRA_C_PD_Product(Product);

ALTER TABLE SEPMRA_C_PD_ReviewPost ADD CONSTRAINT fk_review_post_contact_person 
    FOREIGN KEY (ContactPerson) REFERENCES SEPMRA_C_PD_ContactPerson(ContactPerson);

-- Связи для SEPMRA_C_PD_StorageBinTP
ALTER TABLE SEPMRA_C_PD_StorageBinTP ADD CONSTRAINT fk_storage_bin_product 
    FOREIGN KEY (Product) REFERENCES SEPMRA_C_PD_Product(Product);

ALTER TABLE SEPMRA_C_PD_StorageBinTP ADD CONSTRAINT fk_storage_bin_org_unit 
    FOREIGN KEY (OrganizationalUnit) REFERENCES SEPMRA_I_OrganizationalUnit(OrganizationalUnit);

ALTER TABLE SEPMRA_C_PD_StorageBinTP ADD CONSTRAINT fk_storage_bin_quantity_unit 
    FOREIGN KEY (QuantityUnit) REFERENCES SEPMRA_I_QuantityUnit(UnitOfMeasure);

ALTER TABLE SEPMRA_C_PD_StorageBinTP ADD CONSTRAINT fk_storage_bin_stock_availability 
    FOREIGN KEY (StockAvailability) REFERENCES SEPMRA_I_StockAvailability(StockAvailability);

-- Связи для SEPMRA_C_PD_Supplier
ALTER TABLE SEPMRA_C_PD_Supplier ADD CONSTRAINT fk_supplier_address 
    FOREIGN KEY (AddressUUID) REFERENCES SEPMRA_I_Address(AddressUUID);

ALTER TABLE SEPMRA_C_PD_Supplier ADD CONSTRAINT fk_supplier_contact_person 
    FOREIGN KEY (Supplier) REFERENCES SEPMRA_C_PD_ContactPerson(BusinessPartner);

-- Связи для SEPMRA_I_ProductCategory
ALTER TABLE SEPMRA_I_ProductCategory ADD CONSTRAINT fk_category_main_category 
    FOREIGN KEY (MainProductCategory) REFERENCES SEPMRA_I_ProductMainCategory(MainProductCategory);

-- Связи для SEPMRA_C_PD_ProductPriceRange
ALTER TABLE SEPMRA_C_PD_ProductPriceRange ADD CONSTRAINT fk_price_range_product 
    FOREIGN KEY (Product) REFERENCES SEPMRA_C_PD_Product(Product);

ALTER TABLE SEPMRA_C_PD_ProductPriceRange ADD CONSTRAINT fk_price_range_classification 
    FOREIGN KEY (PriceClassification) REFERENCES SEPMRA_I_PriceClassification(PriceClassification);

-- Связи для SEPMRA_C_PD_ProductStock
ALTER TABLE SEPMRA_C_PD_ProductStock ADD CONSTRAINT fk_product_stock_product 
    FOREIGN KEY (Product) REFERENCES SEPMRA_C_PD_Product(Product);

ALTER TABLE SEPMRA_C_PD_ProductStock ADD CONSTRAINT fk_product_stock_quantity_unit 
    FOREIGN KEY (QuantityUnit) REFERENCES SEPMRA_I_QuantityUnit(UnitOfMeasure);

ALTER TABLE SEPMRA_C_PD_ProductStock ADD CONSTRAINT fk_product_stock_availability 
    FOREIGN KEY (StockAvailability) REFERENCES SEPMRA_I_StockAvailability(StockAvailability);

-- Связи для SEPMRA_C_PD_ProductImage
ALTER TABLE SEPMRA_C_PD_ProductImage ADD CONSTRAINT fk_product_image_product 
    FOREIGN KEY (Product) REFERENCES SEPMRA_C_PD_Product(Product);