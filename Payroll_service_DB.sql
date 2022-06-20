--Creating Database PayrollService
create database Payroll_Service_DB;
--user Database
use Payroll_Service_DB;

--Create table
CREATE TABLE employee_payroll 
(
   id int identity primary key,
   name varchar(Max) Not null,
   salary money default 1000,
   startDate DateTime default GetDate()
);

select * from employee_payroll;

--insert tnto database
INSERT INTO employee_payroll (name,salary,startDate) VALUES
('Suraj', 100000.00, '2022-04-10'),
('Sanket', 200000.00, '2021-03-11'),
('Akshay', 300000.00, '2020-10-15');
select * from employee_payroll;


