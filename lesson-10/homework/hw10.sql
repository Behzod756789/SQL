SELECT first_name + ' ' + last_name AS EmployeeName, 
       salary, 
       d.department_name AS DepartmentName
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE salary > 50000;



SELECT c.first_name, 
       c.last_name, 
       o.order_date AS OrderDate
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE YEAR(o.order_date) = 2023;



SELECT e.first_name + ' ' + e.last_name AS EmployeeName, 
       d.department_name AS DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.department_id = d.department_id;




SELECT e.first_name + ' ' + e.last_name AS EmployeeName, 
       d.department_name AS DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.department_id = d.department_id;



SELECT s.supplier_name AS SupplierName, 
       p.product_name AS ProductName
FROM Suppliers s
LEFT JOIN Products p ON s.supplier_id = p.supplier_id;



SELECT o.order_id AS OrderID, 
       o.order_date AS OrderDate, 
       p.payment_date AS PaymentDate, 
       p.amount AS Amount
FROM Orders o
FULL OUTER JOIN Payments p ON o.order_id = p.order_id;



SELECT e.first_name + ' ' + e.last_name AS EmployeeName, 
       m.first_name + ' ' + m.last_name AS ManagerName
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id;





SELECT s.first_name + ' ' + s.last_name AS StudentName, 
       c.course_name AS CourseName
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Math 101';




SELECT c.first_name, 
       c.last_name, 
       o.quantity
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.quantity > 3;




SELECT e.first_name + ' ' + e.last_name AS EmployeeName, 
       d.department_name AS DepartmentName
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Human Resources';




SELECT d.department_name AS DepartmentName, 
       COUNT(e.employee_id) AS EmployeeCount
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 5;



SELECT p.product_id AS ProductID, 
       p.product_name AS ProductName
FROM Products p
LEFT JOIN Sales s ON p.product_id = s.product_id
WHERE s.product_id IS NULL;




SELECT p.product_id AS ProductID, 
       p.product_name AS ProductName
FROM Products p
LEFT JOIN Sales s ON p.product_id = s.product_id
WHERE s.product_id IS NULL;



SELECT c.first_name AS FirstName, 
       c.last_name AS LastName, 
       COUNT(o.order_id) AS TotalOrders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name;



SELECT e.first_name + ' ' + e.last_name AS EmployeeName, 
       d.department_name AS DepartmentName
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;





SELECT e1.first_name + ' ' + e1.last_name AS Employee1, 
       e2.first_name + ' ' + e2.last_name AS Employee2, 
       e1.manager_id AS ManagerID
FROM Employees e1
JOIN Employees e2 ON e1.manager_id = e2.manager_id
WHERE e1.employee_id < e2.employee_id
  AND e1.manager_id IS NOT NULL;




SELECT o.order_id AS OrderID, 
       o.order_date AS OrderDate, 
       c.first_name AS FirstName, 
       c.last_name AS LastName
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE YEAR(o.order_date) = 2022;



SELECT e.first_name + ' ' + e.last_name AS EmployeeName, 
       e.salary AS Salary, 
       d.department_name AS DepartmentName
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Sales'
  AND e.salary > 60000;



SELECT o.order_id AS OrderID, 
       o.order_date AS OrderDate, 
       p.payment_date AS PaymentDate, 
       p.amount AS Amount
FROM Orders o
JOIN Payments p ON o.order_id = p.order_id;



SELECT p.product_id AS ProductID, 
       p.product_name AS ProductName
FROM Products p
LEFT JOIN Orders o ON p.product_id = o.product_id
WHERE o.product_id IS NULL;





SELECT e.first_name + ' ' + e.last_name AS EmployeeName, 
       e.salary AS Salary
FROM Employees e
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department_id
) dept_avg ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.avg_salary;






SELECT o.order_id AS OrderID, 
       o.order_date AS OrderDate
FROM Orders o
LEFT JOIN Payments p ON o.order_id = p.order_id
WHERE p.order_id IS NULL AND o.order_date < '2020-01-01';





SELECT p.product_id AS ProductID, 
       p.product_name AS ProductName
FROM Products p
LEFT JOIN Categories c ON p.category_id = c.category_id
WHERE c.category_id IS NULL;





SELECT 
    e1.first_name + ' ' + e1.last_name AS Employee1,
    e2.first_name + ' ' + e2.last_name AS Employee2,
    e1.manager_id AS ManagerID,
    e1.salary AS Salary
FROM Employees e1
JOIN Employees e2 ON e1.manager_id = e2.manager_id
WHERE e1.employee_id < e2.employee_id
  AND e1.salary > 60000
  AND e2.salary > 60000;




SELECT e.first_name + ' ' + e.last_name AS EmployeeName, 
       d.department_name AS DepartmentName
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE d.department_name LIKE 'M%';



SELECT s.sale_id AS SaleID, 
       p.product_name AS ProductName, 
       s.amount AS SaleAmount
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
WHERE s.amount > 500;




SELECT s.student_id AS StudentID, 
       s.first_name + ' ' + s.last_name AS StudentName
FROM Students s
WHERE s.student_id NOT IN (
    SELECT e.student_id
    FROM Enrollments e
    JOIN Courses c ON e.course_id = c.course_id
    WHERE c.course_name = 'Math 101'
);




SELECT o.order_id AS OrderID, 
       o.order_date AS OrderDate, 
       p.payment_id AS PaymentID
FROM Orders o
LEFT JOIN Payments p ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;
