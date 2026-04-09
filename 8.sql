--------------------------------------------------
-- 1. Customers (depositors) in same branch city as Sunil
--------------------------------------------------
SELECT DISTINCT c.customer_name
FROM customer c, deposit d, branch b
WHERE c.customer_name = d.customer_name
AND d.branch_name = b.branch_name
AND b.branch_city = (
    SELECT b2.branch_city
    FROM deposit d2, branch b2
    WHERE d2.branch_name = b2.branch_name
    AND d2.customer_name = 'sunil'
);

--------------------------------------------------
-- 2. Deposit + Loan details of customers in same city as Pramod
--------------------------------------------------
SELECT d.*, l.*
FROM deposit d, borrow l, customer c
WHERE d.customer_name = c.customer_name
AND l.customer_name = c.customer_name
AND c.city = (
    SELECT city FROM customer WHERE customer_name = 'pramod'
);

--------------------------------------------------
-- 3. Employees earning more than average salary
--------------------------------------------------
SELECT emp_no, emp_name, salary
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee)
ORDER BY salary ASC;

--------------------------------------------------
-- 4. Employees who report to Ford
--------------------------------------------------
SELECT emp_name, salary
FROM employee
WHERE manager_id = (
    SELECT emp_no FROM employee WHERE emp_name = 'FORD'
);

--------------------------------------------------
-- 5. Employees in Accounting department
--------------------------------------------------
SELECT e.dept_no, e.emp_name, e.job
FROM employee e, department d
WHERE e.dept_no = d.dept_no
AND d.dept_name = 'ACCOUNTING';

--------------------------------------------------
-- 6. Customers who are borrowers AND depositors in Nagpur
--------------------------------------------------
SELECT DISTINCT c.customer_name
FROM customer c, deposit d, borrow b
WHERE c.customer_name = d.customer_name
AND c.customer_name = b.customer_name
AND c.city = 'NAGPUR';

--------------------------------------------------
-- 7. Customers having same living city as branch city
--------------------------------------------------
SELECT c.customer_name, c.city
FROM customer c, branch b, deposit d
WHERE c.customer_name = d.customer_name
AND d.branch_name = b.branch_name
AND c.city = b.branch_city;

--------------------------------------------------
-- 8. Employee last name, dept no, dept name
--------------------------------------------------
SELECT e.emp_name, e.dept_no, d.dept_name
FROM employee e, department d
WHERE e.dept_no = d.dept_no;

--------------------------------------------------
-- 9. Unique jobs in department 30 with location
--------------------------------------------------
SELECT DISTINCT e.job, d.location
FROM employee e, department d
WHERE e.dept_no = d.dept_no
AND e.dept_no = 30;

--------------------------------------------------
-- 10. Employees working in CALCUTTA
--------------------------------------------------
SELECT e.emp_name, e.dept_no, d.dept_name
FROM employee e, department d
WHERE e.dept_no = d.dept_no
AND d.location = 'CALCUTTA';

--------------------------------------------------
-- Commit (if needed)
--------------------------------------------------
COMMIT;
