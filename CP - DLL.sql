CREATE TABLE Product(
    Product_Id VARCHAR2(20) NOT NULL,
    Product_Name VARCHAR2(20) NOT NULL,
    Price NUMBER CHECK (Price > 0),
    CONSTRAINT pk_product PRIMARY KEY(Product_Id),
);

CREATE TABLE Customer(
    Customer_id VARCHAR2(20) NOT NULL, 
    Customer_Name VARCHAR2(20) NOT NULL,
    Customer_Tel NUMBER,
    CONSTRAINT pk_customer PRIMARY KEY(Customer_id),
);

CREATE TABLE Orders(
    Customer_id VARCHAR2(20),
    Product_Id VARCHAR2(20),
    Quantity NUMBER,
    Total_amount NUMBER,
    CONSTRAINT fk_customer FOREIGN KEY (Customer_id) REFERENCES Customer (Customer_id),
    CONSTRAINT fk_product FOREIGN KEY (Product_Id) REFERENCES Product (Product_Id),
    CONSTRAINT pk_orders PRIMARY KEY(Customer_id, Product_Id),
);

-- Update Tables
ALTER TABLE Product ADD Category (VARCHAR2(20));
ALTER TABLE Orders ADD OrderDate (DATE) DEFAULT (SYSDATE);