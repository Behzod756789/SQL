Select MIN(price) as MinPrice
from Products;

Select MAX(Salary) AS MaxSalary
FROM Employees;

Select count(*) as TotalCustomers
from Customers;

SELECT COUNT(DISTINCT category) AS UniqueCategories
FROM Products;


SELECT SUM(sales_amount) AS TotalSales
FROM Sales
WHERE product_id = 7;

SELECT AVG(age) AS AverageAge
FROM Employees;

SELECT DeptID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DeptID;

SELECT category, MIN(price) AS MinPrice, MAX(price) AS MaxPrice
FROM Products
GROUP BY category;


SELECT customer_id, SUM(sales_amount) AS TotalSales
FROM Sales
GROUP BY customer_id;


SELECT DeptID
FROM Employees
GROUP BY DeptID
HAVING COUNT(*) > 5;

SELECT category, 
       SUM(sales_amount) AS TotalSales, 
       AVG(sales_amount) AS AverageSales
FROM Sales
WHERE product_id IN (SELECT id FROM Products)
GROUP BY category;


SELECT COUNT(*) AS HRCount
FROM Employees
WHERE DeptID = 'HR';



SELECT DeptID, MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary
FROM Employees
GROUP BY DeptID;


SELECT DeptID, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DeptID;


SELECT DeptID, AVG(Salary) AS AverageSalary, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DeptID;

SELECT category
FROM Products
GROUP BY category
HAVING AVG(price) > 400;


SELECT YEAR(sale_date) AS SalesYear, SUM(sales_amount) AS TotalSales
FROM Sales
GROUP BY YEAR(sale_date);


SELECT customer_id
FROM Sales
GROUP BY customer_id
HAVING COUNT(*) >= 3;


SELECT DeptID
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 60000;


SELECT category, AVG(price) AS AveragePrice
FROM Products
GROUP BY category
HAVING AVG(price) > 150;


SELECT customer_id, SUM(sales_amount) AS TotalSales
FROM Sales
GROUP BY customer_id
HAVING SUM(sales_amount) > 1500;


SELECT DeptID, SUM(Salary) AS TotalSalary, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 65000;


SELECT customer_id, SUM(order_amount) AS TotalAmount, MIN(order_amount) AS LeastPurchase
FROM TSQL2012.sales.orders
WHERE freight > 50
GROUP BY customer_id;


SELECT YEAR(order_date) AS SalesYear, MONTH(order_date) AS SalesMonth, 
       SUM(sales_amount) AS TotalSales, COUNT(DISTINCT product_id) AS UniqueProducts
FROM Orders
GROUP BY YEAR(order_date), MONTH(order_date)
HAVING COUNT(DISTINCT product_id) >= 2;

SELECT YEAR(order_date) AS OrderYear, MIN(quantity) AS MinQuantity, MAX(quantity) AS MaxQuantity
FROM Orders
GROUP BY YEAR(order_date);



















