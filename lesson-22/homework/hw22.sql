SELECT 
    customer_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_total
FROM sales_data;


 SELECT 
    product_category,
    COUNT(*) AS order_count
FROM sales_data
GROUP BY product_category;



SELECT 
    product_category,
    MAX(total_amount) AS max_total_amount
FROM sales_data
GROUP BY product_category;


SELECT 
    product_category,
    MIN(unit_price) AS min_price
FROM sales_data
GROUP BY product_category;



SELECT 
    order_date,
    customer_id,
    total_amount,
    AVG(total_amount) OVER (ORDER BY order_date 
                            ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_avg
FROM sales_data;



SELECT 
    region,
    SUM(total_amount) AS total_sales
FROM sales_data
GROUP BY region;



SELECT 
    customer_id,
    customer_name,
    SUM(total_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(total_amount) DESC) AS rank_by_spending
FROM sales_data
GROUP BY customer_id, customer_name;






SELECT 
    customer_id,
    order_date,
    total_amount,
    total_amount - LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS diff_from_prev
FROM sales_data;



SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY product_category ORDER BY unit_price DESC) AS rnk
    FROM sales_data
) ranked
WHERE rnk <= 3;



SELECT 
    region,
    order_date,
    total_amount,
    SUM(total_amount) OVER (PARTITION BY region ORDER BY order_date) AS cumulative_sales
FROM sales_data;



SELECT 
    product_category,
    order_date,
    total_amount,
    SUM(total_amount) OVER (PARTITION BY product_category ORDER BY order_date) AS cumulative_revenue
FROM sales_data;



SELECT 
    Value,
    SUM(Value) OVER (ORDER BY (SELECT NULL) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS [Sum of Previous]
FROM OneColumn;


SELECT customer_id, customer_name
FROM sales_data
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT product_category) > 1;



WITH RegionalAvg AS (
    SELECT region, AVG(total_amount) AS avg_spending
    FROM sales_data
    GROUP BY region
)
SELECT s.customer_id, s.customer_name, s.region, s.total_amount
FROM sales_data s
JOIN RegionalAvg r ON s.region = r.region
WHERE s.total_amount > r.avg_spending;



SELECT 
    customer_id,
    customer_name,
    region,
    SUM(total_amount) AS total_spent,
    RANK() OVER (PARTITION BY region ORDER BY SUM(total_amount) DESC) AS regional_rank
FROM sales_data
GROUP BY customer_id, customer_name, region;



SELECT 
    customer_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS cumulative_sales
FROM sales_data;


SELECT 
    FORMAT(order_date, 'yyyy-MM') AS month,
    SUM(total_amount) AS monthly_sales,
    LAG(SUM(total_amount)) OVER (ORDER BY FORMAT(order_date, 'yyyy-MM')) AS prev_month_sales,
    ROUND(
        100.0 * (SUM(total_amount) - LAG(SUM(total_amount)) OVER (ORDER BY FORMAT(order_date, 'yyyy-MM')))
        / NULLIF(LAG(SUM(total_amount)) OVER (ORDER BY FORMAT(order_date, 'yyyy-MM')), 0), 2
    ) AS growth_rate
FROM sales_data
GROUP BY FORMAT(order_date, 'yyyy-MM');




SELECT *
FROM (
    SELECT *,
           LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_amount
    FROM sales_data
) sub
WHERE total_amount > previous_amount;






SELECT DISTINCT product_name, unit_price
FROM sales_data
WHERE unit_price > (
    SELECT AVG(unit_price) FROM sales_data
);



SELECT 
    Id, Grp, Val1, Val2,
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY Grp ORDER BY Id) = 1 
        THEN SUM(Val1 + Val2) OVER (PARTITION BY Grp)
        ELSE NULL
    END AS Tot
FROM MyData;



SELECT 
    ID,
    SUM(Cost) AS Cost,
    SUM(DISTINCT Quantity) AS Quantity
FROM TheSumPuzzle
GROUP BY ID;



WITH Numbered AS (
    SELECT SeatNumber,
           ROW_NUMBER() OVER (ORDER BY SeatNumber) AS rn
    FROM Seats
),
Grouped AS (
    SELECT *,
           SeatNumber - rn AS grp
    FROM Numbered
)
SELECT 
    MIN(SeatNumber) + 1 AS [Gap Start],
    MAX(SeatNumber) - 1 AS [Gap End]
FROM (
    SELECT SeatNumber
    FROM (
        SELECT n1.SeatNumber
        FROM Numbered n1
        LEFT JOIN Numbered n2 ON n1.SeatNumber = n2.SeatNumber + 1
        WHERE n2.SeatNumber IS NULL

        UNION

        SELECT n1.SeatNumber
        FROM Numbered n1
        LEFT JOIN Numbered n2 ON n1.SeatNumber = n2.SeatNumber - 1
        WHERE n2.SeatNumber IS NULL
    ) missing
) gaps
GROUP BY (SeatNumber / 1)  -- To group separately for each gap
ORDER BY [Gap Start];




