CREATE TABLE #MonthlySales (
    ProductID INT,
    TotalQuantity INT,
    TotalRevenue DECIMAL(18,2)
);

INSERT INTO #MonthlySales (ProductID, TotalQuantity, TotalRevenue)
SELECT 
    s.ProductID,
    SUM(s.Quantity) AS TotalQuantity,
    SUM(s.Quantity * p.Price) AS TotalRevenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE MONTH(s.SaleDate) = MONTH(GETDATE())
  AND YEAR(s.SaleDate) = YEAR(GETDATE())
GROUP BY s.ProductID;

SELECT * FROM #MonthlySales;




CREATE VIEW vw_ProductSalesSummary AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(s.Quantity) AS TotalQuantitySold
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category;



CREATE FUNCTION fn_GetTotalRevenueForProduct (@ProductID INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @Revenue DECIMAL(18,2);

    SELECT @Revenue = SUM(s.Quantity * p.Price)
    FROM Sales s
    JOIN Products p ON s.ProductID = p.ProductCREATE FUNCTION dbo.fn_IsPrime (@Number INT)
RETURNS VARCHAR(3)
AS
BEGIN
    IF @Number <= 1 RETURN 'No';
    IF @Number = 2 RETURN 'Yes';

    DECLARE @i INT = 2;
    WHILE @i * @i <= @Number
    BEGIN
        IF @Number % @i = 0 RETURN 'No';
        SET @i = @i + 1;
    END
    RETURN 'Yes';
END;
ID
    WHERE s.ProductID = @ProductID;

    RETURN @Revenue;
END;



CREATE FUNCTION fn_GetSalesByCategory (@Category VARCHAR(50))
RETURNS TABLE
AS
RETURN
    SELECT 
        p.ProductName,
        SUM(s.Quantity) AS TotalQuantity,
        SUM(s.Quantity * p.Price) AS TotalRevenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
    WHERE p.Category = @Category
    GROUP BY p.ProductName;



CREATE FUNCTION getNthHighestSalary (@N INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT DISTINCT salary
        FROM (
            SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
            FROM Employee
        ) t
        WHERE rnk = @N
    );
END;



CREATE FUNCTION fn_GetNumbersBetween (@Start INT, @End INT)
RETURNS @Result TABLE (Number INT)
AS
BEGIN
    DECLARE @i INT = @Start;
    WHILE @i <= @End
    BEGIN
        INSERT INTO @Result VALUES (@i);
        SET @i = @i + 1;
    END
    RETURN;
END;




CREATE FUNCTION getNthHighestSalary (@N INT)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT;

    SELECT @Result = MIN(salary)
    FROM (
        SELECT DISTINCT salary
        FROM Employee
    ) AS DistinctSalaries
    WHERE @N = (
        SELECT COUNT(DISTINCT salary)
        FROM Employee
        WHERE salary > DistinctSalaries.salary
    );

    RETURN @Result;
END;




SELECT TOP 1 id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id FROM RequestAccepted
) AS AllFriends
GROUP BY id
ORDER BY COUNT(*) DESC;




CREATE VIEW vw_CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS total_amount,
    MAX(o.order_date) AS last_order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;




SELECT 
    RowNumber,
    FIRST_VALUE(TestCase) OVER (
        ORDER BY RowNumber
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Workflow
FROM (
    SELECT 
        RowNumber, 
        TestCase,
        MAX(CASE WHEN TestCase IS NOT NULL THEN RowNumber END) 
            OVER (ORDER BY RowNumber ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS grp
    FROM Gaps
) g
JOIN (
    SELECT 
        RowNumber AS grp,
        TestCase
    FROM Gaps
    WHERE TestCase IS NOT NULL
) base ON g.grp = base.grp;







