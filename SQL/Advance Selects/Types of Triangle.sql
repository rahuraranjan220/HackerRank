--Problem Statement

/*
Given a table TRIANGLES that holds data for three fields namely A, B, C.
+-------------+------------+
| Column      |   Type     |
+-------------+------------+
| A           | INTEGER    |
| B           | INTEGER    |
| C           | INTEGER    |
+-------------+------------+
 
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral   : It's a triangle with  sides of equal length.
Isosceles     : It's a triangle with  sides of equal length.
Scalene       : It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/

--Solution


CREATE TABLE Triangles(
    Id INT PRIMARY KEY IDENTITY(1,1)
    , A INT
    , B INT
    , C INT
)
INSERT INTO Triangles
VALUES (20,20,23), (20,20,20), (20,21,22), (13,14,30)

SELECT * FROM Triangles;


SELECT CASE
WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
WHEN A = B AND B = C THEN 'Equilateral'
WHEN A = B OR B = C OR A = C THEN 'Isosceles'
ELSE 'Scalene'
END
FROM TRIANGLES;