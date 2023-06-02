--Problem Statement

/*
You are given two tables: Students and Grades. 
Students contains three columns ID, Name and Marks.

    Students
+----------+--------------+
| Column   |   Type       |
+----------+--------------+
|  ID      | Integer      |
|  Name    | VARCHAR(20)  |  
|  Marks   | Integer      |
+----------+--------------+

Grades contains the following data:

+--------------+--------------+
| Grade | Min_Mark | Max_Mark |
+-------+----------+----------+
|  1    |  0       |  9       |
|  2    |  10      |  19      |
|  3    |  20      |  29      |
|  4    |  30      |  39      |
|  5    |  40      |  49      |
|  6    |  50      |  59      |
|  7    |  60      |  69      |
|  8    |  70      |  79      |
|  9    |  80      |  89      |
| 10    |  90      |  100     |
+-------+----------+----------+

Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark.
Ketty doesn't want the NAMES of those students who received a grade lower than 8.
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them,
order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8,use "NULL" as their name and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, 
order those particular students by their marks in ascending order.

Write a query to help Eve.

*/
--Solution

CREATE TABLE Students(
    [ID]    INT  IDENTITY(1,1)
    ,[Name]  VARCHAR(20)  
    ,[Marks] INT 
);

CREATE TABLE Grades(
    [Grade] INT
    ,[Min_Mark] INT
    ,[Max_Mark] INT
);


INSERT INTO Students
VALUES ('Julia', 88),('Samantha', 68)
,('Maria', 99),('Sacrlet', 78)
,('Ashley', 63),('Jane', 81);

INSERT INTO Grades
VALUES (1,  0,  9)
,  (2,  10  ,  19)
,  (3,  20,  29)
,  (4,  30,  39)
,  (5,  40,  49)
,  (6,  50,  59)
,  (7,  60,  69)
,  (8,  70,  79)
,  (9,  80,  89)
, (10,  90,  100);


SELECT * FROM students;
SELECT * FROM Grades;


SELECT CASE WHEN Grade < 8 THEN NULL ELSE Name END AS Name,
Grade, Marks FROM (
SELECT S.Name, S.Marks, G.Grade FROM Students S
JOIN Grades G
ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
) T
ORDER BY Grade DESC, Name ASC, Marks ASC