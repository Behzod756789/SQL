SELECT 
    o.OrderID, 
    c.FirstName AS CustomerFirstName, 
    c.LastName AS CustomerLastName, 
    o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate > '2022-12-31';



SELECT 
    e.Name AS EmployeeName, 
    d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing');



SELECT 
    d.DepartmentName, 
    MAX(e.Salary) AS MaxSalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;




SELECT 
    c.FirstName AS CustomerFirstName, 
    c.LastName AS CustomerLastName, 
    o.OrderID, 
    o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA'
  AND o.OrderDate BETWEEN '2023-01-01' AND '2023-12-31';




SELECT 
    c.FirstName AS CustomerFirstName, 
    c.LastName AS CustomerLastName, 
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;




SELECT 
    p.ProductName, 
    s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName IN ('Gadget Supplies', 'Clothing Mart');




SELECT 
    c.FirstName AS CustomerFirstName, 
    c.LastName AS CustomerLastName, 
    MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;




SELECT 
    c.FirstName AS CustomerFirstName, 
    c.LastName AS CustomerLastName, 
    o.TotalAmount AS OrderTotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount > 500;




SELECT 
    p.ProductName, 
    s.SaleDate, 
    s.SaleAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE YEAR(s.SaleDate) = 2022 OR s.SaleAmount > 400;



SELECT 
    p.ProductName, 
    SUM(s.SaleAmount) AS TotalSalesAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName;




SELECT 
    e.Name AS EmployeeName, 
    d.DepartmentName, 
    e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'HR' AND e.Salary > 60000;




SELECT 
    p.ProductName, 
    s.SaleDate, 
    p.StockQuantity
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE YEAR(s.SaleDate) = 2023 AND p.StockQuantity > 100;



SELECT 
    e.Name AS EmployeeName, 
    d.DepartmentName, 
    e.HireDate
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' OR e.HireDate > '2020-12-31';




SELECT 
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    o.OrderID,
    c.Address,
    o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' AND c.Address LIKE '[0-9][0-9][0-9][0-9]%'




SELECT 
    p.ProductName, 
    p.Category, 
    s.SaleAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE p.Category = 'Electronics' OR s.SaleAmount > 350;



SELECT 
    c.CategoryName, 
    COUNT(p.ProductID) AS ProductCount
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;



SELECT 
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    c.City,
    o.OrderID,
    o.TotalAmount AS Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City = 'Los Angeles' AND o.TotalAmount > 300;




SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('HR', 'Finance')
   OR (
        (e.Name LIKE '%a%') + 
        (e.Name LIKE '%e%') + 
        (e.Name LIKE '%i%') + 
        (e.Name LIKE '%o%') + 
        (e.Name LIKE '%u%') 
    ) >= 4;





