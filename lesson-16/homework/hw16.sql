WITH Numbers AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num + 1
    FROM Numbers
    WHERE Num < 1000
)
SELECT * FROM Numbers;



WITH Numbers AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num + 1
    FROM Numbers
    WHERE Num < 1000
)
SELECT * FROM Numbers;



WITH AvgSalaryCTE AS (
    SELECT AVG(Salary) AS AvgSalary
    FROM Employees
)
SELECT * FROM AvgSalaryCTE;



WITH MaxSales AS (
    SELECT ProductID, MAX(SalesAmount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
)
SELECT p.ProductName, m.MaxSale
FROM Products p
JOIN MaxSales m ON p.ProductID = m.ProductID;



WITH Doubled AS (
    SELECT 1 AS Val
    UNION ALL
    SELECT Val * 2
    FROM Doubled
    WHERE Val * 2 < 1000000
)
SELECT * FROM Doubled;



WITH SalesCount AS (
    SELECT EmployeeID, COUNT(*) AS SaleCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.EmployeeID, e.FirstName, e.LastName, s.SaleCount
FROM SalesCount s
JOIN Employees e ON e.EmployeeID = s.EmployeeID
WHERE s.SaleCount > 5;



WITH ProductSales AS (
    SELECT ProductID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
)
SELECT p.ProductName, ps.TotalSales
FROM ProductSales ps
JOIN Products p ON ps.ProductID = p.ProductID
WHERE ps.TotalSales > 500;



WITH AvgSalaryCTE AS (
    SELECT AVG(Salary) AS AvgSalary
    FROM Employees
)
SELECT *
FROM Employees
WHERE Salary > (SELECT AvgSalary FROM AvgSalaryCTE);





WITH OrderCounts AS (
    SELECT EmployeeID, COUNT(*) AS TotalOrders
    FROM Sales
    GROUP BY EmployeeID
)
SELECT TOP 5 e.EmployeeID, e.FirstName, e.LastName, o.TotalOrders
FROM OrderCounts o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
ORDER BY o.TotalOrders DESC;




WITH CategorySales AS (
    SELECT p.CategoryID, SUM(s.SalesAmount) AS TotalSales
    FROM Sales s
    JOIN Products p ON s.ProductID = p.ProductID
    GROUP BY p.CategoryID
)
SELECT c.CategoryID, c.TotalSales
FROM CategorySales c;




WITH MonthlySales AS (
    SELECT 
        YEAR(SaleDate) AS SalesYear,
        MONTH(SaleDate) AS SalesMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY YEAR(SaleDate), MONTH(SaleDate)
),

PrevMonthSales AS (
    SELECT 
        cur.SalesYear,
        cur.SalesMonth,
        cur.TotalSales,
        prev.TotalSales AS PrevMonthSales
    FROM MonthlySales cur
    LEFT JOIN MonthlySales prev
      ON (
        -- If same year, previous month
        (cur.SalesYear = prev.SalesYear AND cur.SalesMonth = prev.SalesMonth + 1)
        OR
        -- If current is January, match with December of previous year
        (cur.SalesYear = prev.SalesYear + 1 AND cur.SalesMonth = 1 AND prev.SalesMonth = 12)
      )
)


SELECT 
    SalesYear,
    SalesMonth,
    TotalSales,
    PrevMonthSales,
    TotalSales - PrevMonthSales AS SalesDifference
FROM PrevMonthSales
WHERE PrevMonthSales IS NOT NULL;



WITH QuarterlySales AS (
    SELECT 
        EmployeeID,
        DATEPART(QUARTER, SaleDate) AS Quarter,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
)
SELECT e.EmployeeID, e.FirstName, e.LastName, q.Quarter, q.TotalSales
FROM QuarterlySales q
JOIN Employees e ON e.EmployeeID = q.EmployeeID
WHERE q.TotalSales > 45000;



WITH Fibonacci (n, f1, f2) AS (
    SELECT 1 AS n, 0 AS f1, 1 AS f2
    UNION ALL
    SELECT n + 1, f2, f1 + f2
    FROM Fibonacci
    WHERE n < 20
)
SELECT n, f1 AS Fibonacci
FROM Fibonacci;


SELECT *
FROM FindSameCharacters
WHERE LEN(Vals) > 1 
  AND Vals IS NOT NULL 
  AND LEFT(Vals, 1) = RIGHT(REPLACE(Vals, LEFT(Vals, 1), ''), 0);



DECLARE @n INT = 5;

WITH Numbers AS (
    SELECT 1 AS Num, CAST('1' AS VARCHAR(MAX)) AS Seq
    UNION ALL
    SELECT Num + 1, Seq + CAST(Num + 1 AS VARCHAR)
    FROM Numbers
    WHERE Num + 1 <= @n
)
SELECT Seq
FROM Numbers;



-- Get today's date dynamically if needed
DECLARE @SixMonthsAgo DATE = DATEADD(MONTH, -6, '2025-06-14');

SELECT TOP 1 WITH TIES 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    COUNT(s.SalesID) AS TotalSales
FROM Employees e
JOIN Sales s ON e.EmployeeID = s.EmployeeID
WHERE s.SaleDate >= @SixMonthsAgo
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY COUNT(s.SalesID) DESC;




