-- day 1 
-- download mysql --> create database name --> download popsql --> enter same database name and password 
INT -- whole number 
DECIMAL(10,4) -- decimal | 10 digit with 4 after decimal
VARCHAR(10) -- string 
BLOB -- binary large object 
DATE -- YYYY-MM-DD
TIMESTAMP -- YYYY-MM-DD HH:MM:SS - used for recording 

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20), 
    major VARCHAR(20)
);

DESC student;

DROP TABLE student;

CREATE TABLE student (
    student_id INT,
    name VARCHAR(20), 
    major VARCHAR(20), 
    PRIMARY KEY(student_id)
);

ALTER TABLE student ADD gpa DECIMAL(3, 2);

ALTER TABLE student DROP COLUMN gpa;

INSERT INTO student VALUES(
    101, 'ghorai', 'data science'
);

SELECT * FROM student;

INSERT INTO student VALUES(
    102, 'kate', 'data analysis'
);

INSERT INTO student(student_id, name) VALUES (103, 'Claire');

DROP TABLE student;

CREATE TABLE student (
    student_id INT PRIMARY KEY, --its both not null and unique 
    name VARCHAR(20) NOT NULL, 
    major VARCHAR(20) UNIQUE 
);

INSERT INTO student VALUES(
    101, 'ghorai', 'data science'
);
INSERT INTO student VALUES(
    102, 'ghorai2', 'science'
);
INSERT INTO student VALUES(
    103, 'ghorai3', 'data science2'
);

DROP TABLE student;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL, 
    major VARCHAR(20) DEFAULT 'undecided'
);

INSERT INTO student(student_id, name) VALUES (103, 'Claire');

SELECT * FROM student;

DROP TABLE student;

--day 2 : 

CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL, 
    major VARCHAR(20) DEFAULT 'undecided'
);

INSERT INTO student(name, major) VALUES ('Claire', 'biology');
INSERT INTO student(name, major) VALUES ('Claire2', 'biology2');

UPDATE student SET major = 'Bio' 
WHERE major = 'biology' OR student_id = 1;

DELETE FROM student; --delete all 
DELETE FROM student WHERE student_id = 5; 
DELETE FROM student WHERE name = 'Tom' AND major = 'undecided';


SELECT student.name, student.major 
FROM student
OREDER BY name DESC; --default ASC

SELECT * 
FROM student 
ORDER BY major, student_id DESC
LIMIT 2; 

-- < > <= >= = <> AND OR 
SELECT name, major 
FROM student 
WHERE major <> 'Chemistry';

SELECT * 
FROM student 
WHERE major IN ('Claire', 'Kate', 'Mike') AND student_id > 2;


-- selects all customers with a CustomerName that starts with "a" and are at least 3 characters in length:
SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';

-- selects all customers with a ContactName that starts with "a" and ends with "o":
SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';


-- selects all customers with a City starting with "b", "s", or "p":
SELECT * FROM Customers
WHERE City LIKE '[bsp]%';

-- selects all customers with a City starting with "a", "b", or "c":
SELECT * FROM Customers
WHERE City LIKE '[a-c]%';

-- selects all customers that are located in "Germany", "France" or "UK":
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

-- selects all customers that are from the same countries as the suppliers:
SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);


-- creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country):
SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address
FROM Customers;

-- self join 
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

-- drop duplicate email id 
WHERE p1.email = p2.email
AND p1.id > p2.id;

-- having
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;

-- group concat 
SELECT sell_date, COUNT(DISTINCT(product)) AS num_sold, 
    GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM Activities 
GROUP BY sell_date;



SELECT name FROM (
    SELECT users.name, T.total_spent 
    FROM users
    JOIN 
    (
        SELECT user_id, created_at, SUM(amount) AS total_spent
        FROM orders 
        WHERE status = 'completed'
        GROUP BY user_id, created_at
        ORDER BY user_id
    ) AS T
    ON T.user_id = users.id
    ORDER BY total_spent
    LIMIT 3
) AS TK
;



SELECT USERS.EMAIL, frequency
FROM USERS 
JOIN (
    SELECT USER_ID, COUNT(ORDER_ID) AS frequency 
    FROM ORDERS 
    WHERE STATUS = 'FAILED'
    GROUP BY USER_ID
) AS T 
ON T.USER_ID = USERS.ID 
ORDER BY FREQUENCY
