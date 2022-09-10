
-- triggers 
CREATE TABLE trigger_test (
    message VARCHAR(100)
);

ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';

-- trigger 1
CREATE TRIGGER my_trigger 
BEFORE INSERT ON employee 
FOR EACH ROW BEGIN 
    INSERT INTO trigger_test VALUES(NEW.first_name) -- NEW is the row and first_name is the column name of the row
END

-- trigger 2 
CREATE TRIGGER my_trigger BEFORE INSERT 
ON employee 
FOR EACH ROW BEGIN 
    IF NEW.sex = 'M' THEN 
        INSERT INTO trigger_test VALUES('added male employee'); 
    ELSEIF NEW.sex = 'F' THEN 
        INSERT INTO trigger_test VALUES('added female'); 
    ELSE 
        INSERT INTO trigger_test VALUES('added other employee'); 
    END IF; 
END 

-- you can also create triggers for insert update or delete 

DROP TRIGGER my_trigger;

SELECT a.request_date, a.dist_to_cost, AVG(a.dist_to_cost) 
OVER(PARTITION BY a.request_month) AS avg_dist_to_cost
(SELECT *, date AS request_date, month AS request_month, distance_to_travel/monetary_cost AS dist_to_cost
FROM uber_request_log ) a


CREATE TABLE productLinemsrp AS 
SELECT SUM(msrp), productLine 
FROM products 
GROUP BY productLine;

SELECT a.productLine, a.*, SUM(a.msrp) OVER (PARTITION BY a.productLine) AS total_msrp
FROM products a;

