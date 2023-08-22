USE employees;

SELECT DISTINCT title FROM titles;

SELECT DISTINCT last_name, first_name FROM employees
WHERE last_name LIKE '%E'
   AND last_name LIKE 'E%'
ORDER BY last_name;

SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%'
    AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT gender, COUNT(first_name)
FROM employees
WHERE first_name = 'Irena'
   OR first_name = 'Vidya'
   OR first_name = 'Maya'
GROUP BY gender;