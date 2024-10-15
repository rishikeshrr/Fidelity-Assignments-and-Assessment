CREATE TABLE Worker(
	worker_id SERIAL PRIMARY KEY NOT NULL,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	salary BIGINT,
	joining_date DATE,
	department VARCHAR(20)
);
 
INSERT INTO Worker(first_name, last_name, salary,joining_date,department)
VALUES ('Monika', 'Arora',100000,'2020-02-14','HR'),
('Niharika', 'Verma',80000,'2011-02-14','Admin'),
('Vishal', 'Singhal',300000,'2020-02-14','HR'),
('Amitabh', 'Singh',500000,'2020-02-14','Admin'),
('Vivek', 'Bhati',500000,'2011-06-14','Admin'),
('Vipul', 'Diwan',200000,'2011-06-14','Account'),
('Satish', 'Kumar',75000,'2020-01-14','Account'),
('Geetika', 'Chauhan',90000,'2011-04-14','Admin');
 
SELECT * FROM Worker;
 
CREATE TABLE Bonus(
	worker_ref_id INT REFERENCES Worker(worker_id),
	bonus_amount BIGINT,
	bonus_date DATE
);
 
INSERT INTO Bonus(worker_ref_id, bonus_amount,bonus_date) VALUES
(1,5000,'2020-02-16'),
(2,3000,'2011-06-16'),
(3,4000,'2020-02-16'),
(1,4500,'2020-02-16'),
(2,3500,'2011-02-16'),
(4,4500,'2020-02-16'),
(5,3500,'2011-02-16');
 
SELECT * FROM Bonus;
 
CREATE TABLE Title(
	worker_ref_id INT REFERENCES Worker(worker_id),
	worker_title VARCHAR(20),
	affected_from DATE
);
 
INSERT INTO Title(worker_ref_id,worker_title,affected_from) VALUES
(1,'Manager','2016-02-20'),
(2,'Executive','2016-02-20'),
(8,'Executive','2016-02-20'),
(5,'Manager','2016-02-20'),
(4,'Asst. Manager','2016-02-20'),
(7,'Executive','2016-02-20'),
(6,'Lead','2016-02-20'),
(3,'Lead','2016-02-20');
 
SELECT * FROM Title;
 
SELECT 
    w.first_name, 
    w.salary, 
    t.worker_title 
FROM 
    Worker w
LEFT JOIN 
    Title t ON w.worker_id = t.worker_ref_id;
	
CREATE OR REPLACE FUNCTION count_workers_nth_highest_salary(n INT)
RETURNS INT AS $$
DECLARE
    nth_salary BIGINT;
    worker_count INT;
BEGIN
    SELECT DISTINCT salary 
    INTO nth_salary
    FROM Worker
    ORDER BY salary DESC
    OFFSET n - 1 LIMIT 1;
    SELECT COUNT(*)
    INTO worker_count
    FROM Worker
    WHERE salary = nth_salary;
 
    RETURN worker_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
$$ LANGUAGE plpgsql;
 
SELECT count_workers_nth_highest_salary(1);