--Problem Statement

/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

 --> a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 --> b happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 --> c happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 --> d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Euclidean Distance between points P1 and p2 and round it to a scale of 4 decimal places.


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

Euclidean Distance:
the Euclidean distance between two points in Euclidean space is the length of a line segment between the two points.
It can be calculated from the Cartesian coordinates of the points using the Pythagorean theorem, therefore occasionally being called the Pythagorean distance.
In a plane with P1 at (x1, y1) and P2 at (x2, y2), it is SquareRoot of (y1 - x1)^2 + (y2 - x2)^2.

*/
--Solution

SELECT FORMAT(SQRT(SQUARE(MAX(Lat_N) - Min(Lat_N)) + SQUARE(MAX(Long_W) - Min(Long_W))), '###.####')
FROM STATION

