SELECT *, ROW_NUMBER() OVER (ORDER BY SaleDate) AS RowNum
FROM ProductSales;


SELECT ProductName, SUM(Quantity) AS TotalQuantity,
       DENSE_RANK() OVER (ORDER BY SUM(Quantity) DESC) AS Rank
FROM ProductSales
GROUP BY ProductName;


SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY SaleAmount DESC) AS rn
    FROM ProductSales
) t
WHERE rn = 1;

SELECT SaleID, SaleAmount,
       LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSaleAmount
FROM ProductSales;


SELECT SaleID, SaleAmount,
       LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PrevSaleAmount
FROM ProductSales;
6. Sales amounts greater than the previous sale’s amount:

SELECT *
FROM (
    SELECT *, LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PrevSaleAmount
    FROM ProductSales
) t
WHERE SaleAmount > PrevSaleAmount;

SELECT *, 
       SaleAmount - LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS DiffFromPrev
FROM ProductSales;

SELECT *, 
       ROUND(((LEAD(SaleAmount) OVER (ORDER BY SaleDate) - SaleAmount) / SaleAmount) * 100, 2) AS PercentChange
FROM ProductSales;

SELECT *,
       ROUND(SaleAmount * 1.0 / NULLIF(LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate), 0), 2) AS RatioToPrev
FROM ProductSales;

SELECT *, 
       SaleAmount - FIRST_VALUE(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS DiffFromFirst
FROM ProductSales;

SELECT *
FROM (
    SELECT *, 
           LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PrevSale
    FROM ProductSales
) t
WHERE SaleAmount > PrevSale;

SELECT *, 
       SUM(SaleAmount) OVER (ORDER BY SaleDate) AS RunningTotal
FROM ProductSales;

SELECT *, 
       ROUND(AVG(SaleAmount) OVER (ORDER BY SaleDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS MovingAvg3
FROM ProductSales;

SELECT *, 
       SaleAmount - AVG(SaleAmount) OVER () AS DiffFromAvg
FROM ProductSales;


SELECT *, DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees1;
2. Top 2 highest salaries in each department:

SELECT *
FROM (
    SELECT *, DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Rank
    FROM Employees1
) t
WHERE Rank <= 2;

SELECT *
FROM (
    SELECT *, RANK() OVER (PARTITION BY Department ORDER BY Salary ASC) AS Rank
    FROM Employees1
) t
WHERE Rank = 1;

SELECT *, 
       SUM(Salary) OVER (PARTITION BY Department ORDER BY HireDate) AS RunningTotal
FROM Employees1;

SELECT *, 
       SUM(Salary) OVER (PARTITION BY Department) AS DeptTotal
FROM Employees1;

SELECT *, 
       AVG(Salary) OVER (PARTITION BY Department) AS DeptAvg
FROM Employees1;

SELECT *, 
       Salary - AVG(Salary) OVER (PARTITION BY Department) AS DiffFromDeptAvg
FROM Employees1;

SELECT *, 
       ROUND(AVG(Salary) OVER (ORDER BY HireDate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING), 2) AS MovingAvg
FROM Employees1;

WITH RankedEmployees AS (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY HireDate DESC) AS rn
    FROM Employees1
)
SELECT SUM(Salary) AS SumOfLast3Hires
FROM RankedEmployees
WHERE rn <= 3;
