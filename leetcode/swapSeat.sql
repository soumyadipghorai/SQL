SELECT * FROM (
SELECT ID+1 AS ID, STUDENT FROM SEAT WHERE ID%2 = 1 AND ID NOT IN (SELECT MAX(ID) FROM SEAT)
UNION
SELECT ID -1 AS ID, STUDENT FROM SEAT WHERE ID%2 = 0
UNION 
SELECT ID, STUDENT FROM SEAT WHERE ID%2 = 1 AND ID IN (SELECT MAX(ID) FROM SEAT)) AS S 
ORDER BY ID 

SELECT (
CASE WHEN (ID%2 = 1 AND ID IN (SELECT MAX(ID) FROM SEAT)) THEN ID
WHEN ID%2 = 1 THEN ID+1
ELSE ID-1
END) AS ID, STUDENT
FROM SEAT 
ORDER BY ID;