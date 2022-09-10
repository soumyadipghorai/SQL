CREATE TABLE Salary (
    ID INT, 
    name VARCHAR(20), 
    sex VARCHAR(1), 
    salary INT
);

INSERT INTO Salary VALUES( 1, 'A', 'm', 2500);
INSERT INTO Salary VALUES( 2, 'B', 'f', 1500);
INSERT INTO Salary VALUES( 3, 'C', 'm', 5500);
INSERT INTO Salary VALUES( 4, 'D', 'f', 500);

SELECT * FROM Salary;

SELECT id, name, 
    CASE 
        WHEN sex = 'm' THEN 'f'
        ELSE 'm'
    END 
AS sex, salary 
FROM Salary;

UPDATE Salary SET salary = 999 
WHERE ID = 2;



ALTER TABLE Salary ADD bonus AS (
    CASE 
        WHEN sex = 'm' THEN 100
        ELSE 50
    END
);

SELECT * FROM Salary;

ALTER TABLE Salary DROP COLUMN bonus;

SELECT * FROM Salary;

DROP TABLE Salary;