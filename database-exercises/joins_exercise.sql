CREATE DATABASE join_test_db;

USE join_test_db;

CREATE TABLE roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');
INSERT INTO roles (name)
VALUES ('author');
INSERT INTO roles (name)
VALUES ('reviewer');
INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', null),
       ('mike', 'mike@example.com', null);

USE employees;



SELECT *
FROM employees;

SELECT d.dept_name                            AS "Department Name",
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',
       s.salary                               AS Salary
FROM employees e
         JOIN dept_manager m
              ON e.emp_no = m.emp_no
         JOIN salaries s
              ON m.emp_no = s.emp_no
         JOIN departments d
              ON d.dept_no = m.dept_no
WHERE m.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
ORDER BY d.dept_name;

# WHERE e.gender = 'F';


SELECT t.title AS Title, COUNT(*) AS Count
FROM titles t
         JOIN dept_emp e
              ON t.emp_no = e.emp_no
         JOIN departments d
              ON d.dept_no = e.dept_no
WHERE dept_name = 'Customer Service'
  AND e.to_date = '9999-01-01'
  AND t.to_date = '9999-01-01'
GROUP BY title;

SELECT CONCAT(e.first_name, ' ', e.last_name)       AS Employee,
d.dept_name                                         AS Department,
CONCAT(managers.first_name, ' ', managers.last_name) AS Manager
FROM employees e
    JOIN dept_emp de
        ON e.emp_no = de.emp_no
    JOIN departments d
        ON de.dept_no = d.dept_no
    JOIN dept_manager dm
        ON d.dept_no = dm.dept_no
    JOIN employees managers
        ON dm.emp_no = managers.emp_no
WHERE de.to_date = '9999-01-01'
AND dm.to_date = '9999-01-01'
ORDER BY managers.first_name DESC, e.emp_no;

