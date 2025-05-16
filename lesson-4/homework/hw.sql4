1-task


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18),
    Salary DECIMAL(10,2) CHECK (Salary >= 300),
    Email VARCHAR(100) UNIQUE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (104, 'David', 22, 900.00, 'david@example.com', 1);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (105, 'Eve', 26, 1100.00, 'alice@example.com', 2);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (106, 'Frank', 16, 950.00, 'frank@example.com', 3);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (107, 'Grace', 29, 350.00, 'grace@example.com', 1);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (108, 'Henry', 24, 1300.00, 'henry@example.com', 3);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (101, 'Ivy', 27, 1050.00, 'ivy@example.com', 2);
select * from Employees

SELECT TOP (5) 
    [EmpID], 
 [EmpName], 
    [Age], 
    [Salary], 
    [Email], 
    [DeptID]
FROM 
    [Employees];




SELECT DISTINCT Category
FROM Products;



CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Firstname VARCHAR(35),
    ProductName VARCHAR(40),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Quantity INT,
    Description VARCHAR(25)
);

INSERT INTO Products (ProductID, Firstname, ProductName, Category, Price, Quantity, Description) VALUES (1, 'Layla', 'Laptop',  'Electronics', 1113.62, 71, 'Detachable keyboard');
INSERT INTO Products (ProductID, Firstname, ProductName, Category, Price, Quantity, Description) VALUES (2, 'jack', 'Smartphone', 'Electronics', 82.00, 16, '15-inch screen');
INSERT INTO Products (ProductID, Firstname, ProductName, Category, Price, Quantity, Description) VALUES (3, 'Alex', 'Chair', 'Furniture', 760.51, 45, 'Ergonomic office chair');
INSERT INTO Products (ProductID, Firstname, ProductName, Category, Price, Quantity, Description) VALUES (4, 'Andrew', 'Desk', 'Furniture', 819.69, 20, 'Wooden with drawers');
INSERT INTO Products (ProductID, Firstname, ProductName, Category, Price, Quantity, Description) VALUES (5, 'Olmas', 'Book', 'Stationery', 43.00, 142, 'Hardcover textbook');


SELECT DISTINCT Category FROM Products;

SELECT * FROM Products
WHERE Price > 100;

SELECT * FROM Products
WHERE Firstname LIKE '%A';

SELECT * FROM Products
ORDER BY Price ASC;

Select * From Products
where price BETWEEN 50 and 100

SELECT DISTINCT Category, ProductName
FROM Products;


Select distinct  Category, ProductName
FROM Products
order by ProductName desc;

Select TOP 10 *
from Products
order BY Price desc;

Select distinct Category, Price
from Products;


Select *
FROM Products
WHERE Price <= 1000 and Stock > 50
order by Stock asc;


SELECT *
FROM Products
WHERE ProductName LIKE '%e%';







    CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO Departments (DeptID, DeptName)
VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT');
SELECT* FROM Departments


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18),
    Salary DECIMAL(10,2) CHECK (Salary >= 300),
    Email VARCHAR(100) UNIQUE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (104, 'David', 22, 900.00, 'david@example.com', 1);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (105, 'Eve', 26, 1100.00, 'alice@example.com', 2);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (106, 'Frank', 16, 950.00, 'frank@example.com', 3);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (107, 'Grace', 29, 350.00, 'grace@example.com', 1);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (108, 'Henry', 24, 1300.00, 'henry@example.com', 3);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, Email, DeptID)
VALUES (101, 'Ivy', 27, 1050.00, 'ivy@example.com', 2);



select * from Employees

  where   Salary>=6000 and Departments='HR'


SELECT 
    EmployeeID,
    EmployeeName,
    Department,
    Salary,
    ISNULL(Email, 'noemail@example.com') AS Email
FROM 
    Employees;





Select COALESCE(FirstName, LastName) as FullName
FROM Employees;
Select *
from Employees
where Age between  30 and 40 or Department = 'Marketing';



SELECT *
FROM Employees
order by Salary desc
offset 10 rows fetch next 10 rows only;


SELECT *
FROM Employees
WHERE Department IN ('HR', 'IT', 'Finance');












