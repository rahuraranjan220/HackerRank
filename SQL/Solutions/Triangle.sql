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