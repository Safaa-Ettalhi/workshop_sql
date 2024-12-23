--partie 1
CREATE DATABASE SaleOrderQuiz;
USE SaleOrderQuiz;

 --partie 2
CREATE TABLE Customer (
    CustomerID INT NOT NULL PRIMARY KEY,
    CustomerFirstName VARCHAR(50) NOT NULL,
    CustomerLastName VARCHAR(50) NOT NULL,
    CustomerAddress VARCHAR(50) NOT NULL,
    CustomerCity VARCHAR(50) NOT NULL,
    CustomerPostCode CHAR(4) NULL,
    CustomerPhoneNumber CHAR(12) NULL
);

CREATE TABLE Inventory (
    InventoryID TINYINT NOT NULL PRIMARY KEY,
    InventoryName VARCHAR(50) NOT NULL,
    InventoryDescription VARCHAR(255) NULL
);

CREATE TABLE Employee (
    EmployeeID TINYINT NOT NULL PRIMARY KEY,
    EmployeeFirstName VARCHAR(50) NOT NULL,
    EmployeeLastName VARCHAR(50) NOT NULL,
    EmployeeExtension CHAR(4) NULL
);

CREATE TABLE Sale (
    SaleID TINYINT NOT NULL PRIMARY KEY,
    CustomerID INT NOT NULL,
    InventoryID TINYINT NOT NULL,
    EmployeeID TINYINT NOT NULL,
    SaleDate DATE NOT NULL,
    SaleQuantity INT NOT NULL,
    SaleUnitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

--partie 3

INSERT INTO Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerCity, CustomerPostCode, CustomerPhoneNumber)
VALUES
(1, 'ahmed', 'Doaa', 'hay salam', 'safi', '4600', '0666666666'),
(2, 'ahlam', 'Smlali', 'oued el bacha', 'safi', '4601', '0666666666'),
(3, 'saad', 'ben', 'drb moulay hassan', 'safi', '4602', '0666666666');


INSERT INTO Inventory (InventoryID, InventoryName, InventoryDescription)
VALUES
(1, 'lampe', 'lampe noir avec effect'),
(2, 'verre', ' verre en cristal'),
(3, 'aspirateur', 'asppirateur rouge');


INSERT INTO Employee (EmployeeID, EmployeeFirstName, EmployeeLastName, EmployeeExtension)
VALUES
(1, 'Ali', 'Jghaydar', '1001'),
(2, 'Brahim', 'Wiam', '1002'),
(3, 'Chaimaa', 'Dawdi', '1003');


INSERT INTO Sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES
(1, 1, 1, 1, '2024-12-01', 1, 1000.00),
(2, 2, 2, 2, '2024-12-05', 2, 500.00),
(3, 3, 3, 3, '2024-12-10', 3, 300.00);
 
INSERT INTO Sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES
(4, 1, 1, 1, '2024-12-11', 7, 1000.00),
(5, 2, 2, 2, '2024-12-15', 5, 500.00),
(6, 3, 3, 3, '2024-12-20', 6, 300.00);
--partie 3

SELECT * FROM Customer;

select * from sale ;
-- prix total ordre decroisant
SELECT *, 
       (SaleQuantity * SaleUnitPrice) AS TotalAmount
FROM Sale
ORDER BY TotalAmount DESC;

select * from Employee ;
SELECT E.EmployeeID, E.EmployeeFirstName, E.EmployeeLastName, SUM(S.SaleQuantity * S.SaleUnitPrice) AS TotalSales
FROM Employee E
JOIN Sale S ON E.EmployeeID = S.EmployeeID
GROUP BY E.EmployeeID;

--partie 4 

ALTER TABLE Customer
ADD CustomerEmail VARCHAR(150);

UPDATE Customer
SET CustomerEmail = 'ahmed.doaa@gmail.com'
WHERE CustomerID = 1;

DESCRIBE Customer;
SHOW COLUMNS FROM Customer;

INSERT INTO Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerCity, CustomerPostCode, CustomerPhoneNumber,CustomerEmail)
VALUES
(5, 'nousair', 'jalal', '1234 new york', 'New York', '6000', '+2345678899','jalal@gmail.com');

select * from customer ;

DELETE FROM Customer
WHERE CustomerCity = 'New York';
 --partie 5
SELECT * FROM Sale
WHERE SaleDate >= CURDATE() - INTERVAL 30 DAY;

SELECT C.CustomerID, C.CustomerFirstName, C.CustomerLastName
FROM Customer C
JOIN Sale S ON C.CustomerID = S.CustomerID
WHERE S.SaleQuantity > 5;

select * from sale ;

SELECT I.InventoryName, SUM(S.SaleQuantity * S.SaleUnitPrice) AS TotalRevenue
FROM Sale S
JOIN Inventory I ON S.InventoryID = I.InventoryID
GROUP BY I.InventoryName;
