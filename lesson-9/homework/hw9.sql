SELECT 
    p.ProductName, 
    s.SupplierName
FROM 
    Products p
CROSS JOIN 
    Suppliers s;


SELECT 
    d.DepartmentName, 
    e.Name AS EmployeeName
FROM 
    Departments d
CROSS JOIN 
    Employees e;



SELECT 
    s.SupplierName, 
    p.ProductName
FROM 
    Products p
INNER JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID;



SELECT 
    c.CustomerName, 
    o.OrderID
FROM 
    Orders o
INNER JOIN 
    Customers c ON o.CustomerID = c.CustomerID;





SELECT 
    s.StudentName, 
    c.CourseName
FROM 
    Students s
CROSS JOIN 
    Courses c;





SELECT 
    p.ProductName, 
    o.OrderID
FROM 
    Products p
INNER JOIN 
    OrderDetails od ON p.ProductID = od.ProductID
INNER JOIN 
    Orders o ON od.OrderID = o.OrderID;





SELECT 
    e.Name AS EmployeeName, 
    d.DepartmentName
FROM 
    Employees e
INNER JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;




SELECT 
    s.StudentName, 
    e.CourseID
FROM 
    Students s
INNER JOIN 
    Enrollments e ON s.StudentID = e.StudentID;



SELECT 
    o.OrderID, 
    p.PaymentID
FROM 
    Orders o
INNER JOIN 
    Payments p ON o.OrderID = p.OrderID;



SELECT 
    o.OrderID, 
    p.ProductName, 
    p.Price
FROM 
    Orders o
INNER JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN 
    Products p ON od.ProductID = p.ProductID
WHERE 
    p.Price > 100;



SELECT 
    e.Name AS EmployeeName, 
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID != d.DepartmentID;




SELECT 
    o.OrderID, 
    p.ProductName, 
    od.QuantityOrdered, 
    p.StockQuantity
FROM 
    OrderDetails od
JOIN 
    Orders o ON od.OrderID = o.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
WHERE 
    od.QuantityOrdered > p.StockQuantity;



SELECT 
    c.CustomerName, 
    s.ProductID, 
    s.Amount
FROM 
    Sales s
JOIN 
    Customers c ON s.CustomerID = c.CustomerID
WHERE 
    s.Amount >= 500;




SELECT 
    st.StudentName, 
    c.CourseName
FROM 
    Enrollments e
JOIN 
    Students st ON e.StudentID = st.StudentID
JOIN 
    Courses c ON e.CourseID = c.CourseID;




SELECT 
    p.ProductName, 
    s.SupplierName
FROM 
    Products p
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID
WHERE 
    s.SupplierName LIKE '%Tech%';




SELECT 
    o.OrderID, 
    o.TotalAmount, 
    p.PaymentAmount
FROM 
    Orders o
JOIN 
    Payments p ON o.OrderID = p.OrderID
WHERE 
    p.PaymentAmount < o.TotalAmount;




SELECT 
    e.Name AS EmployeeName, 
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;




SELECT 
    p.ProductName, 
    c.CategoryName
FROM 
    Products p
JOIN 
    Categories c ON p.CategoryID = c.CategoryID
WHERE 
    c.CategoryName IN ('Electronics', 'Furniture');





SELECT 
    s.SaleID, 
    c.CustomerName, 
    s.ProductID, 
    s.Amount
FROM 
    Sales s
JOIN 
    Customers c ON s.CustomerID = c.CustomerID
WHERE 
    c.Country = 'USA';





SELECT 
    o.OrderID, 
    c.CustomerName, 
    o.TotalAmount
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
WHERE 
    c.Country = 'Germany' 
    AND o.TotalAmount > 100;



SELECT 
    e1.Name AS Employee1, 
    e2.Name AS Employee2
FROM 
    Employees e1
JOIN 
    Employees e2 
    ON e1.EmployeeID < e2.EmployeeID 
    AND e1.DepartmentID != e2.DepartmentID;




SELECT 
    p.PaymentID, 
    o.OrderID, 
    pr.ProductName, 
    od.Quantity, 
    pr.Price, 
    p.PaymentAmount
FROM 
    Payments p
JOIN 
    Orders o ON p.OrderID = o.OrderID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Products pr ON od.ProductID = pr.ProductID
WHERE 
    p.PaymentAmount != (od.Quantity * pr.Price);




SELECT 
    s.StudentID, 
    s.StudentName
FROM 
    Students s
LEFT JOIN 
    Enrollments e ON s.StudentID = e.StudentID
WHERE 
    e.EnrollmentID IS NULL;



SELECT 
    mgr.EmployeeID AS ManagerID,
    mgr.Name AS ManagerName,
    emp.Name AS EmployeeName,
    mgr.Salary AS ManagerSalary,
    emp.Salary AS EmployeeSalary
FROM 
    Employees emp
JOIN 
    Employees mgr ON emp.ManagerID = mgr.EmployeeID
WHERE 
    mgr.Salary <= emp.Salary;
