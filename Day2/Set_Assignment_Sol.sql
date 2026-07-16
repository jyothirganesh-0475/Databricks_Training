CREATE DATABASE Databricks_Day2;
USE Databricks_Day2;

--Table 1: CurrentEmployees

CREATE TABLE CurrentEmployees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

--Insert Values
INSERT INTO CurrentEmployees VALUES
(101,'John','HR',50000),
(102,'Emma','Finance',65000),
(103,'David','IT',70000),
(104,'Sophia','IT',72000),
(105,'Michael','Sales',55000),
(106,'Olivia','Marketing',48000),
(107,'James','Marketing',60000),
(108,'William','IT',75000),
(109,'Ava','Finance',52000),
(110,'Isabella','Sales',68000);

--Table 2: FormerEmployees

CREATE TABLE FormerEmployees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

--Insert Values
INSERT INTO FormerEmployees VALUES
(105,'Michael','Sales',55000),
(106,'Olivia','Marketing',48000),
(111,'Lucas','HR',45000),
(112,'Mia','Finance',62000),
(113,'Ethan','IT',71000),
(114,'Charlotte','Sales',53000),
(115,'Benjamin','Operations',59000),
(116,'Amelia','HR',51000),
(117,'Henry','Finance',67000),
(118,'Harper','IT',73000);

--Table 3: DomesticCustomers

CREATE TABLE DomesticCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

--Insert Values

INSERT INTO DomesticCustomers VALUES
(1,'ABC Ltd','New York'),
(2,'XYZ Corp','Chicago'),
(3,'Global Tech','Dallas'),
(4,'Sunrise Inc','Boston'),
(5,'Bright Solutions','Seattle'),
(6,'Alpha Systems','Miami');

--Table 4: InternationalCustomers

CREATE TABLE InternationalCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

--Insert Values

INSERT INTO InternationalCustomers VALUES
(4,'Sunrise Inc','Boston'),
(5,'Bright Solutions','Seattle'),
(7,'TechWorld','London'),
(8,'Future Corp','Toronto'),
(9,'Vision Ltd','Dubai'),
(10,'Skyline LLC','Sydney');



--Table 5: OnlineOrders

CREATE TABLE OnlineOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

--Insert Values

INSERT INTO OnlineOrders VALUES
(1001,1,250),
(1002,2,450),
(1003,3,700),
(1004,5,900),
(1005,7,350),
(1006,8,1200);

--Table 6: StoreOrders

CREATE TABLE StoreOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

--Insert Values

INSERT INTO StoreOrders VALUES
(1004,5,900),
(1005,7,350),
(1007,2,600),
(1008,3,400),
(1009,9,1100),
(1010,10,850);


-- PART 5: SET OPERATORS (BASIC ASSIGNMENTS)

-- ### UNION ALL ### --

-- 1. Display all employee names from current and former employees without duplicates.
SELECT EmployeeName FROM CurrentEmployees 
UNION 
SELECT EmployeeName FROM FormerEmployees

-- 2. Display all departments from both employee tables.
SELECT Department FROM CurrentEmployees 
UNION 
SELECT Department FROM FormerEmployees

--3.Display all customer names from domestic and international customers.
SELECT CustomerName FROM DomesticCustomers
UNION
SELECT CustomerName FROM	InternationalCustomers

-- 4. Display all customer cities without duplicates.
SELECT City FROM DomesticCustomers 
UNION 
SELECT City FROM InternationalCustomers

-- 5. Display all order amounts from both order tables without duplicates.
SELECT Amount FROM OnlineOrders 
UNION 
SELECT Amount FROM StoreOrders

-- ### UNION ALL ### --

-- 1. Display all employee names including duplicates.
SELECT EmployeeName FROM CurrentEmployees 
UNION ALL 
SELECT EmployeeName FROM FormerEmployees

-- 2. Display all departments including duplicate values.
SELECT Department FROM CurrentEmployees 
UNION ALL 
SELECT Department FROM FormerEmployees

-- 3. Display all customer names including duplicates.
SELECT CustomerName FROM DomesticCustomers 
UNION ALL 
SELECT CustomerName FROM InternationalCustomers

-- 4. Display all customer cities including duplicates.
SELECT City FROM DomesticCustomers 
UNION ALL 
SELECT City FROM InternationalCustomers

-- 5. Display all order amounts including duplicate values.
SELECT Amount FROM OnlineOrders 
UNION ALL 
SELECT Amount FROM StoreOrders

-- ### EXCEPT ### --

