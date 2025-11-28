create schema gold;


CREATE TABLE gold.transactions (
    TransactionID INT,
    Date DATE,
    ProductCategory VARCHAR(50),
    Quantity INT,
    PricePerUnit DECIMAL(10,2),
    TotalAmount DECIMAL(10,2)
);


CREATE TABLE gold.customers (
    TransactionID INT,
    CustomerID VARCHAR(20),
    Gender VARCHAR(10),
    Age INT
);


select * from gold.transactions;
select * from gold.customers;