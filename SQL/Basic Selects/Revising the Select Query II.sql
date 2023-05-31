--Problem Statement

/*
Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
The CountryCode for America is USA.

The CITY table is described as follows:
             CITY
+--------------+--------------+
| Column       |   Type       |
+--------------+--------------+
|  ID          | Integer      |
|  Name        | VARCHAR2(17) |  
|  CountryCode | VARCHAR2(3)  |
|  District    | VARCHAR2(20) |
|  Population  | Integer      |
+-------------+---------------+
*/
--Solution

SELECT [Name]
FROM CITY 
WHERE [CountryCode]='USA'
AND [Population] > 120000;