-- 1. Find current employees who are not former employees.
SELECT EmployeeID, EmployeeName FROM CurrentEmployees 
EXCEPT 
SELECT EmployeeID, EmployeeName FROM FormerEmployees

-- 2. Find former employees who are not current employees.
SELECT EmployeeID, EmployeeName FROM FormerEmployees 
EXCEPT 
SELECT EmployeeID, EmployeeName FROM CurrentEmployees

-- 3. Find domestic customers not present internationally.
SELECT CustomerID, CustomerName FROM DomesticCustomers 
EXCEPT 
SELECT CustomerID, CustomerName FROM InternationalCustomers

-- 4. Find online orders not present in store orders.
SELECT OrderID FROM OnlineOrders 
EXCEPT 
SELECT OrderID FROM StoreOrders

-- 5. Find departments that exist only in current employees.
SELECT Department FROM CurrentEmployees 
EXCEPT 
SELECT Department FROM FormerEmployees

-- ### INTERSECT ### --

-- 1. Find employees present in both tables.
SELECT EmployeeID, EmployeeName FROM CurrentEmployees 
INTERSECT 
SELECT EmployeeID, EmployeeName FROM FormerEmployees

-- 2. Find common departments.
SELECT Department FROM CurrentEmployees 
INTERSECT 
SELECT Department FROM FormerEmployees

-- 3. Find customers present in both customer tables.
SELECT CustomerID, CustomerName FROM DomesticCustomers 
INTERSECT 
SELECT CustomerID, CustomerName FROM InternationalCustomers

-- 4. Find common cities.
SELECT City FROM DomesticCustomers 
INTERSECT 
SELECT City FROM InternationalCustomers

-- 5. Find common orders.
SELECT OrderID FROM OnlineOrders 
INTERSECT 
SELECT OrderID FROM StoreOrders


-- PART 6: SET OPERATORS (INTERMEDIATE ASSIGNMENTS)


-- ### UNION ### --

-- 1. Display all employee IDs and names.
SELECT EmployeeID, EmployeeName FROM CurrentEmployees 
UNION 
SELECT EmployeeID, EmployeeName FROM FormerEmployees

-- 2. Display all customer IDs and names.
SELECT CustomerID, CustomerName FROM DomesticCustomers 
UNION 
SELECT CustomerID, CustomerName FROM InternationalCustomers

-- 3. Display all salaries without duplicates.
SELECT Salary FROM CurrentEmployees 
UNION 
SELECT Salary FROM FormerEmployees

-- 4. Display all order IDs.
SELECT OrderID FROM OnlineOrders 
UNION 
SELECT OrderID FROM StoreOrders

-- 5. Combine employee and former employee department lists.
SELECT Department FROM CurrentEmployees 
UNION 
SELECT Department FROM FormerEmployees

-- ### UNION ALL ### --

-- 1. Count total rows returned using UNION ALL.
SELECT COUNT(*) AS TotalRows FROM (
    SELECT EmployeeID FROM CurrentEmployees 
    UNION ALL 
    SELECT EmployeeID FROM FormerEmployees
) as AllEmployees

-- 2. Display all customer records including duplicates.
SELECT * FROM DomesticCustomers 
UNION ALL 
SELECT * FROM InternationalCustomers

-- 3. Display all salaries including duplicates.
SELECT Salary FROM CurrentEmployees 
UNION ALL 
SELECT Salary FROM FormerEmployees

-- 4. Display all customer cities.
SELECT City FROM DomesticCustomers 
UNION ALL 
SELECT City FROM InternationalCustomers

-- 5. Display all order amounts.
SELECT Amount FROM OnlineOrders 
UNION ALL 
SELECT Amount FROM StoreOrders

-- ### EXCEPT ### --

-- 1. Find employee IDs existing only in CurrentEmployees.
SELECT EmployeeID FROM CurrentEmployees 
EXCEPT 
SELECT EmployeeID FROM FormerEmployees

-- 2. Find employee IDs existing only in FormerEmployees.
SELECT EmployeeID FROM FormerEmployees 
EXCEPT 
SELECT EmployeeID FROM CurrentEmployees

-- 3. Find customer IDs existing only in DomesticCustomers.
SELECT CustomerID FROM DomesticCustomers 
EXCEPT 
SELECT CustomerID FROM InternationalCustomers

-- 4. Find customer IDs existing only in InternationalCustomers.
SELECT CustomerID FROM InternationalCustomers 
EXCEPT 
SELECT CustomerID FROM DomesticCustomers

-- 5. Find online order IDs not found in StoreOrders.
SELECT OrderID FROM OnlineOrders 
EXCEPT 
SELECT OrderID FROM StoreOrders

-- ### INTERSECT ### --

