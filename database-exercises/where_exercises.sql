USE employees;

SELECT * FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya';


SELECT * FROM employees
WHERE last_name LIKE '%E'
OR last_name LIKE 'E%';


SELECT * FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';

SHOW TABLES;

SELECT emp_no FROM salaries
ORDER BY salary DESC
LIMIT 5 OFFSET 50;