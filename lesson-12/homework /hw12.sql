SELECT 
    Person.firstName, 
    Person.lastName, 
    Address.city, 
    Address.state
FROM Person
LEFT JOIN Address 
    ON Person.personId = Address.personId;

SELECT 
    e1.name AS Employee
FROM Employee e1
JOIN Employee e2 
    ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;


SELECT 
    email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;



DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);


SELECT DISTINCT 
    g.ParentName
FROM girls g
LEFT JOIN boys b 
    ON g.ParentName = b.ParentName
WHERE b.ParentName IS NULL;



SELECT 
    ISNULL(c1.Item, '') AS [Item Cart 1],
    ISNULL(c2.Item, '') AS [Item Cart 2]
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2
    ON c1.Item = c2.Item



SELECT Customers.name AS Customers
FROM Customers
LEFT JOIN Orders ON Customers.id = Orders.customerId
WHERE Orders.customerId IS NULL;



SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM 
    Students s
CROSS JOIN 
    Subjects sub
LEFT JOIN 
    Examinations e
    ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY 
    s.student_id,
    sub.subject_name;
