SELECT DISTINCT s1.CustomerName
FROM #Sales s1
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s1.CustomerName = s2.CustomerName
      AND s2.SaleDate BETWEEN '2024-03-01' AND '2024-03-31'
);



SELECT Product
FROM #Sales
GROUP BY Product
HAVING SUM(Quantity * Price) = (
    SELECT MAX(TotalRevenue)
    FROM (
        SELECT Product, SUM(Quantity * Price) AS TotalRevenue
        FROM #Sales
        GROUP BY Product
    ) AS RevenueData
);


SELECT MAX(SaleAmount) AS SecondHighestAmount
FROM (
    SELECT DISTINCT Quantity * Price AS SaleAmount
    FROM #Sales
) AS Amounts
WHERE SaleAmount < (
    SELECT MAX(Quantity * Price)
    FROM #Sales
);


SELECT 
    FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth,
    SUM(Quantity) AS TotalQuantity
FROM #Sales
GROUP BY FORMAT(SaleDate, 'yyyy-MM');



SELECT DISTINCT s1.CustomerName
FROM #Sales s1
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s1.CustomerName <> s2.CustomerName
      AND s1.Product = s2.Product
);



SELECT Name,
       COUNT(CASE WHEN Fruit = 'Apple' THEN 1 END) AS Apple,
       COUNT(CASE WHEN Fruit = 'Orange' THEN 1 END) AS Orange,
       COUNT(CASE WHEN Fruit = 'Banana' THEN 1 END) AS Banana
FROM Fruits
GROUP BY Name;





WITH RecursiveFamily AS (
    SELECT ParentId, ChildID
    FROM Family
    UNION ALL
    SELECT f.ParentId, r.ChildID
    FROM Family f
    JOIN RecursiveFamily r ON f.ChildID = r.ParentID
)
SELECT * FROM RecursiveFamily
ORDER BY ParentId, ChildID;



SELECT *
FROM #Orders o1
WHERE o1.DeliveryState = 'TX'
  AND EXISTS (
      SELECT 1
      FROM #Orders o2
      WHERE o1.CustomerID = o2.CustomerID
        AND o2.DeliveryState = 'CA'
  );



UPDATE #residents
SET address = address + ' name=' + fullname
WHERE address NOT LIKE '%name=%';


WITH RoutePaths AS (
    SELECT 
        DepartureCity,
        ArrivalCity,
        CAST(DepartureCity + ' - ' + ArrivalCity AS VARCHAR(MAX)) AS Route,
        Cost
    FROM #Routes
    WHERE DepartureCity = 'Tashkent'

    UNION ALL

    SELECT 
        r.DepartureCity,
        r.ArrivalCity,
        CAST(rp.Route + ' - ' + r.ArrivalCity AS VARCHAR(MAX)) AS Route,
        rp.Cost + r.Cost
    FROM RoutePaths rp
    JOIN #Routes r ON rp.ArrivalCity = r.DepartureCity
    WHERE rp.Route NOT LIKE '%'+r.ArrivalCity+'%' -- prevent cycles
)
-- Now filter only the complete paths to Khorezm
, FinalPaths AS (
    SELECT Route, Cost
    FROM RoutePaths
    WHERE ArrivalCity = 'Khorezm'
)
-- Select cheapest route
SELECT * FROM FinalPaths
WHERE Cost = (SELECT MIN(Cost) FROM FinalPaths)

UNION ALL

-- Select most expensive route
SELECT * FROM FinalPaths
WHERE Cost = (SELECT MAX(Cost) FROM FinalPaths)
AND Cost <> (SELECT MIN(Cost) FROM FinalPaths); -- Avoid duplicate if only 1 path exists

)


WITH Ranked AS (
    SELECT *,
           SUM(CASE WHEN Vals = 'Product' THEN 1 ELSE 0 END) 
           OVER (ORDER BY ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ProductGroup
    FROM #RankingPuzzle
)
SELECT ProductGroup, Vals
FROM Ranked
WHERE Vals != 'Product';



SELECT *
FROM #EmployeeSales e
WHERE SalesAmount > (
    SELECT AVG(SalesAmount)
    FROM #EmployeeSales
    WHERE Department = e.Department
);



SELECT *
FROM #EmployeeSales e
WHERE EXISTS (
    SELECT 1
    FROM #EmployeeSales s
    WHERE s.SalesMonth = e.SalesMonth AND s.SalesYear = e.SalesYear
    GROUP BY s.SalesMonth, s.SalesYear
    HAVING MAX(s.SalesAmount) = e.SalesAmount
);



SELECT DISTINCT e.EmployeeName
FROM #EmployeeSales e
WHERE NOT EXISTS (
    SELECT DISTINCT SalesMonth
    FROM #EmployeeSales
    WHERE SalesMonth NOT IN (
        SELECT SalesMonth
        FROM #EmployeeSales s
        WHERE s.EmployeeName = e.EmployeeName
    )
);


SELECT Name
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);


SELECT Name
FROM Products
WHERE Stock < (SELECT MAX(Stock) FROM Products);


SELECT Name
FROM Products
WHERE Category = (
    SELECT Category FROM Products WHERE Name = 'Laptop'
);


SELECT Name
FROM Products
WHERE Price > (
    SELECT MIN(Price)
    FROM Products
    WHERE Category = 'Electronics'
);



SELECT Name
FROM Products p
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
    WHERE Category = p.Category
);


SELECT DISTINCT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID;



SELECT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.Name
HAVING SUM(o.Quantity) > (
    SELECT AVG(TotalQty)
    FROM (
        SELECT ProductID, SUM(Quantity) AS TotalQty
        FROM Orders
        GROUP BY ProductID
    ) AS Sub
)


SELECT Name
FROM Products
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID FROM Orders
)


