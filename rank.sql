 CREATE TABLE emp (
    emp_id INT PRIMARY KEY, 
    emp_name VARCHAR(20), 
    department_id INT, 
    salary INT
) 

INSERT INTO emp VALUES(1, 'a', 100, 10000)
INSERT INTO emp VALUES(2, 'b', 100, 15000)
INSERT INTO emp VALUES(3, 'c', 100, 10000)
INSERT INTO emp VALUES(4, 'd', 100, 5000)
INSERT INTO emp VALUES(5, 'e', 200, 12000)
INSERT INTO emp VALUES(6, 'f', 200, 12000)
INSERT INTO emp VALUES(7, 'g', 200, 9000)
INSERT INTO emp VALUES(8, 'h', 200, 5000)

SELECT * FROM emp ORDER BY emp_id

SELECT emp_id, emp_name, department_id, salary, 
RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM emp

SELECT emp_id, emp_name, department_id, salary, 
RANK() OVER(ORDER BY salary DESC) AS salary_rank,
DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_dense_rank,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS salary_row_number
FROM emp

SELECT emp_id, emp_name, department_id, salary, 
RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS salary_rank,
DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS salary_dense_rank,
ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS salary_row_number
FROM emp

-- Q1. department wise highest salary 

SELECT * FROM (
    SELECT emp_id, emp_name, department_id, salary, 
    RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM emp
) AS Table1
WHERE salary_rank = 1