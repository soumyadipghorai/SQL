
CREATE TABLE supplier(
	supplier_id INT NOT NULL, 
    supplier_name VARCHAR(20),
    city VARCHAR(20) DEFAULT 'Orlando',
    state VARCHAR(20), 
    total_spent INT
);
DROP TABLE supplier;
INSERT INTO supplier VALUES(100, 'shop', 'August', 'Georgia', 220500);
INSERT INTO supplier VALUES(200, 'instant', 'valdez', 'alaska', 37000);
INSERT INTO supplier VALUES(300, 'time', 'redwood', 'california', 90500);
INSERT INTO supplier VALUES(300, 'time', 'redwoodIkas', 'california', 90500);
INSERT INTO supplier VALUES(400, 'roundhouse', 'new york', 'new york', 78150);
INSERT INTO supplier VALUES(500, 'smiths', 'portland', 'oregon', 114600);

SELECT * FROM supplier
WHERE state = 'Georia' OR state = 'california';

-- SELECT * FROM supplier
-- WHERE supplier_name LIKE '%wo%';

SELECT * FROM supplier 
WHERE total_spent BETWEEN 37000 AND 80000; 

SELECT * FROM supplier 
WHERE state = 'Georia' OR state = 'california'
AND supplier_id > 100 AND total_spent < 100000 OR total_spent = 220000;

SELECT * FROM emp
WHERE DATE_PART('year', doj) BETWEEN 2019 AND 2022 

SELECT * FROM emp 
WHERE emp_id IN (SELECT manager_id FROM emp)
    
SELECT * FROM emp 
WHERE emp_name LIKE '___n%'

SELECT training_date, user_id, COUNT(DISTINCT(training_id)) AS training_count 
FROM tranings 
GROUP BY training_date, user_id
