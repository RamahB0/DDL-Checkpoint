-- DDL Checkpoint: Relational Databases
-- Create Customer table
CREATE TABLE Customer (
      Customer_id VARCHAR2(20) CONSTRAINT pk_customer PRIMARY KEY,
      Customer_Name VARCHAR2(20) CONSTRAINT nn_customer_name NOT NULL,
      Customer_Tel NUMBER
  );

-- Create Product table
CREATE TABLE Product (
      Product_id VARCHAR2(20) CONSTRAINT pk_product PRIMARY KEY,
      Product_Name VARCHAR2(20) CONSTRAINT nn_product_name NOT NULL,
      Price NUMBER CONSTRAINT chk_price CHECK (Price > 0)
  );

-- Create Orders table
CREATE TABLE Orders (
      Customer_id VARCHAR2(20),
      Product_id VARCHAR2(20),
      Quantity NUMBER,
      Total_amount NUMBER,
      CONSTRAINT pk_orders PRIMARY KEY (Customer_id, Product_id),
      CONSTRAINT fk_orders_customer FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
      CONSTRAINT fk_orders_product FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
  );

-- Add Category column (VARCHAR2(20)) to PRODUCT table
ALTER TABLE Product ADD Category VARCHAR2(20);

-- Add OrderDate column (DATE) with SYSDATE as default value to ORDERS table
ALTER TABLE Orders ADD OrderDate DATE DEFAULT SYSDATE;
