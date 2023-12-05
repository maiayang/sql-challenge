--List the employee number, last name, first name, sex, and 
--salary of each employee.
SELECT 
employees.emp_no,
employees.last_name,
employees.first_name, 
employees.sex,
salaries.salary
FROM employees
INNER JOIN employee_salaries as salaries ON
employees.emp_no=salaries.emp_no;

--List the first name, last name, and hire date for the 
--employees who were hired in 1986.
SELECT
first_name,
last_name,
hire_date
FROM employees
WHERE 
DATE_PART('Year', hire_date)='1986'

--List the manager of each department along with their 
--department number, department name, employee number, last name, 
--and first name.
SELECT
d.dept_no,
d.dept_name,
m.emp_no,
e.last_name,
e.first_name
FROM departments as d
INNER JOIN managers as m ON
d.dept_no=m.dept_no
LEFT JOIN employees as e ON
m.emp_no=e.emp_no
ORDER BY dept_no;

--List the department number for each employee along with 
--that employee’s employee number, last name, first name, and 
--department name.
SELECT
e.emp_no,
e.last_name,
e.first_name,
de.dept_no,
d.dept_name
FROM employees as e
INNER JOIN dept_employees as de ON
de.emp_no=e.emp_no
LEFT JOIN departments as d ON
de.dept_no=d.dept_no;

--List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE (first_name='Hercules' AND last_name LIKE 'B%');

--List each employee in the Sales department, including their 
--employee number, last name, and first name.
SELECT
e.emp_no,
e.last_name,
e.first_name
FROM employees as e
INNER JOIN dept_employees as de ON
de.emp_no=e.emp_no
LEFT JOIN departments as d ON
de.dept_no=d.dept_no
WHERE d.dept_name='Sales';

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, 
--and department name.
SELECT
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees as e
INNER JOIN dept_employees as de ON
de.emp_no=e.emp_no
LEFT JOIN departments as d ON
de.dept_no=d.dept_no
WHERE (d.dept_name='Sales' OR d.dept_name='Development');

--List the frequency counts, in descending order, of all the 
--employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;