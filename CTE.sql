 CREATE TABLE emp (
    emp_id INT PRIMARY KEY, 
    emp_name VARCHAR(20), 
    department_id INT, 
    salary INT,
    manager_id INT, 
    emp_age INT
) 

INSERT INTO emp VALUES(1, 'ankit', 100, 10000, 4, 39);
INSERT INTO emp VALUES(2, 'mohit', 100, 15000, 5, 48);
INSERT INTO emp VALUES(3, 'vikas', 100, 10000, 4, 37);
INSERT INTO emp VALUES(4, 'rohit', 100, 5000, 2, 16);
INSERT INTO emp VALUES(5, 'mudit', 200, 12000, 6, 55);
INSERT INTO emp VALUES(6, 'agam', 200, 12000, 2, 14);
INSERT INTO emp VALUES(7, 'sanjay', 200, 9000, 2, 13);
INSERT INTO emp VALUES(8, 'ashish', 200, 5000, 2, 12);
INSERT INTO emp VALUES(9, 'mukesh', 200, 6000, 6, 51);
INSERT INTO emp VALUES(10, 'rakesh', 200, 7000, 6, 50);

SELECT * FROM emp ORDER BY emp_id;

-- emp with salary more than the avg salary
SELECT * 
FROM emp 
WHERE salary >= (SELECT AVG(salary) FROM emp);

with avg_salary AS (
    SELECT AVG(salary) AS avg_sal FROM emp
), 
max_salary AS (
    SELECT max(avg_sal) AS max_sal FROM avg_salary 
)
SELECT * FROM emp 
INNER JOIN max_salary ON salary < max_sal;