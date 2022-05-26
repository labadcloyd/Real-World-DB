INSERT INTO branch (branch_name) VALUES 
    ('Corporate'),
    ('Scranton'),
    ('Corporate');
SELECT * FROM branch;

INSERT INTO employee (first_name, last_name, birth_date, sex, salary, branch_id) VALUES 
    ('David', 'Wallace', '1967-11-17', 'M', 250000, 1),
    ('Jan', 'Levinson', '1961-05-11', 'F', 110000, 1),
    ('Michael', 'Scott', '1964-03-15', 'M', 75000, 2),
    ('Angela', 'Martin', '1971-06-25', 'F', 63000, 2),
    ('Kelly', 'Kapoor', '1960-02-05', 'F', 55000, 2),
    ('Stanley', 'Hudson', '1958-02-19', 'M', 69000, 2),
    ('Josh', 'Porter', '1969-09-05', 'M', 78000, 3),
    ('Andy', 'Bernard', '1973-07-22', 'M', 65000, 3),
    ('Jim', 'Halpert', '1978-10-01', 'M', 71000, 3);
SELECT * FROM employee;

UPDATE branch
SET mgr_id = 1 WHERE branch_id = 1;
-- SET mgr_id = 3 WHERE branch_id = 2
-- SET mgr_id = 7 WHERE branch_id = 3
SELECT * FROM branch;

UPDATE employee
SET super_id = 1 WHERE emp_id = 2;
-- SET super_id = 1 WHERE emp_id = 3
-- SET super_id = 3 WHERE emp_id = 4
-- SET super_id = 3 WHERE emp_id = 5
-- SET super_id = 3 WHERE emp_id = 6
-- SET super_id = 1 WHERE emp_id = 7
-- SET super_id = 7 WHERE emp_id = 8
-- SET super_id = 7 WHERE emp_id = 9
SELECT * FROM employee;

INSERT INTO client(client_name, branch_id) VALUES
    ('Dunmore Highschool', 2),
    ('Lackawana Country', 2),
    ('FedEx', 3),
    ('John Daly Law, LLC', 3),
    ('Scranton Whitepages', 2),
    ('Times Newspaper', 3),
    ('FedEx', 2);
SELECT * FROM client;

INSERT INTO works_with (emp_id, client_id, total_sales) VALUES 
    (6, 1, 55000),
    (3, 2, 267000),
    (9, 3, 22500),
    (8, 4, 5000),
    (9, 4, 12000),
    (6, 5, 33000),
    (8, 6, 26000),
    (3, 7, 15000),
    (6, 7, 130000);
SELECT * FROM works_with;