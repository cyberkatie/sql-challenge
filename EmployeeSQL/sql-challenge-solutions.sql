
-- Data Analysis

--List the employee number, last name, first name, sex, and salary of each employee.
Select a.emp_no, a.last_name, a.first_name, a.sex, b.salary
from employees a inner join salaries b
on a.emp_no = b.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01' and hire_date <= '1986-12-31'

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select a.emp_no, c.last_name, c.first_name, a.dept_no, b.dept_name
from dept_manager a inner join departments b on a.dept_no = b.dept_no
					inner join employees c on a.emp_no = c.emp_no
					
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select a.emp_no, a.last_name, a.first_name, c.dept_name
from employees a inner join dept_emp b on a.emp_no = b.emp_no
				inner join departments c on b.dept_no = c.dept_no
				
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name
select a.emp_no, a.last_name, a.first_name
from employees a inner join dept_emp b on a.emp_no = b.emp_no
				inner join departments c on b.dept_no = c.dept_no
where c.dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select a.emp_no, a.last_name, a.first_name, c.dept_name
from employees a inner join dept_emp b on a.emp_no = b.emp_no
				inner join departments c on b.dept_no = c.dept_no
where a.emp_no 
in
	(select a.emp_no
	from employees a inner join dept_emp b on a.emp_no = b.emp_no
					inner join departments c on b.dept_no = c.dept_no
	where c.dept_name = 'Sales'
	intersect
	select a.emp_no
	from employees a inner join dept_emp b on a.emp_no = b.emp_no
					inner join departments c on b.dept_no = c.dept_no
	where c.dept_name = 'Development')

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
select last_name, count(*) as cnt
from employees
group by last_name order by cnt desc