--Problem Statement

/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

 --> a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 --> b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 --> c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 --> d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and p2 and round it to a scale of 4 decimal places.


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

Manhattan distance:
The distance between two points measured along axes at right angles.
In a plane with p1 at (x1, y1) and p2 at (x2, y2), it is |x1 - x2| + |y1 - y2|.

*/
--Solution

CREATE TABLE STATION(
 [ID]  Int IDENTITY(1,1)
,  [City]  VARCHAR(21)    
,  [State] VARCHAR(3)   
,  [Lat_N] Int      
,  [Long_W] Int 
)

INSERT INTO STATION
VALUES ()

SELECT FORMAT(ABS(MIN(Lat_N) - MAX(Lat_N)) + ABS(MIN(Long_W)- MAX(Long_W)),'###.####') 
FROM STATION;