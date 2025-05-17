
SELECT TOP 5 *
FROM Employees;

SELECT DISTINCT Category
FROM Products;

SELECT *
FROM Products
WHERE Price > 100;

SELECT *
FROM Customers
WHERE FirstName LIKE 'A%';

SELECT *
FROM Products
ORDER BY Price ASC;

-- Filter for employees with Salary >= 60000 and Department = 'HR'
SELECT *
FROM Employees
WHERE Salary >= 60000 AND DepartmentName = 'HR';

SELECT EmployeeID,
       FirstName,
       LastName,
       DepartmentName,
       Salary,
       HireDate,
       Age,
       ISNULL(Email, 'noemail@example.com') AS Email,
       Country
FROM Employees;

SELECT *
FROM Products
WHERE Price BETWEEN 50 AND 100;

SELECT DISTINCT Category, ProductName
FROM Products;

SELECT DISTINCT Category, ProductName
FROM Products
ORDER BY ProductName DESC;




SELECT TOP 10 *
FROM Products
ORDER BY Price DESC;

SELECT COALESCE(FirstName, LastName) AS FullName
FROM Employees;

SELECT DISTINCT Category, Price
FROM Products;

SELECT *
FROM Employees
WHERE Age BETWEEN 30 AND 40 OR DepartmentName = 'Marketing';

SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

SELECT *
FROM Products
WHERE Price <= 1000 AND StockQuantity > 50
ORDER BY StockQuantity ASC;

SELECT *
FROM Products
WHERE ProductName LIKE '%e%';

SELECT *
FROM Employees
WHERE DepartmentName IN ('HR', 'IT', 'Finance');

SELECT *
FROM Customers
ORDER BY City ASC, PostalCode DESC;
