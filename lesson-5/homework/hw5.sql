
SELECT ProductName AS Name
FROM Products;

SELECT *
FROM Customers AS Client;


SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted;


SELECT ProductName
FROM Products
INTERSECT
SELECT ProductName
FROM Products_Discounted;


SELECT DISTINCT FirstName, Country
FROM Customers;


SELECT ProductName,
       CASE 
           WHEN Price > 1000 THEN 'High'
           ELSE 'Low'
       END AS PriceCategory
FROM Products;

StockQuantity
SELECT ProductName,
       IIF(StockQuantity > 100, 'Yes', 'No') AS StockStatus
FROM Products_Discounted;





SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted;
EXCEPT
SELECT ProductName
FROM Products
EXCEPT
SELECT ProductName
FROM Products_Discounted;


SELECT ProductName,
       IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;


SELECT *
FROM Employees
WHERE Age < 25 OR Salary > 60000;


UPDATE Employees
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR' OR EmployeeID = 5;




