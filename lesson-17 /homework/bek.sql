SELECT 
    r.Region,
    d.Distributor,
    ISNULL(rs.Sales, 0) AS Sales
FROM 
    (SELECT DISTINCT Region FROM RegionSales) r
CROSS JOIN 
    (SELECT DISTINCT Distributor FROM RegionSales) d
LEFT JOIN 
    RegionSales rs 
    ON rs.Region = r.Region AND rs.Distributor = d.Distributor
ORDER BY 
    d.Distributor, r.Region;


SELECT name
FROM Employee e
WHERE (SELECT COUNT(*) FROM Employee WHERE managerId = e.id) >= 5;



SELECT product_name
FROM Products p
WHERE (SELECT SUM(unit)
       FROM Orders
       WHERE product_id = p.product_id 
         AND order_date BETWEEN '2020-02-01' AND '2020-02-29') >= 100;



with cte as(
select *, 
(Select count(locations) from device as dev where dev.Device_id=device.Device_id and dev.Locations=device.Locations) as cnt_loc
from Device
)
select distinct cte.Device_id,cte.Locations, aggregated.cnt_locs,aggregated.cnt_distc_loc from cte

JOIN (select Device_id, count(Locations) as cnt_locs, count(distinct locations) as cnt_distc_loc  from Device group by Device_id) as aggregated
on cte.Device_id=aggregated.Device_id

where cnt_loc=(select max(cnt_loc) from cte as cte1 where cte.Device_id=cte1.Device_id)






DECLARE @n INT = 91;
IF @n < 2
  PRINT 'Not Prime';
ELSE IF EXISTS (
  SELECT 1
  FROM master..spt_values
  WHERE type='P' AND number BETWEEN 2 AND SQRT(@n)
    AND @n % number = 0
)
  PRINT 'Not Prime';
ELSE
  PRINT 'Prime';



;with cte as(
select *, (select sum([COUNT]) from Orders as ord2 where ord1.CustomerID=ord2.CustomerID and ord1.Vendor=ord2.Vendor) as Total
from Orders as ord1
)
select distinct CustomerID,Vendor from cte
where Total=(select Max(Total) from cte as cte1 where cte.CustomerID=cte1.CustomerID)


SELECT EmpID, EmpName, Salary
FROM Employee e
WHERE Salary > (SELECT AVG(Salary) FROM Employee WHERE DeptID = e.DeptID);





SELECT EmpID, EmpName, Salary
FROM Employee e
WHERE Salary > (
  SELECT AVG(Salary)
  FROM Employee
  WHERE DeptID = e.DeptID
);



with cte as(
select TicketID, count(ValidNumbers.Number) as Winning_num_cnt from Tickets
LEFT JOIN
 ValidNumbers
on Tickets.Number=ValidNumbers.Number
group by TicketID
)
select sum(case when Winning_num_cnt=0 then 0
        when Winning_num_cnt=3 then 100
        else 10 end) as Total_winning from cte




WITH Platforms AS (
  SELECT User_id, Spend_date,
    MAX(CASE WHEN Platform = 'Mobile' THEN 1 ELSE 0 END) AS Mobile,
    MAX(CASE WHEN Platform = 'Desktop' THEN 1 ELSE 0 END) AS Desktop,
    SUM(Amount) AS TotalAmount
  FROM Spending
  GROUP BY User_id, Spend_date
)
SELECT Spend_date, 'Mobile' AS Platform,
       SUM(CASE WHEN Mobile = 1 AND Desktop = 0 THEN TotalAmount ELSE 0 END) AS Total_Amount,
       COUNT(DISTINCT CASE WHEN Mobile = 1 AND Desktop = 0 THEN User_id END) AS Total_users
FROM Platforms
GROUP BY Spend_date
UNION
SELECT Spend_date, 'Desktop',
       SUM(CASE WHEN Desktop = 1 AND Mobile = 0 THEN TotalAmount ELSE 0 END),
       COUNT(DISTINCT CASE WHEN Desktop = 1 AND Mobile = 0 THEN User_id END)
FROM Platforms
GROUP BY Spend_date
UNION
SELECT Spend_date, 'Both',
       SUM(CASE WHEN Desktop = 1 AND Mobile = 1 THEN TotalAmount ELSE 0 END),
       COUNT(DISTINCT CASE WHEN Desktop = 1 AND Mobile = 1 THEN User_id END)
FROM Platforms
GROUP BY Spend_date
ORDER BY Spend_date, Platform;




WITH RECURSIVE Unrolled(Product, Quantity) AS (
  SELECT Product, 1
  FROM Grouped
  WHERE Quantity > 0
  UNION ALL
  SELECT Product, Quantity + 1
  FROM Unrolled
  JOIN Grouped g ON g.Product = Unrolled.Product
  WHERE Quantity + 1 <= g.Quantity
)
SELECT Product, 1 AS Quantity
FROM Unrolled
ORDER BY Product;




