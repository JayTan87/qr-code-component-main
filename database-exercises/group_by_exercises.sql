USE employees;

SELECT DISTINCT title
FROM titles;

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name
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