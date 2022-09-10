-- Table: Visits

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | visit_id    | int     |
-- | customer_id | int     |
-- +-------------+---------+
-- visit_id is the primary key for this table.
-- This table contains information about the customers who visited the mall.
 

-- Table: Transactions

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | transaction_id | int     |
-- | visit_id       | int     |
-- | amount         | int     |
-- +----------------+---------+
-- transaction_id is the primary key for this table.
-- This table contains information about the transactions made during the visit_id.
 

-- Write an SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

-- Return the result table sorted in any order.

SELECT customer_id, COUNT(customer_id) AS count_no_trans 
FROM Visits WHERE visit_id NOT IN (SELECT visit_id FROM Transactions) 
GROUP BY customer_id ORDER BY count_no_trans

 SELECT customer_id, COUNT(customer_id) as count_no_trans FROM (SELECT v.customer_id,t.amount FROM Visits as v LEFT JOIN Transactions as t
 ON v.visit_id=t.visit_id)  as c WHERE amount IS NULL GROUP BY customer_id