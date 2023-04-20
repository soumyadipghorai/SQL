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



-- avg order 
-- ======= subquerry ======= 
-- query3(query2(query1))
SELECT AVG(total_orders_per_customer) AS avg_orders_per_customer FROM (
    SELECT customer_id, COUNT(DISTINCT(order_id)) AS total_orders_per_customer
    FROM orders 
    GROUP BY customer_id
) AS T;

-- ===== CTE =====
-- you have to run both the queries together 
-- the results table is stored in memory 
-- query 1
-- query 2 
-- query 3
WITH total_orders (customer_id, total_orders_per_customer) AS (
    SELECT customer_id, COUNT(DISTINCT(order_id)) AS total_orders_per_customer
    FROM orders 
    GROUP BY customer_id
)
SELECT AVG(total_orders_per_customer) AS avg_orders_per_customer 
FROM total_orders;

-- people who places orders more than avg orders  
-- subquery
-- where 
SELECT * FROM (
    SELECT customer_id, COUNT(DISTINCT(order_id)) AS total_orders_per_customer
    FROM orders 
    GROUP BY customer_id
) AS total_orders
WHERE total_orders_per_customer >= (
    SELECT AVG(total_orders_per_customer) AS avg_orders_per_customer FROM (
        SELECT customer_id, COUNT(DISTINCT(order_id)) AS total_orders_per_customer
        FROM orders 
        GROUP BY customer_id
    ) AS T
);

-- join  
SELECT * FROM (
    SELECT customer_id, COUNT(DISTINCT(order_id)) AS total_orders_per_customer
    FROM orders 
    GROUP BY customer_id
) AS total_orders
JOIN 
SELECT * FROM (
    SELECT AVG(total_orders_per_customer) AS avg_orders_per_customer FROM (
        SELECT customer_id, COUNT(DISTINCT(order_id)) AS total_orders_per_customer
        FROM orders 
        GROUP BY customer_id
    ) AS T
) AS avg_orders 
ON total_orders.total_orders_per_customer > avg_orders.avg_orders_per_customer;

-- CTE
-- select statement you can use only in the next immediate line  
-- it can improve the performance in some cases 
WITH total_orders(customer_id, total_orders_per_customer) AS (
    SELECT customer_id, COUNT(DISTINCT(order_id)) AS total_orders_per_customer
    FROM orders 
    GROUP BY customer_id
), 
avg_orders(avg_orders_per_customer) AS (
    SELECT AVG(total_orders_per_customer) AS avg_orders_per_customer 
    FROM total_orders
)
SELECT * 
FROM total_orders WHERE total_orders.total_orders_per_customer >= (
    SELECT avg_orders_per_customer 
    FROM avg_orders
);

-- in some cases CTE might be slower e.g. 
SELECT * FROM orders WHERE order_id = 1000;
-- is much faster than 
WITH orders_cte AS (
    SELECT * FROM orders 
)
SELECT * FROM orders_cte WHERE order_id = 1000;
-- also the indexing is not proper in CTE but the modern systems are compatible with this 