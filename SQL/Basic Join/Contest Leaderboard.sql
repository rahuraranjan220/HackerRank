--Problem Statement

/*

The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of 0 from your result.

    Hackers
+-----------+-------------+
| Column    |   Type      |
+-----------+-------------+
| hacker_id | Integer     |
| Name      | VARCHAR(20) |  
+-----------+-------------+

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.

Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission,
challenge_id is the id of the challenge for which the submission belongs to, 
and score is the score of the submission.

    Submissions
+---------------+----------+
| Column        |   Type   |
+---------------+----------+
| submission_id | Integer  |
| hacker_id     | Integer  |
| challenge_id  | Integer  |
| score         | Integer  |  
+---------------+----------+

*/

CREATE TABLE Hackers(
    hacker_id INT,
    Name VARCHAR(20)
);


CREATE TABLE Submissions(
    submission_id INT,
    hacker_id INT,
    challenge_id INT,
    score INT
)


INSERT INTO Hackers
VALUES 	(4071, "Rose")
, (4806, "Angela")
, (26071, "Frank")
, (49438, "Patrick")
, (74842, "Lisa")
, (80305, "Kimberly")
, (84072, "Bonnie")
, (87868, "Michael")
, (92118, "Todd")
, (95895, "Joe")


INSERT INTO Submissions
VALUES (	67194, 74842, 63132, 76)
, (64479, 74842, 19797, 98)
, (40742, 26071, 49593, 20)
, (17513, 4806, 49593, 32)
, (69846, 80305, 19797, 19)
, (41002, 26071, 89343, 36)
, (52826, 49438, 49593, 9)
, (31093, 26071, 19797, 2)
, (81614, 84072, 49593, 100)
, (44829, 26071, 89343, 17)
, (75147, 80305, 49593, 48)
, (14115, 4806, 49593, 76)
, (6943, 4071, 19797, 95)
, (12855, 4806, 25917, 13)
, (73343, 80305, 49593, 42)
, (84264, 84072, 63132, 0)
, (9951, 4071, 49593, 43)
, (45104, 49438, 25917, 34)
, (53795, 74842, 19797, 5)
, (26363, 26071, 19797, 29)
, (10063, 4071, 49593, 96);



SELECT * FROM Hackers;
SELECT * FROM Submissions;

-- Solution

WITH HackerScore
AS (
SELECT H.hacker_id, H.Name, MAX(S.Score) as mscore FROM Hackers H
JOIN Submissions S
ON H.hacker_id = S.hacker_id
WHERE S.Score > 0
GROUP BY H.hacker_id, H.Name, S.challenge_id
)

SELECT hacker_id, Name, SUM(mscore) as Score
FROM HackerScore
GROUP BY hacker_id, Name
ORDER BY score DESC, hacker_id ASC