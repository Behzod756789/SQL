SELECT
  LEFT(Name, CHARINDEX(',', Name) - 1) AS Name,
  LTRIM(SUBSTRING(Name, CHARINDEX(',', Name) + 1, LEN(Name))) AS Surname
FROM TestMultipleColumns
WHERE CHARINDEX(',', Name) > 0;


SELECT * FROM TestPercent WHERE string_column LIKE '%[%]%';


SELECT value FROM Splitter CROSS APPLY STRING_SPLIT(string_column, '.');


SELECT TRANSLATE(string_column, '0123456789', 'XXXXXXXXXX') FROM [1234ABC123456XYZ1234567890ADS];


SELECT * FROM testDots WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;


SELECT LEN(text_column) - LEN(REPLACE(text_column, ' ', '')) AS SpaceCount FROM CountSpaces;


SELECT e.* FROM Employee e JOIN Employee m ON e.ManagerID = m.EmployeeID WHERE e.Salary > m.Salary;


SELECT EmployeeID, FirstName, LastName, HireDate, DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsOfService
FROM Employees
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) BETWEEN 11 AND 14;



SELECT
  CONCAT_WS('', STRING_AGG(CASE WHEN value LIKE '[0-9]' THEN value ELSE '' END, '')) AS Integers,
  CONCAT_WS('', STRING_AGG(CASE WHEN value LIKE '[^0-9]' THEN value ELSE '' END, '')) AS Characters
FROM STRING_SPLIT('rtcfvty34redt', '') WITH (NOCOUNT ON);



SELECT w1.Id, w1.Date, w1.Temperature
FROM weather w1
JOIN weather w2 ON w1.Date = DATEADD(day, 1, w2.Date)
WHERE w1.Temperature > w2.Temperature;



SELECT PlayerID, MIN(LoginDate) AS FirstLoginDate
FROM Activity
GROUP BY PlayerID;


SELECT fruit FROM fruits ORDER BY fruit OFFSET 2 ROWS FETCH NEXT 1 ROW ONLY;


WITH chars AS (
  SELECT SUBSTRING('sdgfhsdgfhs@121313131', number, 1) AS char
  FROM master..spt_values
  WHERE type = 'P' AND number BETWEEN 1 AND LEN('sdgfhsdgfhs@121313131')
)
SELECT char FROM chars;


SELECT p1.id, CASE WHEN p1.code = 0 THEN p2.code ELSE p1.code END AS code
FROM p1
JOIN p2 ON p1.id = p2.id;


SELECT
  CASE
    WHEN LEFT(Vals, 1) LIKE '[0-9]' THEN
      LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'X') - 1)
    ELSE NULL
  END AS StartingIntegers
FROM GetIntegers;


SELECT
  STRING_AGG(
    CASE 
      WHEN LEN(item) >= 2 THEN 
        SUBSTRING(item, 2, 1) + SUBSTRING(item, 1, 1) + SUBSTRING(item, 3, LEN(item))
      ELSE item
    END, ','
  ) AS swapped_string
FROM (
  SELECT value AS item
  FROM STRING_SPLIT('ab,cd,ef', ',')
) AS split_vals;


