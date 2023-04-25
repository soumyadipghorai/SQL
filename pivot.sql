-- pivot 
SELECT emp_id,
    SUM(CASE WHEN salary_component_type = 'salary' THEN val END) AS salay,
    SUM(CASE WHEN salary_component_type = 'bonus' THEN val END) AS bonus,
    SUM(CASE WHEN salary_component_type = 'hike' THEN val END) AS hike
FROM emp_compnensation
GROUP BY emp_id;

-- unpivot 
SELECT emp_id,
    SUM(CASE WHEN salary_component_type = 'salary' THEN val END) AS salay,
    SUM(CASE WHEN salary_component_type = 'bonus' THEN val END) AS bonus,
    SUM(CASE WHEN salary_component_type = 'hike' THEN val END) AS hike
INTO emp_compnensation_pivot
FROM emp_compnensation
GROUP BY emp_id;

SELECT 
    emp_id, 
    'salary' AS salary_component_type, 
    salary AS val
FROM emp_compnensation_pivot
UNION ALL
SELECT 
    emp_id, 
    'bonus' AS salary_component_type, 
    bonus AS val
FROM emp_compnensation_pivot
UNION ALL
SELECT 
    emp_id, 
    'hike' AS salary_component_type, 
    hike AS val
FROM emp_compnensation_pivot;