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


SELECT CustomerID, Vendor
FROM Orders o
WHERE Vendor = (
  SELECT TOP 1 Vendor
  FROM Orders
  WHERE CustomerID = o.CustomerID
  GROUP BY Vendor
  ORDER BY SUM([Count]) DESC
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



SELECT Device_id,
  (SELECT COUNT(DISTINCT Locations) FROM Device d2 WHERE d2.Device_id = d.Device_id) AS no_of_location,
  (SELECT TOP 1 Locations FROM Device d3 WHERE d3.Device_id = d.Device_id GROUP BY Locations ORDER BY COUNT(*) DESC) AS max_signal_location,
  (SELECT COUNT(*) FROM Device d4 WHERE d4.Device_id = d.Device_id) AS no_of_signals
FROM Device d
GROUP BY Device_id;




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


