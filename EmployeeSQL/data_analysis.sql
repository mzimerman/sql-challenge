-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

select e.emp_no as "Employee Number", e.last_name as "Last Name", 
e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
		from employees e
		left join salaries s on e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

select e.first_name as "First Name", e.last_name as "Last Name", 
e.hire_date as "Hire Date"
		from employees e
		where extract(YEAR from hire_date) = 1986;


-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

select d.dept_no as "Department Number", d.dept_name as "Department Name",
dm.emp_no as "Manager Employee Number", e.last_name as "Manager Last Name",
e.first_name as "Manager First Name"
		from departments d
		left join dept_manager dm on d.dept_no = dm.dept_no
		left join employees e on dm.emp_no = e.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

select e.emp_no as "Employee Number", e.last_name as "Last Name", 
e.first_name as "First Name", d.dept_name as "Department Name"
		from employees e
		left join dept_emp de on e.emp_no = de.emp_no
		right join departments d on de.dept_no = d.dept_no;

-- List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."

select * from employees
		where first_name = 'Hercules' 
		and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

select de.emp_no as "Employee Number", e.last_name as "Last Name",
e.first_name as "First Name", d.dept_name as "Department Name"
		from dept_emp de
		inner join employees e on de.emp_no = e.emp_no
		inner join departments d on de.dept_no = d.dept_no
		and d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

select de.emp_no as "Employee Number", e.last_name as "Last Name",
e.first_name as "First Name", d.dept_name as "Department Name"
			from dept_emp de
			inner join employees e on de.emp_no = e.emp_no
			inner join departments d on de.dept_no = d.dept_no
			and d.dept_name in ('Sales','Development');

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

select last_name as "Employee Last Name", count(last_name) as "Count"
		from employees e
		group by last_name
		order by "Count" DESC;