#### sub query

#### single row subquery

###Q1. Find the employees who earn more than the average salary of all employees.

select emp_name, salary  from employees where salary >( select avg(salary) from employees);

### Find the employee(s) who have the highest salary.

select emp_name, salary from employees where salary =(select max(salary) from employees);

### Find the employee(s) who have the lowest salary

select emp_name, salary from employees where salary  =( select min(salary) from employees);

### Find the employees whose salary is less than the average salary.

select emp_name, salary from employees where salary <(select avg(Salary) from employees);

### Q5. Find the employee(s) who earn the same salary as the employee with emp_id = 3.
select emp_name , salary from employees where salary = (select salary from employees where emp_id = 3);

### Q6. Find the employees who earn more than the salary of Jagan.

SELECT emp_name , salary from employees where salary >(select salary from employees where emp_name = 'jagan');

#### Q7. Find the employees whose salary is greater than the minimum salary of the HR department.

select emp_name, salary from employees where salary >(select min(salary) from employees where department= "hr");

### Find the employees whose salary is equal to the maximum salary in the IT department.

select emp_name , salary from employees where salary = (select max(Salary) from employees  where department = 'it');

## Find the employees whose salary is greater than the minimum salary in the HR department.

select emp_name , salary from employees where salary >(select min(salary) from employees where department = "hr");

### Find the employee(s) who have the same salary as the employee with the highest salary in the Sales department.

select emp_name, salary from employees where salary = ( select max(Salary) from employees where department = "sales");

### multi row subquery

### Find the employees who work in the same departments as the employees who have a salary greater than 50,000

select  emp_name, department from employees where department in (select department from employees where salary > 50000);

### Find the employees whose salary matches any salary of employees working in the HR department.

select emp_name , salary from employees where salary in (select salary from employees where department = 'hr');

### Find the employees who belong to departments where at least one employee has a salary greater than 60,000.

select emp_name, deparment from employees where deparment in(select emp_name from employees where salary > 60000);

##Find the employees whose department is the same as the department of the employee with the highest salary.

select emp_name , department from employees where department in ( select max(Salary) from employees);

#### Find the employees whose salary is greater than any salary in the HR department.

select emp_name,salary from employees where salary >any (select salary from employees where department = "hr");

#### Find the employees whose salary is less than any salary in the IT department.

select emp_name, salary from employees where salary < any ( select salary from employees where department = "it");

### Find the employees whose salary is greater than any salary in the Sales department.

select emp_name , salary from employees where salary >any (select salary from employees where department = "sales");

### Find the employees whose salary is less than any salary in the HR department.

select emp_name , salary from employees where salary <any (select salary from employees where department = "hr");

### Find the employees whose salary is greater than all salaries in the HR department.alter

select emp_name, salary from employees where salary >all (select salary from employees where department = "hr");

### Find the employees whose salary is less than all salaries in the IT department.

select emp_name, salary from employees where salary <all (select salary from employees where department= "it");

###  Scalar Subquery

## Display each employee's name, salary, and the average salary of all employees.

select emp_name, salary , (select avg(salary) from employees ) as avgsalary from employees;

### Display each employee's name, salary, and the maximum salary in the company.

select emp_name, salary ,(select max(Salary) from employees) as maxsalary from employees;

select emp_name, salary,(select min(salary) from employees) as minsalary from employees;

#### correlated subquery

#### Find the employees whose salary is greater than the average salary of their own department.

select e.emp_name, e.salary, e.department from employees e where salary >(select avg(e2.salary) from employees e2 where e.department = e2.department);


### Find the employees who have the highest salary in their own department.

select e.emp_name, e.salary, e.department_id from employees e where salary = (select max(e2.salary)from employees e2 where e.department_id = e2.department_id);


### Find the employees who have the lowest salary in their own department.

select e.emp_name, e. salary, e. department_id from employees e where salary=(select min(e2.Salary) from employees e2 where e.department_id = e2.department_id);

### Find the employees who have the highest salary in their own department and display the employee name, salary, and department name.

select e. emp_name, e.salary, d.department_name from employees e join departments d on d.department_id = e.department_id where salary = 
(select max(e2.salary) from employees e2 where e. deparment_id = e2.deparment_id);

##Find the employees whose salary is less than the average salary of their own department.

select e.emp_name, e.salary from employees e where salary < (select avg(e2.salary) from employees e2 where e.department_id = e2.department_id);

##Find the employees whose salary is greater than the average salary of their own department,
## and display the employee name, salary, and department name.

select e.emp_name, e.salary, d.department_name from employees e join departments d on e.department_id = d.department_id where salary >
(select avg(e2.salary)from employees e2  where e.department_id = e2. department_id);

### Find the employees who have the lowest salary in their own department, 
### and display the employee name, salary, and department name.

select e.emp_name, e.salary,d.department_name from employees e join departments d on e.department_id  = d.department_id where e.salary=
(select min(e2.salary) from employees e2 where e.department_id = e2.department_id);

#### Nested subquery

### Find the employees who earn more than the average salary of the IT department.

select emp_name, salary from employees where salary > (select avg(Salary)from employees where department_id =
(select department_id from departments where department_name = "it"));

# Find the employees who earn less than the highest salary of the HR department.
select emp_name, salary from employees where salary <(select max(salary)from employees where department_id =
(Select department_id from departments where department_name = "hr"));

## Find the employees whose salary is equal to the lowest salary of the Finance department.

select emp_name,salary from employees where salary = (select min(salary)from employees where department_id = (select department_id from departments where 
department_name = 'finance'));

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees));





















   