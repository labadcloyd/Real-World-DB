SELECT * FROM employee
ORDER BY salary DESC;

SELECT * FROM employee
ORDER BY sex, first_name, last_name;

-- Get only the first name and last name of employees
SELECT last_name AS surname, first_name AS forename
FROM employee
ORDER BY last_name, first_name;

-- Find all different genders
SELECT DISTINCT sex
FROM employee;

-- FUNCTIONS
-- Find the number of employees
SELECT COUNT (emp_id)
FROM employee;

-- Find the number of female employees born after 1970
SELECT COUNT (emp_id)
FROM employee
WHERE sex = 'F' AND birth_date >= '1970-01-01';

-- Find the avg of employee salary
SELECT AVG(salary)
FROM employee;

-- Find the avg of employee salary who are male
SELECT AVG(salary)
FROM employee
WHERE sex = 'M';

-- Find the sum of employee salary
SELECT SUM(salary)
FROM employee;

-- Find out how many males and females in the company
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

-- Find the total sales of each salesman
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;

-- WILDCARDS
-- Find any client who is an LLC
SELECT *
FROM client
WHERE client_name LIKE '%EX%';

-- Find employee who is born on october
SELECT *
FROM employee
WHERE birth_date LIKE '____-10%';

-- Find clients who are schools
SELECT *
FROM client
WHERE client_name LIKE '%School%';

-- UNIONS
-- Find a list of employees and branch names
SELECT first_name AS company_names
FROM employee
UNION
SELECT branch_name
FROM branch;

-- JOINS
-- Find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, employee.last_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

-- Find all branches and the names of their managers (including the left table)
SELECT employee.emp_id, employee.first_name, employee.last_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

-- Find all branches of each employee
SELECT employee.emp_id, employee.first_name, employee.last_name, branch.branch_name
FROM employee
JOIN branch
ON employee.branch_id = branch.branch_id;

-- Find all branches and supervisers of each employee
SELECT
    employee.emp_id,
    employee.first_name,
    employee.last_name,
    branch.branch_name,
    employee.super_id,
    a.first_name AS super_first_name,
    a.last_name AS super_last_name
FROM employee
JOIN branch
ON employee.branch_id = branch.branch_id
LEFT JOIN employee a
ON employee.super_id = a.emp_id;


-- NESTED QUERIES
-- Find names of all employees who have sold over 30,000 to a single client
SELECT employee.first_name, employee.last_name, employee.emp_id
FROM employee
WHERE employee.emp_id IN (
    SELECT works_with.emp_id
    FROM works_with
    WHERE works_with.total_sales > 30000
);

-- Find all clients who are handled by the branch that Michael Scott manages
SELECT client.client_id, client.client_name
FROM client
WHERE client.branch_id = (
    SELECT branch.branch_id
    FROM branch
    WHERE branch.mgr_id = 3
    LIMIT 1
);
