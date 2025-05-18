CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);
    INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');

SELECT DISTINCT col1, col2
FROM InputTbl
WHERE col1 < col2
ORDER BY col1, col2;


CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);


   
   SELECT * from TestMultipleZero
WHERE A <> 0 or B <> 0 or C <> 0 or D <> 0;


   SELECT * from TestMultipleZero
WHERE not(A = 0 AND B = 0 and C = 0 and D = 0)


create table section1(id int, name varchar(20))
DROP TABLE section1
insert into section1 values (1, 'Been'),
       (2, 'Roma'),
       (3, 'Steven'),
       (4, 'Paulo'),
       (5, 'Genryh'),
       (6, 'Bruno'),
       (7, 'Fred'),
       (8, 'Andro')


Select name
from section1
where id = (Select MIN(id) from section1);

    
Select name 
FROM section1
where  id = (Select max(id) from section1);

Select NAME 
from section1
where name like 'B%'


CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');

SELECT Code
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';


