USE employees;


SELECT *
FROM employees
WHERE first_name = 'Irena'
   OR first_name = 'Vidya'
   OR first_name = 'Maya'
ORDER BY last_name, first_name;


SELECT *
FROM employees
WHERE last_name LIKE '%E'
   OR last_name LIKE 'E%'
ORDER BY emp_no DESC;
SELECT CONCAT(first_name, ' ', last_name)
FROM employees;


SELECT *
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%';

SELECT *
FROM employees
WHERE year(hire_date) > 1990
  AND MONTH(birth_date) =12
  AND DAY(birth_date) = 25
ORDER BY birth_date ASC, hire_date DESC
LIMIT 1;
select datediff(now(), '1999-08-31');
