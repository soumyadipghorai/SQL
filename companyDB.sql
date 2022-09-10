-- day 3 : 

CREATE TABLE employee (
    emp_id INT PRIMARY KEY, 
    first_name VARCHAR(40), 
    last_name VARCHAR(40), 
    birth_day DATE, 
    sex VARCHAR (1),
    salary INT, 
    super_id INT, 
    branch_id INT 
);

CREATE TABLE branch (
    branch_id INT PRIMARY KEY, 
    branch_name VARCHAR(40), 
    mgr_id INT, 
    mgr_start_date DATE, 
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee 
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id) 
ON DELETE SET NULL; -- SET NULL

ALTER TABLE employee 
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
    client_id INT PRIMARY KEY, 
    client_name VARCHAR(40), 
    branch_id INT, 
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
    emp_id INT, 
    client_id INT, 
    total_sales INT, 
    PRIMARY KEY (emp_id, client_id), 
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE, 
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
    branch_id INT, 
    supplier_name VARCHAR(40), 
    supply_type VARCHAR(40), 
    PRIMARY KEY(branch_id, supplier_name), 
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL); 
-- as the branch is not created yet 

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee 
SET branch_id = 1 
WHERE emp_id = 1000; 

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

INSERT INTO employee VALUES(102, 'MIchael', 'Scott', '1961-03-15', 'M', 120000, 100, 1);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06'); 

UPDATE employee 
SET branch_id = 2 
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'M', 420000, 100, 1);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'M', 140000, 100, 1);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 520000, 100, 1);
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 190000, 100, 1);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee 
SET branch_id = 3 
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'F', 320000, 100, 1);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 290000, 100, 1);


INSERT INTO branch_supplier VALUES (2, 'Hammer Mill', 'Paper'); 
INSERT INTO branch_supplier VALUES (2, 'Uni-ball', 'Writing Utensils'); 
INSERT INTO branch_supplier VALUES (3, 'Patriot Paper', 'Paper'); 
INSERT INTO branch_supplier VALUES (2, 'J.T. Forms & Labels', 'Custom'); 
INSERT INTO branch_supplier VALUES (3, 'Uni-ball', 'Writing Utensils'); 
INSERT INTO branch_supplier VALUES (3, 'Hammer Mill', 'Paper'); 
INSERT INTO branch_supplier VALUES (3, 'Stanmford Labels', 'Custom Forms'); 

INSERT INTO client VALUES (400, 'Dunmore HighSchool', 2);
INSERT INTO client VALUES (401, 'Lackawana Country', 2);
INSERT INTO client VALUES (402, 'FedEx', 3);
INSERT INTO client VALUES (403, 'John Daly Law LLC', 3);
INSERT INTO client VALUES (404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES (405, 'Times Newspaper', 2);
INSERT INTO client VALUES (406, 'FedEx', 2);

INSERT INTO works_with VALUES (105, 400, 55000);
INSERT INTO works_with VALUES (102, 401, 267000);
INSERT INTO works_with VALUES (108, 402, 22500);
INSERT INTO works_with VALUES (107, 403, 5000);
INSERT INTO works_with VALUES (108, 403, 12000);
INSERT INTO works_with VALUES (105, 404, 33000);
INSERT INTO works_with VALUES (107, 405, 26000);
INSERT INTO works_with VALUES (102, 406, 15000);
INSERT INTO works_with VALUES (105, 406, 13000);

SELECT * FROM employee;

-- find all employee order by salary 
SELECT * FROM employee
ORDER BY salary DESC;

-- order by sex and name 
SELECT * FROM employee 
ORDER BY sex, first_name, last_name;

-- first 5 emp in the table 
SELECT * FROM employee LIMIT 5;

-- first name and last name  
SELECT first_name AS forename, last_name AS surname 
FROM employee;

-- find all genders 
SELECT DISTINCT(sex) 
FROM employee;

-- count emp  
SELECT COUNT(emp_id) FROM employee;

-- find number of male emp born ater 19780 
SELECT COUNT(emp_id) 
FROM employee 
WHERE sex = 'M' and birth_day > '1970-01-01';

-- find avg of all male emp salary
SELECT AVG(salary) FROM employee
WHERE sex = 'M';

SELECT SUM(salary) FROM employee
WHERE sex = 'M';

-- AGGREGATE
-- how many male and female are there 
SELECT COUNT(emp_id), sex 
FROM employee 
GROUP BY sex;

-- wild cards 

SELECT * FROM client 
WHERE client_name LIKE '%LLC'; --ends with LLC

-- find any branch who are in label business  
SELECT * FROM branch_supplier 
WHERE supplier_name LIke "%Label%"; -- word has label 

-- find emp born in oct 
SELECT first_name AS emp_name
FROM employee
WHERE birth_day LIKE '____-10-__'; -- _ for one char 

-- find client schools 
SELECT * FROM client 
WHERE client_name LIKE '%school%';

-- union 
SELECT first_name AS names 
FROM employee 
UNION 
SELECT branch_name 
FROM branch; -- you have to have same number of col in each select, and should have similar data type 

-- find list of all clients and branch suppliers name  
SELECT client_name, client.branch_id FROM client 
UNION 
SELECT supplier_name, branch_supplier.branch_id FROM branch_supplier;


-- find a list of all money spent or earned by the company 
SELECT works_with.total_sales AS money FROM works_with -- col name 
UNION 
SELECT employee.salary FROM employee; 


-- joins 
INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL);

-- find all branch with name of the manager --> INNER JOIN 
SELECT employee.emp_id, employee.first_name, branch.branch_name 
FROM employee 
JOIN branch 
ON employee.emp_id = branch.mgr_id;

-- branch is the right table 
SELECT employee.emp_id, employee.first_name, branch.branch_name 
FROM employee 
LEFT JOIN branch 
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id, employee.first_name, branch.branch_name 
FROM employee 
RIGHT JOIN branch 
ON employee.emp_id = branch.mgr_id;

-- FULL OUTER JOIN GIVES BOTH RIGHT AND LEFT JOIN 


-- nested query 
-- find name of all employee who have sold over 30k to a single client 

SELECT employee.first_name, employee.last_name 
FROM employee 
JOIN works_with
ON employee.emp_id = works_with.emp_id 
WHERE total_sales > 30000;

-- returns unique 
SELECT employee.first_name, employee.last_name 
FROM employee 
WHERE employee.emp_id IN (
    SELECT works_with.emp_id 
    FROM works_with 
    WHERE works_with.total_sales > 30000
);


-- executes inner one 1st then outer one 
SELECT client.client_name 
FROM client 
WHERE client.branch_id IN (
    SELECT branch.branch_id 
    FROM branch 
    JOIN employee 
    ON employee.emp_id = branch.mgr_id
    WHERE employee.first_name = 'MIchael'
    LIMIT 1 -- takes only one branch 
);

-- on delete cascade deletes all the existance of that row in other tables 
-- on delete set null will set the value null to other tables 


DELETE FROM employee 
WHERE emp_id = 102;

DELETE FROM branch 
WHERE branch_id = 2;

SELECT * FROM branch_supplier;

