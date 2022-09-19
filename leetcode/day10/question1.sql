-- Table: Person

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+
-- id is the primary key column for this table.
-- Each row of this table contains an email. The emails will not contain uppercase letters.
 

-- Write an SQL query to report all the duplicate emails.

-- Return the result table in any order.



SELECT DISTINCT(email) AS Email 
FROM(
    SELECT email FROM Person
    WHERE id IN (
        SELECT DISTINCT(p1.id) FROM Person p1, Person p2
        WHERE p1.email = p2.email AND p1.id > p2.id
    ) 
) AS T 