-- Table: Orders

-- +-----------------+----------+
-- | Column Name     | Type     |
-- +-----------------+----------+
-- | order_number    | int      |
-- | customer_number | int      |
-- +-----------------+----------+
-- order_number is the primary key for this table.
-- This table contains information about the order ID and the customer ID.
 

-- Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.

-- The test cases are generated so that exactly one customer will have placed more orders than any other customer.

SELECT customer_number 
FROM (
    SELECT customer_number, COUNT(order_number) AS total_order 
    FROM Orders 
    GROUP BY customer_number 
    ORDER BY total_order DESC
) AS T 
LIMIT 1;