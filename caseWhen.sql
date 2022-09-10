SELECT first_name, last_name, age, 
CASE 
-- if multiple conditions that meet the criteria then very 1st will be returned  
    WHEN age > 30 THEN 'old'
    WHEN age BETWEEN 13 AND 19 THEN 'teen' -- both end including 
    ELSE 'young'
END AS ageClass 
FROM employee
WHERE age IS NOT NULL 
ORDER BY age;

SELECT first_name, last_name, jobTitle, salary, 
CASE
    WHEN jobTitle = 'salesman' THEN salary + (salary * 0.2)
    WHEN jobTitle = 'accountant' THEN salary + (salary * 0.05)
    WHEN jobTitle = 'hr' THEN salary + (salary * 0.1)
    ELSE salary + (salary * 0.025)
END AS salaryAfterRaise
FROM employee
JOIN employee_salary 
ON employee.emp_id = employee_salary.emp_id;