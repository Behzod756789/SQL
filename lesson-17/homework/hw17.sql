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



WITH cte AS (
  SELECT 
    CustomerID, 
    Vendor, 
    SUM([Count]) AS TotalCount
  FROM Orders
  GROUP BY CustomerID, Vendor
)
SELECT CustomerID, Vendor
FROM cte
WHERE TotalCount = (
  SELECT MAX(TotalCount)
  FROM cte AS inner_cte
  WHERE inner_cte.CustomerID = cte.CustomerID
);






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



WITH cte AS (
  SELECT 
    User_id,
    Spend_date,
    CASE 
      WHEN COUNT(DISTINCT Platform) = 2 THEN 'Both'
      ELSE MAX(Platform)
    END AS Platform,
    SUM(Amount) AS Total_Amount
  FROM Spending
  GROUP BY User_id, Spend_date
)
SELECT 
  Spend_date,
  Platform,
  SUM(Total_Amount) AS Total_Amount,
  COUNT(User_id) AS Total_Users
FROM cte
GROUP BY Spend_date, Platform
ORDER BY Spend_date, Platform;


WITH cte AS (
  SELECT Product, 1 AS Quantity
  FROM Grouped
  WHERE Quantity > 0
  UNION ALL
  SELECT cte.Product, cte.Quantity + 1
  FROM cte
  JOIN Grouped g ON cte.Product = g.Product
  WHERE cte.Quantity + 1 <= g.Quantity
)
SELECT Product, 1 AS Quantity
FROM cte
ORDER BY Product;




