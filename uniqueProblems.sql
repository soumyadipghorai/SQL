DELETE p1 FROM Person p1, Person p2 
WHERE p1.email = p2.email AND p1.id > p2.id 




SELECT w1.id AS Id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND (w1.temperature > w2.temperature)



SELECT id, 
CASE 
    WHEN p_id IS NULL THEN 'Root'
    WHEN id IN (SELECT p_id FROM Tree) THEN 'Inner'
    ELSE 'Leaf'
END AS type 
FROM Tree 
ORDER BY id 



SELECT id, name, 
CASE 
    WHEN sex = 'm' THEN 'f'
    ELSE 'm'
END AS sex, salary 
FROM Salary 



SELECT sell_date, COUNT(DISTINCT(product)) AS num_sold, 
    GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM Activities 
GROUP BY sell_date;


SELECT user_id, CONCAT(UPPER(SUBSTR(name, 1, 1)), LOWER(SUBSTR(name, 2, 1000))) AS name 
FROM Users
ORDER BY user_id;



SELECT * FROM (
    SELECT product_id, 'store1' AS store , store1 AS price 
    FROM Products 
    UNION 
    SELECT product_id, 'store2' AS store , store2 AS price 
    FROM Products 
    UNION 
    SELECT product_id, 'store3' AS store , store3 AS price 
    FROM Products
) AS T 
WHERE price IS NOT NULL;