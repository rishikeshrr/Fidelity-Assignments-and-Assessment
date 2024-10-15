-- 1. Create tblCustomers with a default Country as 'Canada'
CREATE TABLE tblCustomers (
    CustomerID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(20),
    ContactName VARCHAR(20),
    ContactTitle VARCHAR(20),
    Address VARCHAR(30),
    City VARCHAR(20),
    Region VARCHAR(20),
    PostalCode VARCHAR(15),
    Country VARCHAR(20) DEFAULT 'Canada',
    Phone VARCHAR(13),
    Fax VARCHAR(20)
);

-- ---------------------------------------------------------------------------------------------------------------
-- Create tblSupplier with SupplierID as Primary key
CREATE TABLE tblSupplier (
    SupplierID SERIAL PRIMARY KEY,
    Name VARCHAR(30),
    Address VARCHAR(100),
    City VARCHAR(30),
    Province VARCHAR(30)
);

-- ---------------------------------------------------------------------------------------------------------------
-- 2.Create tblShippers with unique constraint on CompanyName
CREATE TABLE tblShippers (
    ShipperID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(30) UNIQUE
);

-- ---------------------------------------------------------------------------------------------------------------
-- Create tblProducts with foreign keys to Supplier
CREATE TABLE tblProducts (
    ProductID SERIAL PRIMARY KEY,
    SupplierID INT REFERENCES tblSupplier(SupplierID),
    CategoryID INT,
    ProductName VARCHAR(30),
    EnglishName VARCHAR(30),
    QuantityPerUnit VARCHAR(30),
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BOOLEAN
);

-- ---------------------------------------------------------------------------------------------------------------
-- 3.Create tblOrders with shipping constraints and foreign key to Customer and Shipper.
CREATE TABLE tblOrders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES tblCustomers(CustomerID),
    EmployeeID INT REFERENCES tblShippers(ShipperID),
    ShipName VARCHAR(30),
    ShipAddress VARCHAR(100),
    ShipCity VARCHAR(30),
    ShipRegion VARCHAR(30),
    ShipPostalCode VARCHAR(20),
    ShipCountry VARCHAR(30),
    ShipVia INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE CHECK (ShippedDate > OrderDate),
    Freight DECIMAL(10, 2)
);

-- ---------------------------------------------------------------------------------------------------------------
-- 4.Create tblOrderDetails with quantity constraint and foreign key to Orders and Products
CREATE TABLE tblOrderDetails (
    OrderID INT REFERENCES tblOrders(OrderID),
    ProductID INT REFERENCES tblProducts(ProductID),
    UnitPrice DECIMAL(10, 2),
    Quantity INT CHECK (Quantity > 0),
    Discount DECIMAL(4, 2),
    PRIMARY KEY (OrderID, ProductID)
);