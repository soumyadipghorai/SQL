CREATE TABLE employee (
    empId INT, 
    empName VARCHAR(10), 
    salary INT, 
    city VARCHAR(10), 
    gender VARCHAR(10)
);

INSERT INTO employee VALUES(1, 'A', 25000, 'X', 'M');
INSERT INTO employee VALUES(2, 'B', 20000, 'Y', 'M');
INSERT INTO employee VALUES(3, 'C', 19000, 'Z', 'F');
INSERT INTO employee VALUES(4, 'D', NULL, 'XX', 'M');
INSERT INTO employee VALUES(5, 'E', 10000, 'XY', 'F');
INSERT INTO employee VALUES(6, 'F', NULL,  'XZ', 'M');

SELECT * FROM employee;

-- grade a = salary > 20000 
-- grade b = salary < 20000

-- procedure 
CREATE PROCEDURE 'ShowGrade' (IN employeeName VARCHAR(200), OUT gradeResukt VARCHAR(200)) 
BEGIN 
    DECLARE newSalary INT DEFAULT 0; 
    SELECT salary INTO newSalary FROM employee WHERE empName = employeeName; 
    
    IF newSalary > 20000 THEN 
        SET gradeResult = 'Grade - A'; 
    ELSE 
        SET gradeResult = 'Grade - B'; 
    END IF;
END 

-- case when 
SELECT 
CASE 
    WHEN Salary >= 20000 THEN 'Grade - A' 
    ELSE 'Grade - B'
END AS Grade 
FROM employee

-- if else 
SELECT IF(Salary >= 20000, 'Grade - A', 'Grade - B') AS grade FROM employee;


-- join WITH 
WITH employeeGrade AS (
    SELECT * FROM employee WHERE Salary >= 20000
)
SELECT * FROM employee E
JOIN employeeGrade G ON G.empId = E.empId