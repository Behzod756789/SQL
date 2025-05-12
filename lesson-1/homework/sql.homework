Create Table Employees(EmpID Int, Name Varchar(50), Salary Decimal(10,2))

Select * from Employees

Insert Into Employees(EmpID, Name, Salary) Values(1, 'Alice', 5000.00)
Insert Into Employees Values(2, 'Bob', 6000.00)
Insert Into Employees(EmpID, Name, Salary) Values(3, 'Kamron',$400), (4, 'Murod', $600)

Update Employees
Set Salary = 7000 
Where EmpID = 1

Delete From Employees 
Where EmpID = 2

Alter Table Employees Alter Column Name Varchar(100)
Alter Table Employees Add Department Varchar(50)
Alter Table Employees Alter Column Salary Float

Create Table Departments(DepartmentID Int , DepartmentName Varchar(50))

Truncate Table Employees
INSERT INTO Departments(DepartmentID, DepartmentName) VALUES(1, 'HR')
INSERT INTO Departments(DepartmentID, DepartmentName) VALUES(2, 'Finance')
INSERT INTO Departments(DepartmentID, DepartmentName) VALUES(3, 'IT')
INSERT INTO Departments(DepartmentID, DepartmentName) VALUES(4, 'Marketing')
INSERT INTO Departments(DepartmentID, DepartmentName) VALUES(5, 'Logistics')


UPDATE Employees 
SET Department = 'Management' 
WHERE Salary > 5000

TRUNCATE TABLE Employees


ALTER TABLE Employees DROP COLUMN Department


EXEC sp_rename 'Employees', 'StaffMembers'


DROP TABLE Departments




3-task 


Create Table Products(ProductID Int Primary Key, ProductName Varchar(100), Category Varchar(50), Price Decimal(10,2) Check(Price > 0), Description Varchar(255));


Alter Table Products Add StockQuantity Int;


Exec sp_rename 'Products.Category', 'ProductCategory', 'Column';




Insert Into Products(ProductID, ProductName, ProductCategory, Price, Description, StockQuantity) 
Values
(1, 'Noutbuk', 'Electronics', $1200, '15-dyuymli ekranga ega', 50),
(2, 'Naushnik', 'Audio', $150, 'Shovqinni bekor qiluvchi', 50),
(3, 'Daftarl', 'konstavar', $2, '96 varaq', 50),
-
Select * Into Products_Backup From Products;


Exec sp_rename 'Products', 'Inventory';


Alter Table Inventory Alter Column Price Float;

-
Alter Table Inventory Add ProductCode Int Identity(1000,5);
