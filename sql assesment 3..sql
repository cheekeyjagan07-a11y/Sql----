
#### String function

select upper(emp_name) from employees;

select upper(emp_name) as capital from employees where emp_name = "jagan";

select lower(emp_name)as emp from employees;

select lower(emp_name)as lower from employees where emp_name = "jagan";

select emp_name,length(emp_name) as leng from employees;

select emp_name,length(emp_name) as leng from employees where emp_name = 'jagan';

select concat(emp_name,"-",department) from employees;

select concat(emp_name," ",age) from employees;

select concat_Ws("-", emp_name, age, department) from employees;

select concat_Ws(",", emp_name, age, department) from employees;

select left(emp_name,3) from employees;

select left(emp_name,2)from employees where emp_name = "gugan";

select right(emp_name,3) from employees;

select right(emp_name,2) from employees where emp_name = "vivek";

select substring(emp_name ,  2,2)from employees;

select substring(emp_name ,  5,2)from employees where emp_name = "jagan";

select ltrim(emp_name) from employees;

select ltrim(emp_name) from employees where emp_name = "dinesh";

select rtrim(emp_name) from employees;

select rtrim(emp_name) from employees where emp_name = "suresh";

select replace( department, 'it', 'international_technology') from employees;

select reverse(emp_name) from employees;

select reverse(emp_name) from employees where emp_name = "vivek";

select char_length(emp_name)from employees;

#### joins

### Inner joins

use joins;

select * from employees;

select * from departments;

## Display the employee name and department name for all employees who belong to a department.

select e. emp_name, d. department from employees e inner join departments d

on d.department_id = e.department_id;


### Display employee name, salary, and department name for employees whose salary is greater than 30,000.

select e.emp_name, e. salary, d.department_name from employees e  inner join departments d

on d. department_id = e. department_id where salary >30000;

### Display department name and employee name for employees who work in IT or HR.

select e.emp_name, d. department_name from employees e inner join departments d 

on d. department_id = e. department_id where d.department_name in ( "it","hr");

#### Left join

##Display the employee name and department name for all employees. Even if an employee does not have a matching department, 
##that employee should still be displayed.

select e. emp_name, d. department_name from employees e left join departments d

on d.department_id = e.department_id;

## Display employee name, salary, and department name for employees whose salary is greater than 30,000.

select e.emp_name, e. salary, d.department_name from employees e  left join departments d

on d. department_id = e. department_id where salary >30000;

### Hint

### The question says “Display all departments”.
####So, we put the departments table first:

select e.emp_name, d. department_name from employees e inner join departments d 

on d. department_id = e. department_id where d.department_name in ( "it","hr");

## All departments should come, even if there are no employees.
### So we need to make departments the LEFT table:

select d.department_name, e. emp_name from departments d left join employees e 
on d.department_id = e. department_id;

### Right join

select e. emp_name, d. department_name from employees e right join departments d

on d.department_id = e.department_id;

### full outer join

Display all employees and all departments. If an employee has a matching department, show the department name. 
If there is no match, still display the employee.

select e. emp_name , d. department_name  from employees e left join departments d 

on d.department_id = e. department_id
union

select e. emp_name , d. department_name  from employees e right join departments d 

on d.department_id = e. department_id;

### self join

### Display  each employee name along with their manager name.

select e.emp_name , m.manager_name from employees a inner join employees b

on e. emp_name = m. manager_name ;

select e. emp_name as employeename , m. manager_name as managername from employees e inner join employees m
on e. manager_id = m.emp_id;

### union  

SELECT e.department_id
FROM employees e

UNION

SELECT d.department_id
FROM departments d;

### union all

select department_id from employees e
union all
select department_id from departments d;
 






