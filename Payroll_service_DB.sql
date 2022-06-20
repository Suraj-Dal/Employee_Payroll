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
('Suraj', 20000, '2022-04-10'),
('Sanket', 20000, '2021-03-11'),
('Akshay', 30000, '2020-10-15');

INSERT INTO employee_payroll (name,salary,startDate) VALUES
('Nita', 20000, '2022-01-6'),
('Aditi', 20000, '2021-02-14'),
('Shikha', 30000, '2020-8-15');
--Retrive data from Table
select * from employee_payroll;

-- Ability to retrieve salary data for a particular employee as well as all employees who have
-- joined in a particular data range from the  payroll service database
select * from employee_payroll where name = 'Suraj';   
select * from employee_payroll
where startDate BETWEEN CAST('2021-01-01' as DATE) AND GETDATE();

--UC 6 to add column gender and set gender
Alter Table employee_payroll add Gender varchar(1);

update employee_payroll set gender = 'M' where name = 'Suraj';
update employee_payroll set gender = 'M' where name = 'Sanket';
update employee_payroll set gender = 'M' where name = 'Akshay';
update employee_payroll set gender = 'F' where name = 'Nita';
update employee_payroll set gender = 'F' where name = 'Aditi';
update employee_payroll set gender = 'F' where name = 'Shikha';

--UC 7 to get Sum, Avg, Min, Max and no. of male and Female employee.
SELECT SUM(salary) FROM employee_payroll     
WHERE Gender = 'M' 
GROUP BY Gender;

SELECT SUM(salary) FROM employee_payroll       -- The SUM() function returns the total sum of a numeric column. 
WHERE Gender = 'F' 
GROUP BY Gender;

Select Gender, SUM(salary) From employee_payroll GROUP BY Gender;
Select Gender, AVG(salary) From employee_payroll GROUP BY Gender;
Select Gender, MIN(salary) From employee_payroll GROUP BY Gender;
Select Gender, MAX(salary) From employee_payroll GROUP BY Gender;
Select Gender, COUNT(name) From employee_payroll GROUP BY Gender;

--UC8 Alter table to add phone no., address, department

alter table employee_payroll add phone_number bigint;
alter table employee_payroll add address varchar(200) NOT NULL default'Mumbai';
alter table employee_payroll add department varchar(100) NOT NULL default 'Developer';
select * from employee_payroll;

