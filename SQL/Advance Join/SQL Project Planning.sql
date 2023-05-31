--Problem Statement

/*

You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date.
It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

        Projects
+-------------+-----------+
| Column      |   Type    |
+-------------+-----------+
|  Task_ID    | Integer   |
|  Start_Date | Date      |  
|  End_Date   | Date      |
+-------------+-----------+

If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order.
If there is more than one project that have the same number of completion days, then order by the start date of the project.

*/

-- Solution

CREATE TABLE Projects(
        [Task_ID] INT IDENTITY(1,1)
        , [Start_Date] DATE
        , [End_Date] DATE
)

INSERT INTO Projects 
VALUES ("05/01/2023", "05/02/2023")
,("05/02/2023", "05/03/2023")
,("05/03/2023", '05/04/2023')
,("05/13/2023", "05/14/2023")
,("05/14/2023", "05/15/2023")
,("05/28/2023", "05/29/2023")
,("05/30/2023", "05/31/2023")

SELECT * FROM Projects



