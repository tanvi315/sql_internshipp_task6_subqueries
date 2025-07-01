CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments( department_id, department_name)
 VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO employees VALUES
(101, 'Alice', 2, 70000),
(102, 'Bob', 1, 55000),
(103, 'Charlie', 3, 80000),
(104, 'David', 2, 60000);

select * from employees;
select * from departments;

select name
from employees
where department_id = (
	select department_id from departments where department_name = 'IT'
);

select name,
(
select department_name
from departments
where departments.department_id = employees.department_id) as dept_name
from employees;

select department_name
from departments d
where exists(
	select 1 from employees e where e.department_id = d.department_id
);

select department_name, avg_salary
from(
	select department_id, avg(salary) as avg_salary
    from employees
    group by department_id

) as dept_avg
join departments d on d.department_id = dept_avg.department_id;

