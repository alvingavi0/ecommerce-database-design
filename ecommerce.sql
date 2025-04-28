CREATE DATABASE E_commerce;
USE E_commerce;

/*  Brand Table */ 
CREATE TABLE brand (
    brandId INT PRIMARY KEY AUTO_INCREMENT,
    brandName VARCHAR(100),
    brandDescription VARCHAR(100)
);
/* Product Category Table */     
CREATE TABLE productCategory (
    CategoryId INT PRIMARY KEY AUTO_INCREMENT ,
    CategoryName VARCHAR(200),
    categoryDescription VARCHAR(200)
);
/* Product Table */ 
CREATE TABLE product (
    productId INT PRIMARY KEY AUTO_INCREMENT ,
    CategoryId INT,
    brandId INT,
	productName VARCHAR(200),
   productDescription VARCHAR(200),
   basePrice DECIMAL (10,2),
   createdAt DATE,
   updatedAt DATE,
    FOREIGN KEY (CategoryId) REFERENCES productCategory(CategoryId),
    FOREIGN KEY (brandId) REFERENCES brand(brandId)
);

/* Product Image Table */
CREATE TABLE productImage (
    imageId INT PRIMARY KEY AUTO_INCREMENT ,
    productId INT,
    imageUrl VARCHAR(200),
    altText VARCHAR(200),
    fileReference VARCHAR(200),
    displayOrder VARCHAR(200),
    FOREIGN KEY (productId) REFERENCES product(productId)
);

/* Product Item Table */
CREATE TABLE productItem (
    itemId INT PRIMARY KEY AUTO_INCREMENT,
    productId INT,
    itemName VARCHAR(100),
    quantityInStock INT,
    priceAdjustment DECIMAL(10,2),
    FOREIGN KEY (productId) REFERENCES product(productId)
);
/* Color Table */
CREATE TABLE color (
    colorId INT PRIMARY KEY AUTO_INCREMENT ,
    colorName VARCHAR(100)
);

/* Product Variation Table */
CREATE TABLE productVariation (
    variationId INT PRIMARY KEY AUTO_INCREMENT,
    variationName VARCHAR(100),
    productId VARCHAR(100)
);

/* Size Category Table */
CREATE TABLE sizeCategory (
    sizeCategoryId INT PRIMARY KEY AUTO_INCREMENT,
    sizeCategoryName VARCHAR(100)
);

/* Size Option Table */
CREATE TABLE sizeOption (
    optionId INT PRIMARY KEY AUTO_INCREMENT,
    sizeCategoryId INT,
    optionValue VARCHAR(100),
    optionDescription VARCHAR(100),
    FOREIGN KEY (sizeCategoryId) REFERENCES sizeCategory(sizeCategoryId)
);

/* Attribute Type Table */
CREATE TABLE attributeType (
    typeId INT PRIMARY KEY AUTO_INCREMENT,
    typeName VARCHAR(100)
);

/* Attribute Category Table */
CREATE TABLE attributeCategory (
    attributeCategoryId INT PRIMARY KEY AUTO_INCREMENT,
    attributeCategoryName VARCHAR(200),
    typeId INT,
    FOREIGN KEY (typeId) REFERENCES attributeType(typeId)
);



/* Product Attribute Table */
CREATE TABLE productAttribute (
 attributeId INT PRIMARY KEY AUTO_INCREMENT,
    productId INT ,
    attributeCategoryId INT ,
    attributeName VARCHAR(200),
    typeId INT ,
    FOREIGN KEY (productId) REFERENCES product(productId),
    FOREIGN KEY (attributeCategoryId) REFERENCES attributeCategory(attributeCategoryId),
    FOREIGN KEY (typeId) REFERENCES attributeType(typeId)
);
