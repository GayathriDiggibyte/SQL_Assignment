#create database for assignment4
create database ass4;
use ass4;
#create table email_signup
create table email_signup(id int primary key, email_id varchar(30), signup_date date);
#inserting records to email_signup
insert into email_signup values(1, 'Rajesh@Gmail.com', '2022-02-01'),
(2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'),
(3, 'Hitest@Gmail.com', '2020-09-08'),
(4, 'Salil@Gmmail.com', '2019-07-05'),
(5, 'Himanshu@Yahoo.com', '2023-05-09'),
(6, 'Hitesh@Twitter.com', '2015-01-01'),
(7, 'Rakesh@facebook.com', null);

select * from email_signup;
#Write a query to find gmail accounts with latest and first signup date and difference between both the dates 
SELECT 
    COUNT(CASE WHEN email_id LIKE '%@gmail.com' THEN 1 END) AS count_gmail_account,
    MAX(signup_date) AS latest_signup_date,
    MIN(signup_date) AS first_signup_date,
    DATEDIFF(MAX(signup_date), MIN(signup_date)) AS diff_in_days
FROM 
    email_signup
WHERE 
    email_id LIKE '%@gmail.com';
    
#write the query to replace null value with ‘1970-01-01’
update email_signup set signup_date='1970-01-01' where signup_date is null;
select * from email_signup;