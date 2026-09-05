use tech_panda;

select * from employees;

##### where clauss with operator

select emp_name , monthly_salary from employees where department= "it" and monthly_salary > 25000.50;

select * from employees where department = 'sql' and monthly_Salary < 35000.50;

select * from employees where monthly_salary >= 35000.00;
select * from employees where monthly_salary <= 25000.50;
select * from employees where monthly_salary <> 25000.50;
select * from employees where monthly_salary != 35000.50;

select emp_name, emp_id , department from employees where department = 'it' or 'sql';

select emp_name , department from employees where department IN( 'it', 'sql', 'python');

select emp_name , department from employees where department not IN( 'it', 'sql', 'python');

select emp_name , department,monthly_salary from employees where monthly_salary between 25000.50 and 45000.50;

select * from employees where monthly_salary between 25000.00 and 50000.50;
select * from employees where monthly_salary not between 25000.00 and 50000.50;

select * from employees where emp_name like 'j%';

select * from employees where emp_name like 'd%';

select * from employees where emp_name not like 'd%';

select * from employees where monthly_salary is null;

select * from employees where monthly_salary is not null;

insert into employees(emp_id, emp_name,age, city) values (11,"gugan", 25, "pondycheri");

select count(*) from employees;

select monthly_salary +  500 as updatedsalary from employees;
select monthly_salary -  500 as updatedsalary from employees;
select monthly_salary *  500 as updatedsalary from employees;
select monthly_salary /  500 as updatedsalary from employees;
select monthly_salary % 500 as updatedsalary from employees;

##### Aggrigate function

select count(monthly_salary) from employees;

select max(monthly_salary) from employees ;

select min(monthly_salary) from employees;

select avg(monthly_salary) from employees;

#### order by offset

select * from employees;

select * from employees order by monthly_salary desc;

select * from employees where salary is not null order by salary;

select * from employees order by monthly_salary;

select emp_name , department, monthly_salary from employees order by monthly_salary desc limit 5 offset 2;

select * from employees order by monthly_salary limit 2 offset 2;


####### Group by and having and rollup

select department, sum(monthly_salary) as total_salary from employees group by department with rollup;



select department, avg(monthly_salary) as avgsalary from employees group by department;

select department, count(*) as employee_count from employees group by department;  #### This type null values showing 

select department, count(emp_name) as employee_count from employees group by department; ### this type dosent showing null values		

select department, max(monthly_Salary) as maximumsalary from employees group by department;

select department, min(monthly_Salary) as minimumsalary from employees group by department;

## Find the number of employees in each department.

select department, count(emp_id) from employees group by department;

### Find the total salary for each department.

select department,sum(monthly_salary) from employees group by department;

### Find the average salary for each department.

select department, avg(monthly_salary) from employees group by department;

## Find the highest salary in each department.

select department, max(monthly_Salary) from employees group by department;

## Find the number of employees in each department whose salary is greater than 25,000.

select department, count(emp_name) as total_employee from employees where monthly_salary >25000 group by department;

#### Find the departments that have more than 2 employees

select department, count(department) from employees group by department  having count(department) > 2;

#### Find the departments that have more than 2 employees whose salary is greater than 25,000.

select department, count(emp_name) from employees where monthly_Salary > 25000 group by department having count(emp_name)>2;

#### Find the total salary for each department and display the departments from highest total salary to lowest.

select department, sum(monthly_Salary) as totalsalary from employees group by department order by totalsalary desc;

### Find the average salary of each department, show only departments whose average salary is greater than 30,000, and sort them from highest average salary to lowest.

select department, avg(monthly_Salary) as averagesalary from employees group by department having avg(monthly_Salary)>30000 order by averagesalary desc;

# Find the number of employees in each city for the IT department, show only cities having more than 1 employee,
 # and sort the result by employee count from highest to lowest.
 
 select city, department, count(emp_name)as it_city from employees where department = 'it' group by city, department having count(emp_name)>1 order by it_city desc;

