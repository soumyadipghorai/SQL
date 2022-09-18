-- Table: Users

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | user_id        | int     |
-- | join_date      | date    |
-- | favorite_brand | varchar |
-- +----------------+---------+
-- user_id is the primary key of this table.
-- This table has the info of the users of an online shopping website where users can sell and buy items.
 

-- Table: Orders

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | order_id      | int     |
-- | order_date    | date    |
-- | item_id       | int     |
-- | buyer_id      | int     |
-- | seller_id     | int     |
-- +---------------+---------+
-- order_id is the primary key of this table.
-- item_id is a foreign key to the Items table.
-- buyer_id and seller_id are foreign keys to the Users table.
 

-- Table: Items

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | item_id       | int     |
-- | item_brand    | varchar |
-- +---------------+---------+
-- item_id is the primary key of this table.
 

-- Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.

-- Return the result table in any order.


SELECT u.user_id AS buyer_id, u.join_date, 
CASE 
    WHEN T.total_order IS NULL THEN 0 
    ELSE T.total_order 
END AS orders_in_2019
FROM Users u
LEFT JOIN (
    SELECT u.user_id AS 'buyer_id', COUNT(DISTINCT(order_id)) AS total_order
    FROM Users u
    JOIN Orders o ON o.buyer_id = u.user_id 
    WHERE YEAR(o.order_date) = 2019
    GROUP BY buyer_id 
) AS T 
ON T.buyer_id = u.user_id 
ORDER BY buyer_id 