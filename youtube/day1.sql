-- *create an tables with the following columns 
-- ?employee table
-- emp_id, first_name, last_name, salary, joining_date, department 

-- ?bouns table 
-- emp_id, bonus_date, bonus_amount 

-- ?employee designation 
-- emp_id, designation, designation_date 

create database company; --company database is created 
use company; -- to use this database 

-- testing ----------
drop table bonus; 
drop table employee_designation; 
drop table employee;
---------------------- 
-- create employee_table 
create table employee(
    emp_id int not null primary key, 
    first_name varchar(25), last_name varchar(25), 
    salary int, 
    joining_date date,
    department varchar(25)
); 

-- check the schema  
desc employee; 

-- create bonus table  
create table bonus(
    emp_ref_id int, 
    bonus int, 
    bonus_date date, 
    foreign key(emp_ref_id) references employee(emp_id) on delete cascade 
); 
-- if we delete one row with a specific id in employee table automatically values will be deleted here also 

-- create designation table 
create table employee_designation(
    emp_ref_id int, 
    designation varchar(25), 
    designation_date date,
    foreign key(emp_ref_id) references employee(emp_id) on delete cascade 
);

-- insert values into employee table 
insert into employee values(001, 'soumyadip', 'ghorai', 500000, date '2015-12-11', 'data scientist'); -- year-month-date  
insert into employee values(002, 'soumyadip1', 'ghorai', 600000, date '15-12-11', 'data analyst');
insert into employee values(003, 'soumyadip2', 'ghorai', 700000, date '16-12-11', 'data scientist');
insert into employee values(004, 'soumyadip3', 'ghorai', 800000, date '17-12-11', 'data analyst');
insert into employee values(005, 'soumyadip4', 'ghorai', 900000, date '18-12-11', 'data scientist');
insert into employee values(006, 'soumyadip5', 'ghorai', 1000000, date '19-12-11', 'data analyst');

select * from employee;

-- insert values into bonus table 
insert into bonus values(001, 5000, date '16-12-12');
insert into bonus values(002, 6000, date '17-12-12');
insert into bonus values(003, 7000, date '18-12-12');
insert into bonus values(004, 8000, date '19-12-12');
insert into bonus values(005, 9000, date '20-12-12');
insert into bonus values(006, 10000, date '21-12-12');

select * from bonus; 
 
-- insert values into designation table 
insert into employee_designation values(001, 'manager', date '16-12-01');
insert into employee_designation values(002, 'lead', date '17-12-01');
insert into employee_designation values(003, 'senior', date '18-12-01');

select * from employee_designation;