#For employees with a salary greater than 25,000, find the total salary and number of employees in each department.
# Show only departments having more than 2 employees,
# total salary from highest to lowest, and skip the first department.
 
select department, sum(monthly_Salary) as totalsalary from employees where monthly_Salary >25000 group by department
having count(department) > 2 order by totalsalary desc limit 4 offset 1;

###For employees from Chennai or Cuddalore, find the average salary for each department. 
##Show only departments whose average salary is greater than 30,000, sort by average salary from highest to lowest,
## and display the next 2 departments after skipping the first 1.

select * from employees;

select department, avg(monthly_salary) as avgsalary from employees 
where city = 'chennai' or city= 'cuddalore' group by department  having avg(monthly_salary)>30000 order by avgsalary desc limit 2 offset 1 ;

##For employees whose age is between 25 and 35, find the number of employees in each city for each department.
 #Show only groups having more than 1 employee, sort by employee count from highest to lowest, skip the first 2 groups, 
# and display the next 3 groups.

select city, department, count(emp_name) as employee_count from employees where age between 25 and 35 group by city, department having count(emp_name)>1 
order by employee_Count desc limit 3 offset 2;

select department, avg(monthly_salary) as avgsalary from employees where age between 25 and 30 group by department having count(department) >1 order by avgsalary desc limit 3 offset 1;

#### windows function 

###Row_number()

#### Assign a unique row number to each employee based on their salary in descending order.

select * from employees;

select emp_name, department, monthly_salary, row_number() over(order by monthly_Salary desc)as rownumber from employees;

### Rank

### Rank all employees based on their salary in descending order.


alter table employees rename column monthly_salary to salary;
select emp_name, department,salary, rank() over(order by salary desc) as Ranking from employees;

## Dense rank
###Find the salary rank of each employee using DENSE_RANK().

select emp_name, department,salary, dense_rank() over(order by salary desc) from employees;

select emp_name,department, salary, row_number() over (order by salary desc) as rownumber,
rank() over(order by salary desc)as ranking, dense_rank() over (order by salary desc)as denserank from employees;

### partition by

SELECT *
FROM (
    SELECT 
        e.*,
        RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM employees e
) x
WHERE rnk = 1;

### find the highest rank from each department

select * from ( select emp_name , salary,department, rank() over(partition by department order by salary desc) as rnk from employees e) x where rnk = 1;

### find the second highest rank from each department

select * from (select emp_name, salary,department, rank() over( partition by department order by salary desc) as rnk from employees e) x where rnk = 2;


### Lag

select emp_name, salary , department, lag (salary) over(order by salary desc) as previous_salary from employees;

### Lead

select emp_name, salary, lead(salary) over(order by salary) as next_salary from employees;

### Ntile
##Divide employees into 3 salary groups.

select emp_name,salary, ntile(3) over (order by salary desc) as salarygroup from employees;

### first value()

select emp_name, salary, first_value(salary) over(order by salary desc) as highest_sal from employees;

### last value()

select emp_name, salary, last_value(Salary) over(order by salary ) as lowestsalary from employees;


### running total
select emp_name, salary, department,sum(salary) over ( order by salary) as running_total from employees;

SELECT
    emp_name,
    salary,
    department,
    SUM(salary) OVER(
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM employees;

### Department average

select emp_name,department , avg(salary) over(partition by department) as dep_avg from employees;

### deparment employee count

select emp_name, department, count(*) over(partition by department) dept_count from employees;

select department, count(*) as department_count from employees group by department;

select emp_name , salary from employees where salary >25000 and age between 25 and 30;

## Display the total salary of each department and show only departments whose total salary is greater than 60,000

select department,sum(Salary) from employees group by department having sum(salary) >60000;

select department, avg(salary) as avgsalary  from employees group by department order by avgsalary desc;

select * from employees where department in ('ap','it') order by salary desc;

select * from employees where emp_name like 'j%' order by salary limit 3 offset 0;

select department, avg(Salary) as avgsalary from employees group by department order by avgsalary desc;

select department ,count(emp_name)as emp from employees group by department having emp >2;