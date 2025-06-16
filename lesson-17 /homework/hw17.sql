SELECT 
  r.Region,
  d.Distributor,
  ISNULL(rs.Sales, 0) AS Sales
FROM 
  (SELECT DISTINCT Region FROM #RegionSales) r
JOIN 
  (SELECT DISTINCT Distributor FROM #RegionSales) d ON 1 = 1
LEFT JOIN 
  #RegionSales rs ON rs.Region = r.Region AND rs.Distributor = d.Distributor
ORDER BY 
  d.Distributor, r.Region;


SELECT name
FROM Employee e
WHERE (
  SELECT COUNT(*) 
  FROM Employee 
  WHERE managerId = e.id
) >= 5;



SELECT 
  p.product_name,
  SUM(o.unit) AS unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;


SELECT CustomerID, Vendor
FROM (
  SELECT 
    CustomerID, 
    Vendor, 
    COUNT(*) AS OrderCount,
    RANK() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rnk
  FROM Orders
  GROUP BY CustomerID, Vendor
) t
WHERE rnk = 1;



DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2;
DECLARE @isPrime BIT = 1;

WHILE @i <= SQRT(@Check_Prime)
BEGIN
  IF @Check_Prime % @i = 0
  BEGIN
    SET @isPrime = 0;
    BREAK;
  END
  SET @i += 1;
END

IF @isPrime = 1
  PRINT 'This number is prime';
ELSE
  PRINT 'This number is not prime';


WITH SignalCounts AS (
  SELECT Device_id, Locations, COUNT(*) AS SignalCount
  FROM Device
  GROUP BY Device_id, Locations
),
MaxSignalLocation AS (
  SELECT sc1.Device_id, sc1.Locations
  FROM SignalCounts sc1
  LEFT JOIN SignalCounts sc2
    ON sc1.Device_id = sc2.Device_id
   AND sc1.SignalCount < sc2.SignalCount
  WHERE sc2.Device_id IS NULL
)
SELECT 
  d.Device_id,
  COUNT(DISTINCT d.Locations) AS no_of_location,
  m.Locations AS max_signal_location,
  COUNT(*) AS no_of_signals
FROM Device d
JOIN MaxSignalLocation m
  ON d.Device_id = m.Device_id
GROUP BY d.Device_id, m.Locations;



SELECT e.EmpID, e.EmpName, e.Salary
FROM Employee e
JOIN (
  SELECT DeptID, AVG(Salary) AS AvgSal
  FROM Employee
  GROUP BY DeptID
) d ON e.DeptID = d.DeptID
WHERE e.Salary > d.AvgSal;



WITH Winning AS (SELECT Number FROM WinningNumbers),
Matches AS (
  SELECT TicketID, COUNT(*) AS matched
  FROM Tickets
  WHERE Number IN (SELECT Number FROM Winning)
  GROUP BY TicketID
),
Winnings AS (
  SELECT 
    CASE 
      WHEN matched = 3 THEN 100
      WHEN matched > 0 THEN 10
      ELSE 0 
    END AS Prize
  FROM Matches
)
SELECT SUM(Prize) AS TotalWinnings FROM Winnings;





WITH Numbers AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM Numbers WHERE n < 100
),
Expanded AS (
  SELECT g.Product
  FROM Grouped g
  JOIN Numbers n ON n.n <= g.Quantity
)
SELECT Product, 1 AS Quantity
FROM Expanded
ORDER BY Product;