-- 1. Find employee IDs common to both tables.
SELECT EmployeeID FROM CurrentEmployees 
INTERSECT 
SELECT EmployeeID FROM FormerEmployees

-- 2. Find common customer IDs.
SELECT CustomerID FROM DomesticCustomers 
INTERSECT 
SELECT CustomerID FROM InternationalCustomers

-- 3. Find common order IDs.
SELECT OrderID FROM OnlineOrders 
INTERSECT 
SELECT OrderID FROM StoreOrders

-- 4. Find common salaries.
SELECT Salary FROM CurrentEmployees 
INTERSECT 
SELECT Salary FROM FormerEmployees

-- 5. Find common departments.
SELECT Department FROM CurrentEmployees 
INTERSECT 
SELECT Department FROM FormerEmployees

-- ### UNION ### --

-- 1. Combine employee names with customer names into one list.
SELECT EmployeeName AS EntityName FROM CurrentEmployees 
UNION 
SELECT EmployeeName FROM FormerEmployees 
UNION 
SELECT CustomerName FROM DomesticCustomers 
UNION 
SELECT CustomerName FROM InternationalCustomers

-- 2. Create a unique list of all people and organizations.
SELECT EmployeeName AS PeopleAndOrgs FROM CurrentEmployees 
UNION 
SELECT EmployeeName FROM FormerEmployees 
UNION 
SELECT CustomerName FROM DomesticCustomers 
UNION 
SELECT CustomerName FROM InternationalCustomers

-- 3. Display all departments from both tables in alphabetical order.
SELECT Department FROM CurrentEmployees 
UNION 
SELECT Department FROM FormerEmployees 
ORDER BY Department

-- 4. Combine customer cities and employee departments into one result set.
SELECT City AS Location_or_Department FROM DomesticCustomers 
UNION 
SELECT City FROM InternationalCustomers 
UNION 
SELECT Department FROM CurrentEmployees 
UNION 
SELECT Department FROM FormerEmployees

-- 5. Display all IDs from employees and customers.
SELECT EmployeeID AS ID FROM CurrentEmployees 
UNION 
SELECT EmployeeID FROM FormerEmployees 
UNION 
SELECT CustomerID FROM DomesticCustomers 
UNION 
SELECT CustomerID FROM InternationalCustomers

-- ### UNION ALL ### --

-- 1. Combine all employee and former employee records with duplicates.
SELECT * FROM CurrentEmployees 
UNION ALL 
SELECT * FROM FormerEmployees

-- 2. Display all order records.
SELECT * FROM OnlineOrders 
UNION ALL 
SELECT * FROM StoreOrders

-- 3. Display all customer records.
SELECT * FROM DomesticCustomers 
UNION ALL 
SELECT * FROM InternationalCustomers

-- 4. Display employee names with a new column indicating the source table.
SELECT EmployeeName, 'Current' AS Source FROM CurrentEmployees 
UNION ALL 
SELECT EmployeeName, 'Former' AS Source FROM FormerEmployees

-- 5. Combine online and store orders with a source column.
SELECT *, 'Online' AS OrderSource FROM OnlineOrders 
UNION ALL 
SELECT *, 'Store' AS OrderSource FROM StoreOrders

-- ### EXCEPT ### --

-- 1. Find customers who ordered online but never ordered in-store.
SELECT CustomerID FROM OnlineOrders 
EXCEPT 
SELECT CustomerID FROM StoreOrders

-- 2. Find customers who ordered in-store but never ordered online.
SELECT CustomerID FROM StoreOrders 
EXCEPT 
SELECT CustomerID FROM OnlineOrders

-- 3. Find employee names existing only in current employees.
SELECT EmployeeName FROM CurrentEmployees 
EXCEPT 
SELECT EmployeeName FROM FormerEmployees

-- 4. Find departments unique to former employees.
SELECT Department FROM FormerEmployees 
EXCEPT 
SELECT Department FROM CurrentEmployees

-- 5. Find customer cities unique to domestic customers.
SELECT City FROM DomesticCustomers 
EXCEPT 
SELECT City FROM InternationalCustomers

-- ### INTERSECT ### --

-- 1. Find customers who ordered both online and in-store.
SELECT * FROM OnlineOrders 
INTERSECT 
SELECT * FROM StoreOrders

-- 2. Find employees existing in both tables.
SELECT * FROM CurrentEmployees 
INTERSECT 
SELECT * FROM FormerEmployees

-- 3. Find departments appearing in both employee tables.
SELECT Department FROM CurrentEmployees 
INTERSECT 
SELECT Department FROM FormerEmployees
