USE employees;

SELECT CONCAT(emp_no,' - ',first_name, ' ', last_name) AS full_name,CONCAT(birth_date) AS DOB
FROM employees
LIMIT 10;