use anpd_6155
CREATE TABLE employee(
      emp_id int primary key,
      first_name varchar(50),
      last_name varchar(50),
      gender varchar(15),
      department varchar(50),
      salary double,
      hire_date date,
      city varchar(50)
);

INSERT INTO employee(emp_id,first_name, last_name, gender, department, salary, hire_date, city)
VALUES

(101, 'Amit', 'Sharma', 'Male', 'HR', 45000.00, '2022-05-15', 'Kolkata'),
(102, 'Priya', 'Singh', 'Female', 'Finance', 68000.00, '2021-06-20', 'Delhi'),
(103, 'Rahul', 'Verma', 'Male', 'IT', 75000.00, '2023-03-10', 'Bengaluru'),
(104, 'Sneha', 'Roy', 'Female', 'Marketing', 55000.00, '2022-02-18', 'Kolkata'),
(105, 'Arjun', 'Das', 'Male', 'IT', 80000.00, '2020-09-25', 'Kolkata'),
(106, 'Neha', 'Gupta', 'Female', 'Sales', 48000.00, '2022-11-05', 'Mumbai'),
(107, 'Vikram', 'Patel', 'Male', 'Finance', 65000.0  0, '2021-08-12', 'Ahmedabad'),
(108, 'Ananya', 'Sen', 'Female', 'HR', 52000.00, '2024-01-08', 'Kolkata'),
(109, 'Rohan', 'Mehta', 'Male', 'Sales', 58000.00, '2023-05-17', 'Pune'),
(110, 'Kavita', 'Nair', 'Female', 'Marketing', 58000.00, '2020-12-01', 'Chennai');

INSERT INTO employee(emp_id,first_name, last_name, gender, department, salary, hire_date, city)
VALUES(111, 'Amit', 'Sharma', 'Male', 'HR', 45000.00, '2022-05-15', 'Kolkata')
Select * from employee;
INSERT INTO employee
VALUES(112, 'Amit', 'Sharma', 'Male', 'HR', 45000.00, '2022-05-15', null)
INSERT INTO employee(emp_id,first_name, gender, department,  hire_date, city)
VALUES(113, 'Amit', 'Male', 'HR', '2022-05-15', 'Kolkata')
ALTER table employee add(mobile varchar(15));               -- new colm mobile is added  
desc emp; 
alter table employee modify mobile varchar(20);                  -- to modify the datatype of column mobile from 20 to 15 
alter table employee change mobile phone varchar(15);           -- to change the colm name mobile to phone
alter table employee drop phone;           ---- to drop a column 
rename table employee to emp;               -- rename the table name from employee to emp
rename table emp to employee; 
 ALTER table employee add(mobile varchar(15)); 
update employee set mobile = '657544456';
update employee set mobile = '6576545677' where emp_id = 101; --
 desc employee;
 sElect * from employee;
select emp_id as employee_id from employee;
select emp_id as 'employee id' from employee;

 delete from employee where emp_id = 113;
 
-- calculate annual salary of employee
select salary*12 as annual_salary from employee;
 -- Display ename, annual salary of employees
 select first_name, salary*12 as annual_salary from employee;
 -- Display sal and add 100 rs more in salary 
 Select salary, (salary+100) as incr_salary 
 from employee
 -- Display ename and hire_date of employee and calculate 15 days sal 
 select first_name, hire_date, (salary/2) as days_sal
 from employee
 -- display salary of employee and deduct 100rs from salary 
Select salary, salary-100 as ded_sal 
from employee

-- Where 
Select * from employee
where emp_id = 101;
Select * from employee where salary >50000;

Select  * from Employee where emp_id in (101,105,115);
Select * from Employee where emp_id not in (102,104,105);
Select * from Employee where mobile is null;
Select * from Employee where mobile is not null;
-- like '%' 0,1, or more than 1 value 
Select * from Employee where last_name like 's%';
-- like '_e%' _ used for 1 character only 
Select * from Employee where first_name like '_i%';
-- Display last name and salary of all employees earning more than 15000
Select last_name, salary from Employee 
where salary >15000;

-- Display last name and salary of all employees earning between 15000 and 25000
Select last_name, salary from Employee 
where salary between 15000 and 25000;

-- Display last name, job_id and hire date who has joined in 2021
Select emp_id, last_name, hire_date from Employee 
where hire_date between '2021-01-01' and '2021-12-31';  

Select emp_id, last_name, hire_date from Employee 
where year(hire_date) = 2021;

Select  last_name from Employee
Where last_name like('s%');

Select first_name from employee 
where last_name like ('%a%' And '%h%');

-- ORDER BY
Select * from Employee 
order by salary; 

Select * from Employee 
order by salary desc;

Select * from employee 
where salary >15000 and department = 'IT';

Select upper(first_name) as f_name from Employee;
Select lower(last_name) as l_name from Employee;
Select concate(first_name,'  ',last_name) from Employee;

select * from Employee 
where salary > 50000 or city = 'Kolkata';

Select length('first_name') from Employee;
Select substring(first_name,1,3) from Employee;

Select replace(first_name,'a','i') from Employee

Select round(15.876) 
Select mod(12,3)

Select department, sum(salary) from Employee
group by department;

Select count(distinct(city)) form Employee;

Select Avg(salary) from Employee; 
Select max(salary) from Employee; 
Select min(salary) from Employee;

Select Count(*) as no_of_employee from Employee;

-- count no of employee from it department
Select Count(*) as no_of_employee_it from Employee
Where department = 'IT';

-- count total not null row in city column
Select count(city) from Employee;

-- count unique department  
Select count(Distinct department) from Employee;
-- Select only 2 row from above 
Select * from Employee
limit 2 ;

-- show the 3 row leaving 2 row from above 
Select * from Employee 
limit 2,3;

-- Select top 3 salary of employee 
Select * from Employee 
order by salary desc 
limit 3;

-- Find total employee in each department 
Select department, count(*) as total_Employees 
from Employee 
Group by department; 

-- Find total salary by each department
Select department, sum(salary) as total_Employees 
from Employee 
Group by department; 

Select * from Employee
order by first_name asc, salary desc;

-- sort the salary in desc departmentwise 
Select department, avg(salary) as avg_sal 
From Employee 
group by department 
order by avg_sal desc;

-- filter the salry of department > 60000
Select department, avg(salary) as avg_sal 
From Employee 
group by department 
Having salary>60000
order by avg_sal desc;

-- display the department having more than 2 employee
Select department, count(*) as no_of_employee from Employee
group by department 
having no_of_employee > 2 ;

-- department with highest avg salary 
select department, avg(salary) as avg_salary
from Employee 
group by department 
order by avg_salary desc 
limit 1 ;