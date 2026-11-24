-- create database Data_digger;
-- Use Data_Digger;

-- 1 Customers table

-- CREATE TABLE Customers (
--     CustomerID INT,
--     Name VARCHAR(20),
--     Email VARCHAR(20),
--     Address VARCHAR(20)
-- );

-- INSERT INTO Customers (CustomerID, Name, Email, Address) VALUES
-- (1, 'Alice', 'a@mail.com', 'Ahmedabad'),
-- (2, 'Bob', 'b@mail.com', 'Vadodara'),
-- (3, 'Charlie', 'c@mail.com', 'Surat'),
-- (4, 'David', 'd@mail.com', 'Mumbai'),
-- (5, 'Alice', 'a2@mail.com', 'Pune');

-- (1) Retrieve all customer details
-- Select *From Customers;

-- (2) Update a customer's address
-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE Customers SET Address = 'Rajkot' WHERE CustomerID = 2;

-- (3) Delete a customer using their CustomerID
-- DELETE FROM Customers
-- WHERE CustomerID = 4;

-- (4) Display all customers whose name is 'Alice'[cite: 5]
-- SELECT * FROM Customers
-- WHERE Name = 'Alice';

-- CREATE TABLE Orders(
--     OrderID INT,
--     CustomerID VARCHAR(20),
--     OrderDate VARCHAR(20),
--     TotalAmount VARCHAR(20)
-- );

-- (1) Insert at least 5 sample orders into the Orders table
-- INSERT INTO Orders VALUES 
-- (1, '1', '2026-11-20', '1500'), 
-- (2, '1', '2026-11-10', '800'), 
-- (3, '2', '2026-11-22', '2500'), 
-- (4, '3', '2026-09-15', '1200'), 
-- (5, '4', '2026-11-05', '3000');

-- (2) Retrieve all orders made by a specific customer
-- SELECT * FROM Orders 
-- WHERE CustomerID = '1';

-- (3) Update an order's total amount
-- UPDATE Orders SET TotalAmount = '1800' WHERE OrderID = 2; 

-- (4) Delete an order using its OrderID
-- DELETE FROM Orders WHERE OrderID = 4;

-- (5) Retrieve orders placed in the last 30 days
-- SELECT * FROM Orders 
-- WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- (6) Retrieve the highest, lowest, and average order amount using aggregate functions
-- SELECT MAX(CAST(TotalAmount AS DECIMAL(10,2))), 
-- MIN(CAST(TotalAmount AS DECIMAL(10,2))), 
-- AVG(CAST(TotalAmount AS DECIMAL(10,2))) 
-- FROM Orders;

-- CREATE TABLE PRODUCTS(
-- 	ProductID INT,
--     ProductName Varchar(20),
--     Price INT,
--     Stock INT
-- );

-- (1) Insert at least 5 sample products into the Products table
-- INSERT INTO PRODUCTS VALUES
-- (1, 'Mouse', 700, 20),
-- (2, 'Keyboard', 1800, 15),
-- (3, 'Monitor', 8000, 5),
-- (4, 'Cable', 300, 40),
-- (5, 'Headset', 1200, 0);

-- (2) Retrieve all products sorted by price in descending order
-- SELECT * FROM PRODUCTS
-- ORDER BY Price DESC;

-- (3) Update the price of a specific product
-- UPDATE PRODUCTS SET Price = 750 WHERE ProductID = 1;

-- (4)Delete a product if it's out of stock
-- DELETE FROM PRODUCTS WHERE Stock = 0;

-- (5) Retrieve products whose price is between ₹500 and ₹2000
-- SELECT * FROM PRODUCTS WHERE Price BETWEEN 500 AND 2000;

-- (6) Retrieve the most expensive and cheapest product using MAX() and MIN()
-- SELECT * FROM PRODUCTS WHERE Price = (SELECT MAX(Price) FROM PRODUCTS)
--    OR Price = (SELECT MIN(Price) FROM PRODUCTS);

-- CREATE TABLE OrderDetails(
-- 	OrderDetailID INT,
--     OrderID INT,
--     ProductID INT,
--     Quantity INT,
--     SubTotal INT
-- );

-- (1) Insert at least 5 sample records into the OrderDetails table
INSERT INTO OrderDetails VALUES
(1, 1, 1, 2, 1500),
(2, 2, 2, 1, 1800),
(3, 3, 3, 1, 8000),
(4, 5, 1, 3, 2250),
(5, 5, 4, 2, 600);

-- (2) Retrieve all order details for a specific order
SELECT * FROM OrderDetails
WHERE OrderID = 5;

-- (3) Calculate the total revenue generated from all orders using SUM()
SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;

-- (4) Retrieve the top 3 most ordered products
SELECT ProductID, SUM(Quantity) AS TotalQuantity FROM OrderDetails
GROUP BY ProductID ORDER BY TotalQuantity DESC LIMIT 3;

-- (5) Count how many times a specific product has been sold using COUNT()
SELECT COUNT(*) AS TimesSold
FROM OrderDetails
WHERE ProductID = 1;