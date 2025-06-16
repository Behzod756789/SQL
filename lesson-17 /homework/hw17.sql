SELECT 
  r.Region,
  d.Distributor,
  ISNULL((
    SELECT Sales 
    FROM #RegionSales rs 
    WHERE rs.Region = r.Region AND rs.Distributor = d.Distributor
  ), 0) AS Sales
FROM 
  (SELECT DISTINCT Region FROM #RegionSales) r,
  (SELECT DISTINCT Distributor FROM #RegionSales) d
ORDER BY d.Distributor, r.Region;


SELECT name
FROM Employee e
WHERE (
  SELECT COUNT(*) 
  FROM Employee 
  WHERE managerId = e.id
) >= 5;



SELECT product_name,
       (SELECT SUM(unit)
        FROM Orders o
        WHERE o.product_id = p.product_id 
          AND order_date >= '2020-02-01' 
          AND order_date < '2020-03-01') AS unit
FROM Products p
WHERE (
  SELECT SUM(unit)
  FROM Orders o
  WHERE o.product_id = p.product_id 
    AND order_date >= '2020-02-01' 
    AND order_date < '2020-03-01'
) >= 100;


SELECT CustomerID, Vendor
FROM Orders o
WHERE Vendor = (
  SELECT TOP 1 Vendor
  FROM Orders
  WHERE CustomerID = o.CustomerID
  GROUP BY Vendor
  ORDER BY SUM([Count]) DESC
)
GROUP BY CustomerID, Vendor;



DECLARE @Check_Prime INT = 91;

IF @Check_Prime < 2
  PRINT 'This number is not prime';
ELSE IF EXISTS (
  SELECT 1
  FROM master..spt_values
  WHERE type = 'P' AND number BETWEEN 2 AND SQRT(@Check_Prime)
    AND @Check_Prime % number = 0
)
  PRINT 'This number is not prime';
ELSE
  PRINT 'This number is prime';





SELECT 
  d.Device_id,
  (SELECT COUNT(DISTINCT Locations) 
   FROM Device d2 
   WHERE d2.Device_id = d.Device_id) AS no_of_location,
  (SELECT TOP 1 Locations 
   FROM Device d3 
   WHERE d3.Device_id = d.Device_id 
   GROUP BY Locations 
   ORDER BY COUNT(*) DESC) AS max_signal_location,
  (SELECT COUNT(*) 
   FROM Device d4 
   WHERE d4.Device_id = d.Device_id) AS no_of_signals
FROM Device d
GROUP BY d.Device_id;




SELECT EmpID, EmpName, Salary
FROM Employee e
WHERE Salary > (
  SELECT AVG(Salary) 
  FROM Employee 
  WHERE DeptID = e.DeptID
);



SELECT SUM(
  CASE 
    WHEN match_count = 3 THEN 100
    WHEN match_count > 0 THEN 10
    ELSE 0
  END
) AS TotalWinnings
FROM (
  SELECT TicketID,
         (SELECT COUNT(*) 
          FROM WinningNumbers wn 
          WHERE wn.Number IN (
              SELECT Number 
              FROM Tickets t2 
              WHERE t2.TicketID = t.TicketID
          )
         ) AS match_count
  FROM (SELECT DISTINCT TicketID FROM Tickets) t
) x;



SELECT g.Product, 1 AS Quantity
FROM Grouped g
JOIN (
  SELECT number
  FROM master..spt_values
  WHERE type = 'P'
) n ON n.number < g.Quantity;
