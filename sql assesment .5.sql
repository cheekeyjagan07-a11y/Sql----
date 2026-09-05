## cte ## syntax

### with cte name as ( select column1 , coulumn2 from table name where condition)
# select * from cte name

### Display all employees

with emp_Cte as (select * from employees) select *  from emp_Cte ;

select * from emp_cte;

## employees earning more than 50000

with high_Salary as 
(select * from employees where salary >50000) select * from high_Salary;

## employees hired after  01-01-2020

with new_employee as (select * from employees where hire_Date = '2020-01-01') select * from new_employee;

### employees earning above avgsalary

with avg_Salary as (select * from employees where salary >(select avg(Salary) from employees )) select * from avg_Salary;

## department wise employee count

with  emp_count as (select department, count(*) from employees group by department) select * from emp_count;

### department wise maximum salary

with max_Salary as ( select emp_name, department, max(salary) from employees group by department , emp_name) select * from max_Salary;

#### multiple cte

with highest_salary as (select emp_name, salary from employees where salary = (select max(salary)from employees)), min_salary as 
((select * from salary where department like 'it%')) select * from hightst salary;

WITH highest_salary AS
(
    SELECT emp_name, salary
    FROM employees
    WHERE salary = (SELECT MAX(salary) FROM employees)
),
it_employee AS
(
    SELECT emp_name, salary
    FROM employees
    WHERE department LIKE 'IT%'
)
SELECT emp_name, salary
FROM highest_salary

UNION ALL

SELECT emp_name, salary
FROM it_employee;

with department_wise as 

(select department, max(salary) from employees group by department
), minimum as (select department,min(salary) from employees group by department)
select emp_name, salary from department_wise
union all
select emp_name,salary from minimum;

### join cte

with max_Salary as 

(select department, max(salary) as max_Salary from employees group by department),

min_Salary as 

(select department, min(salary)as min_salary from employees group by department)

select m.department, m.max_salary, n.min_Salary from max_Salary m left join min_Salary n
on m. department = n.department;


use tech_panda;

### views 

create database shadowfax;

use shadowfax;

create table employees (emp_id int auto_increment primary key, first_name varchar(15), last_name varchar(15),email varchar(50),

phone_number varchar(15), hire_Date date, job_id int, salary decimal(10,2), commision_pct decimal(7,2),manager_id int, department_id int);

select * from employees;
ALTER TABLE employees
MODIFY salary DECIMAL(7,2);

insert into employees ( first_name, last_name,email,phone_number,hire_Date,job_id,salary, manager_id ,department_id)
values( "jagan","deesan","cheekeyjagan",9940290556, '2022-10-20', 10, 15000.25, 10, 20);

insert into employees ( first_name, last_name,email,phone_number,hire_Date,job_id,salary, manager_id ,department_id)
values( "vivek","deesan","vivekjagan",9940290526, '2022-08-20', 20, 12000.25, 20, 30),
( "vijay","yesu","vijay ",8025320161, '2021-02-20', 30, 12000.25, 30, 40),
( "vickey","waran","vickey",8825681305, '2022-08-20', 20, 12000.25, 20, 30),
( "santh","kumar","santh",7845681305, '2025-03-20', 40, 17000.25, 40, 50),
( "akilesh","kanth","akilesh",9840194504, '2020-02-20', 50, 20000.50, 50, 60);


select * from employees;

create table department (department_id int,department_name varchar(15),location_id varchar(15));

insert into department values (10 ,  "it", "ambattur"),(20 ,  "accounts", "ambattur"),(30 ,  "it", "ambattur"),(40 ,  "accounts", "ambattur"),
(50 ,  "accounts", "ambattur"),(60 ,  "accounts", "avadi");

select* from department;
select * from employees;

create view	emp_salary as 

select salary from employees;
select * from emp_Salary
emp_salary;
drop view emp_salary;

create view emp_view as 
select emp_id,first_name,salary from employees;
select * from emp_view;

# department employee view

create view it_employees as 
select * from employees where department_id =60;

### high salary employees

create view high_Salary as 

select * from employees where salary >50000;

### view with joins

create view emp_dept_view as 
 
select e.emp_id, e.first_name, d.department_name from employees e join department d on e. department_id = d.department_id;

### Employee salary report
create view emp_salary_report as 
select e.emp_id, e.first_name ,e.salary, d.department_name from employees e join department d on e.department_id = d.department_id ;

## aggrigate views 

create view avg_Salary as 
select department_id, avg(Salary)as avgsalary from employees group by department_id;

### depatment vise max salary
create view max_Salary as 
select department_id, max(salary)from employees group by department_id;

select* from employees;




update employees set salary = 60000 where emp_id = 1;


select * from emp_salary_report;

update emp_salary_Report set salary = 55000 where emp_id = 2;

#### set opretor union ,union all , intersect , minus


create table employees_2025 (emp_id int auto_increment primary key, first_name varchar(15), department_id int, salary decimal);
create table employees_2026(emp_id int auto_increment primary key, first_name varchar(15), department_id int, salary decimal);

insert into employees_2025 values( 101 , "john", 10 ,50000),( 102 , "David", 20 ,65000),(103,"mary",30,45000),(104,"steve",40,55000);
insert into employees_2026 values( 103 , "mary", 30 ,45000),( 104 , "steve", 40 ,55000),(105,"james",50,70000),(106,"sara",60,60000);

select * from employees_2025;
select * from employees_2026;

###union

select emp_id,first_name from employees_2025
union
select emp_id,first_name from employees_2026;

select department_id from employees_2025
union
select department_id from employees_2026;

select first_name from employees_2025
union
select first_name from employees_2026;
### union all


select first_name from employees_2025
 union all
select first_name from employees_2026;

select department_id from employees_2025
union all
select department_id from employees_2026;

### intersect

select department_id from employees_2025

intersect

select department_id from employees_2026;

select first_name from employees_2025
intersect
select first_name from employees_2026;

## 

select emp_id,first_name from employees_2025

except
 
select emp_id, first_name from employees_2026;










