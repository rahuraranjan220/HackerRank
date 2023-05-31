--Problem Statement

/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Given a table OCCUPATIONS that holds data for three fields namely Column, Type.
+-------------+-----------+
| Column      |   Type    |
+-------------+-----------+
| Name        | STRING    |
| Occupation  | STRING    |
+-------------+-----------+

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values. 

*/

--Solution

CREATE TABLE Occupations(
    [Name] VARCHAR(20)
    , [Occupation] VARCHAR(20)
)

INSERT INTO Occupations
VALUES ("Samantha", "Doctor")
,("Julia", "Actor")
,("Maria", "Actor")
,("Meera", "Singer")
,("Ashely", "Professor")
,("Ketty", "Professor")
,("Christeen", "Professor")
,("Jenny", "Doctor")
,("Jane", "Actor")
,("Priya", "Singer")


WITH tmp_occupations
AS(
SELECT 
  Name,
  Occupation,
  ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS R
FROM OCCUPATIONS
)

SELECT MAX(CASE WHEN Occupation = "Doctor" THEN Name ELSE NULL END) AS Doctor
, MAX(CASE WHEN Occupation = "Professor" THEN Name ELSE NULL END) AS Professor
, MAX(CASE WHEN Occupation = "Singer" THEN Name ELSE NULL END) AS Singer
, MAX(CASE WHEN Occupation = "Actor" THEN Name ELSE NULL END) AS Actor
FROM tmp_occupations
GROUP BY R;

