#create database for assignment3
create database ass3;
use ass3;
#create table dept_tbl
create table dept_tbl(id_deptname varchar(50), emp_name varchar(30), salary int);
#inserting records to dept_tbl
insert into dept_tbl values('1111-MATH', 'RAHUL', 10000),
('1111-MATH', 'RAKESH', 20000),
('2222-SCIENCE', 'AKASH', 10000),
('222-SCIENCE', 'ANDREW', 10000),
('22-CHEM', 'ANKIT', 25000),
('3333-CHEM', 'SONIKA', 12000),
('4444-BIO', 'HITESH', 2300),
('44-BIO', 'AKSHAY', 10000);
select * from dept_tbl;
#Find the total salary of each department
select substring_index(id_deptname,'-',-1) as dept_name,sum(salary) as total_salary from dept_tbl group by substring_index(id_deptname,'-',-1);

