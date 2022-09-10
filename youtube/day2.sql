-- * first name from employee table which starts with k 
select * from employee where first_name like 's%';

-- * ends with p 
select * from employee where first_name like '%p';

-- * s in the name 
select * from employee where first_name like '%s%';

-- * salary between 700000 to 1000000
select * from employee where salary between 700000 and 1000000;

-- * names of employee whose salary greater than 700000 
select concat(first_name, (' ' || last_name)) as employee_name, salary from employee 
where emp_id in (
    select emp_id from employee where salary > 700000
);

-- * joined on a specific date 
select * from employee where joining_date = date '15-12-11';

-- * joined in a year 
select * from employee where year(joining_date) = 2014 and month(joining_date) = 12;

--* number of employee in each dept 
select department, count(*) from employee group by department;

-- * salary details of employee who are also manager
select employee.first_name, employee.last_name, employee.salary, employee_designation.designation  from employee 
inner join employee_designation 
on employee.emp_id = employee_designation.emp_ref_id
where employee_designation.designation = 'manager';

-- * clone a new table from another table 
create table clone_employee like employee;

-- *top n salary

select * from employee order by salary desc limit 4;

-- * 4th highest salary
select salary from employee order by desc limit 3, 1; --n-1, 1

-- * 4th highest salary without limit 