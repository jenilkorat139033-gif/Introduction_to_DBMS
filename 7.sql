--------------------------------------------------
-- 1. List total deposit from deposit
--------------------------------------------------
SELECT SUM(amount) AS total_deposit 
FROM deposit;

--------------------------------------------------
-- 2. List total loan from karolbagh branch
--------------------------------------------------
SELECT SUM(amount) AS total_loan 
FROM borrow 
WHERE branch_name = 'karolbagh';

--------------------------------------------------
-- 3. Give maximum loan from branch vrce
--------------------------------------------------
SELECT MAX(amount) AS max_loan 
FROM borrow 
WHERE branch_name = 'vrce';

--------------------------------------------------
-- 4. Count total number of customers
--------------------------------------------------
SELECT COUNT(*) AS total_customers 
FROM customer;

--------------------------------------------------
-- 5. Count total number of customer cities
--------------------------------------------------
SELECT COUNT(DISTINCT city) AS total_cities 
FROM customer;

--------------------------------------------------
-- 6. Create table supplier from employee (all columns)
--------------------------------------------------
CREATE TABLE supplier AS 
SELECT * FROM employee;

--------------------------------------------------
-- 7. Create table sup1 with first two columns
--------------------------------------------------
CREATE TABLE sup1 AS 
SELECT emp_no, emp_name FROM employee;

--------------------------------------------------
-- 8. Create table sup2 with no data
--------------------------------------------------
CREATE TABLE sup2 AS 
SELECT * FROM employee WHERE 1=0;

--------------------------------------------------
-- 9. Insert data into sup2 (2nd char = 'n', length = 5)
--------------------------------------------------
INSERT INTO sup2
SELECT * FROM employee
WHERE SUBSTR(emp_name, 2, 1) = 'n'
AND LENGTH(emp_name) = 5;

--------------------------------------------------
-- 10. Delete all rows from sup1
--------------------------------------------------
DELETE FROM sup1;

--------------------------------------------------
-- 11. Delete supplier where sup_no = 103
--------------------------------------------------
DELETE FROM supplier 
WHERE sup_no = 103;

--------------------------------------------------
-- 12. Rename sup2 to suplier_two
--------------------------------------------------
ALTER TABLE sup2 RENAME TO suplier_two;

--------------------------------------------------
-- 13. Drop table sup1
--------------------------------------------------
DROP TABLE sup1;

--------------------------------------------------
-- 14. Update dept_no = 10 where 2nd char = 'm'
--------------------------------------------------
UPDATE employee
SET dept_no = 10
WHERE SUBSTR(emp_name, 2, 1) = 'm';

--------------------------------------------------
-- 15. Update employee name where emp_no = 103
--------------------------------------------------
UPDATE employee
SET emp_name = 'ANIL'   -- change name as needed
WHERE emp_no = 103;

--------------------------------------------------
-- Commit changes (important in Oracle)
--------------------------------------------------
COMMIT;
