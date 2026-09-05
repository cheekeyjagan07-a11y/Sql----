show databases;

create database tech_panda;

use tech_panda;

create table employees (
emp_id int, emp_name varchar(15), department varchar(20),salary decimal (7,2),city varchar(20)
);

select * from employees;

insert into employees values(001,'jagan','it',25000.50,'chennai'),
(002, 'karthick', 'it', 22000.50, 'cuddalore'),
(003, 'vivek', 'big data', 52000.50, 'kooddalore'),
(004, 'dinesh', 'sql', 42000.50, 'vilupuram'),
(005, 'mani' ,'python developer', 22000.50, 'cuddalore');

select * from employees;
insert into employees (emp_id , emp_name,department,salary,city)
values(006,'naresh','java',25000.50,'chennai');

insert into employees (emp_id , emp_name,department,salary,city) values (007,'suresh','python',35000.50,'koyambatore'),
(008,'divya','tablue',15000.50,'yercaud'),(009,'vijay','sql',25000.50,'kochin'),(10,'rajni','ap',35000.50,'chennai');


select * from employees;

alter table employess add primary key (emp_id);


delete from employees where emp_id in (8, 9, 10);
delete from employees where emp_id = 7;


DELETE FROM employees
WHERE emp_id IN (8, 9, 10);

SET SQL_SAFE_UPDATES = 0;

select city, department from employees;

select salary as monthly_salary from employees;

select * from employees;

select department from employees;

select distinct department from employees;

select count(department) from employees;
select count(distinct department) from employees;

select emp_name , salary * 12 as annual_salary from employees;

#### arithmetic operator

select emp_name, salary +5000 as bonus from employees;

select * from employees;

alter table employees add age int;
alter table employees modify column age int after emp_name;

update employees set age = 25  where emp_id between 1 and 10;

### Practise question

### 1 Display all columns from the employees table

select * from employees;

#### 2 Display only employee_ id and name

select emp_name , emp_id from employees;

#### 3 Display only department.

select department from  employees;

#### 4 show uniqe DEPARTMENTS using distinct.

select distinct department from employees;

select count(  distinct department ) from employees;

##### 5 display employees names and annual salaries

select emp_name, salary * 12 as annual_salary from employees;

#### 6 Rename the salary column as monthly salary;

alter  table employees rename column salary to monthly_salary;

select * from employees;

select monthly_Salary as salary from employees;

#### 7 display employee names with a constant coloumn named company having the value ' tech panda' 

select emp_name, 'tech_panda' as company from employees;

select emp_name, 'supervisor' as position from employees;

#### 8 increases every salary by 10000 and displayed it as updated_salary

select emp_name, monthly_salary +10000 as updated_Salary from employees;













