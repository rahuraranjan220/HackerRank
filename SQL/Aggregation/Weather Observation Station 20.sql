--Problem Statement

/*
A median is defined as a number separating the higher half of a data set from the lower half.
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.


The STATION table is described as follows:
        STATION
+----------+--------------+
 Column   |   Type       |
+----------+--------------+
|  ID      | Integer      |
|  City    | VARCHAR(21)  |  
|  State   | VARCHAR(3)   |
|  Lat_N   | Integer      |
|  Long_W  | Integer      |
+----------+--------------+
where LAT_N is the northern latitude and LONG_W is the western longitude.


*/
--Solution

/* EXAMPLE SOLUTION

CREATE TABLE Student_details
(
    roll_number int primary key,
    marks int
);

insert into student_details values(1, 12);
insert into student_details values(3, 18);
insert into student_details values(8, 34);
insert into student_details values(2, 22);
insert into student_details values(4, 90);

SELECT SUM(marks)/2 AS Median FROM 
(SELECT MAX(marks) AS marks
FROM (
	SELECT TOP 50 PERCENT marks
	FROM student_details
	ORDER BY marks ASC
	) AS MAX_TOP_VALUE
UNION ALL
SELECT MIN(marks)
FROM (
	SELECT TOP 50 PERCENT marks
	FROM student_details
	ORDER BY marks DESC
	) AS MIN_BOTTOM_VALUE
) AS t

*/

SELECT FORMAT(SUM(Lat_N) / 2, '###.####') AS Median
FROM (
	SELECT MAX(Lat_N) AS Lat_N
	FROM (
		SELECT TOP 50 PERCENT Lat_N
		FROM STATION
		ORDER BY Lat_N ASC
		) AS MAX_TOP_VALUE
	
	UNION ALL
	
	SELECT MIN(Lat_N)
	FROM (
		SELECT TOP 50 PERCENT Lat_N
		FROM STATION
		ORDER BY Lat_N DESC
		) AS MIN_BOTTOM_VALUE
	) AS t
