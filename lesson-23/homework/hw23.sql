SELECT 
    Id, 
    Dt,
    RIGHT('0' + CAST(MONTH(Dt) AS VARCHAR), 2) AS MonthPrefixedWithZero
FROM Dates;



SELECT 
    COUNT(DISTINCT Id) AS Distinct_Ids,
    rID,
    SUM(MaxVal) AS TotalOfMaxVals
FROM (
    SELECT Id, rID, MAX(Vals) AS MaxVal
    FROM MyTabel
    GROUP BY Id, rID
) AS Sub
GROUP BY rID;



SELECT Id, Vals
FROM TestFixLengths
WHERE LEN(Vals) BETWEEN 6 AND 10;



SELECT t.ID, t.Item, t.Vals
FROM TestMaximum t
JOIN (
    SELECT ID, MAX(Vals) AS MaxVals
    FROM TestMaximum
    GROUP BY ID
) m ON t.ID = m.ID AND t.Vals = m.MaxVals;



SELECT Id, SUM(MaxVal) AS SumofMax
FROM (
    SELECT Id, DetailedNumber, MAX(Vals) AS MaxVal
    FROM SumOfMax
    GROUP BY Id, DetailedNumber
) AS Sub
GROUP BY Id;




SELECT 
    Id, 
    a, 
    b,
    CASE 
        WHEN a - b = 0 THEN '' 
        ELSE CAST(a - b AS VARCHAR)
    END AS OUTPUT
FROM TheZeroPuzzle;



SELECT SUM(QuantitySold * UnitPrice) AS TotalRevenue
FROM Sales;



SELECT AVG(UnitPrice) AS AverageUnitPrice
FROM Sales;



SELECT MAX(QuantitySold) AS MaxUnitsSold
FROM Sales;



SELECT Category, SUM(QuantitySold) AS TotalUnitsSold
FROM Sales
GROUP BY Category;



SELECT Region, SUM(QuantitySold * UnitPrice) AS TotalRevenue
FROM Sales
GROUP BY Region;



SELECT TOP 1 Product, SUM(QuantitySold * UnitPrice) AS ProductRevenue
FROM Sales
GROUP BY Product
ORDER BY ProductRevenue DESC;



SELECT 
    SaleDate, 
    Product, 
    QuantitySold * UnitPrice AS Revenue,
    SUM(QuantitySold * UnitPrice) OVER (ORDER BY SaleDate) AS RunningTotalRevenue
FROM Sales;



SELECT 
    Category,
    SUM(QuantitySold * UnitPrice) AS CategoryRevenue,
    ROUND(100.0 * SUM(QuantitySold * UnitPrice) / 
         (SELECT SUM(QuantitySold * UnitPrice) FROM Sales), 2) AS PercentageContribution
FROM Sales
GROUP BY Category;



SELECT 
    S.SaleID,
    S.Product,
    S.Category,
    S.QuantitySold,
    S.UnitPrice,
    S.SaleDate,
    S.Region,
    C.CustomerName
FROM Sales S
JOIN Customers C ON S.CustomerID = C.CustomerID;




SELECT C.CustomerID, C.CustomerName
FROM Customers C
LEFT JOIN Sales S ON C.CustomerID = S.CustomerID
WHERE S.CustomerID IS NULL;




SELECT 
    C.CustomerID,
    C.CustomerName,
    SUM(S.QuantitySold * S.UnitPrice) AS TotalRevenue
FROM Customers C
JOIN Sales S ON C.CustomerID = S.CustomerID
GROUP BY C.CustomerID, C.CustomerName;




SELECT TOP 1 
    C.CustomerID,
    C.CustomerName,
    SUM(S.QuantitySold * S.UnitPrice) AS TotalRevenue
FROM Customers C
JOIN Sales S ON C.CustomerID = S.CustomerID
GROUP BY C.CustomerID, C.CustomerName
ORDER BY TotalRevenue DESC;




SELECT 
    C.CustomerID,
    C.CustomerName,
    COUNT(S.SaleID) AS TotalTransactions,
    SUM(S.QuantitySold) AS TotalUnits,
    SUM(S.QuantitySold * S.UnitPrice) AS TotalRevenue
FROM Customers C
JOIN Sales S ON C.CustomerID = S.CustomerID
GROUP BY C.CustomerID, C.CustomerName;



SELECT DISTINCT P.ProductID, P.ProductName, P.Category
FROM Products P
JOIN Sales S ON P.ProductName = S.Product;



SELECT TOP 1 *
FROM Products
ORDER BY SellingPrice DESC;




SELECT *
FROM Products
WHERE SellingPrice = (SELECT MAX(SellingPrice) FROM Products);



SELECT P.*
FROM Products P
JOIN (
    SELECT Category, AVG(SellingPrice) AS AvgPrice
    FROM Products
    GROUP BY Category
) A ON P.Category = A.Category
WHERE P.SellingPrice > A.AvgPrice;





