-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the primary key for this table.
-- This table contains information about the temperature on a certain day.
 

-- Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

-- Return the result table in any order.

SELECT org.id 
FROM Weather AS org, Weather AS dup 
WHERE dup.temperature<org.temperature
AND TO_DAYS(org.recordDate)-TO_DAYS(dup.recordDate)=1;

SELECT org.id 
FROM Weather AS org, Weather AS dup 
WHERE dup.temperature<org.temperature
AND DATEDIFF(org.recordDate,dup.recordDate)=1;