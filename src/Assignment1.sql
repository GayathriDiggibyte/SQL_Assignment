#1.Create Database as ecommerce
create database ecommerce;
use ecommerce;

#2.Create 4 tables (gold_member_users, users, sales, product) under the above database(ecommerce)
create table users(userid varchar(10) primary key, signup_date DATE not null);
create table product(product_id int primary key, product_name varchar(50), price int);
create table sales(userid varchar(10),created_date DATE not null, product_id int,foreign key(userid) references users(userid), foreign key(product_id) references product(product_id));
create table gold_member_users(userid varchar(10) primary key,signup_date DATE not null);

#3.Insert the values provided above with respective datatypes
#Users table
insert into users values('John','2014-09-02'), ('Michel','2015-01-15'), ('Mary','2014-04-11');
select * from users;

#Products table
insert into product values(1,'Mobile',980), (2,'Ipad',870), (3,'Laptop',330);
select * from products;
#Sales table
insert into sales values('John','2017-04-19',2), ('Mary','2019-12-18',1), ('Michel','2020-07-20',3), ('John','2019-10-23',2), ('John','2018-03-19',3), ('Mary','2016-12-20',2), ('John','2016-09-11',1), ('John','2016-05-20',3), ('Michel','2017-09-24',1), ('John','2017-03-11',2), ('John','2016-03-11',1), ('Mary','2016-10-11',1),  ('Mary','2017-07-12',2), (14,'Mary','2019-12-18',2),                         (15,'John','2017-04-19',3), (16,'Michel','2017-09-24',2);
select * from sales;
#gold_member_users table
insert into gold_member_users values('John','2014-09-22'), ('Mary','2017-04-21');
select * from gold_member_users;

#4.Show all the tables in the same database(ecommerce)
show tables;

#5.Count all the records of all four tables using single query
select 'gold_member_users_record' as table_name, count(*) from gold_member_users union all
select 'users_record count' as table_name, count(*) from users union all
select 'sales_record count' as table_name, count(*) from sales union all
select 'product_record count' as table_name, count(*) from product;
select * from sales;
#6.What is the total amount each customer spent on ecommerce company
select s.userid, sum(p.price) as 'Total amount in dollars' from product p join sales s on p.product_id = s.product_id group by(s.userid);

#7.Find the distinct dates of each customer visited the website: output should have 2 columns date and customer name
select distinct created_date, userid from sales order by userid, created_date;

#8.Find the first product purchased by each customer using 3 tables(users, sales, product)
select min(created_date) as first_purchased_date,sales.userid,product_name
from product join sales on sales.product_id = product.product_id join users
on sales.userid=users.userid group by sales.userid,product_name;

#9.What is the most purchased item of each customer and how many times the customer has purchased it: output should have 2 columns count of the items as item_count and customer name
select max(count_product),userid from (select userid, count(distinct product_id) as 'count_product' from sales group by userid)
as user_product_counts group by userid;

#10.Find out the customer who is not the gold_member_user
select userid from users where userid not in (select userid from gold_member_users);

#11.What is the amount spent by each customer when he was the gold_member user
select g.userid as 'Gold Member',sum(p.price) as 'total amount spent' from gold_member_users g join sales s join product p on g.userid=s.userid and s.product_id=p.product_id group by s.userid;

#12.Find the Customers names whose name starts with M
select userid from users where userid like "M%";

#13.Find the Distinct customer Id of each customer
select distinct userid from sales;

#14.Change the Column name from product table as price_value from price
alter table product change column price price_value int;
select * from product;

#15.Change the Column value product_name – Ipad to Iphone from product table
update product set product_name="Iphone" where product_name="Ipad";

#16.Change the table name of gold_member_users to gold_membership_users
rename table gold_member_users to gold_membership_users;
show tables;

#17.Create a new column as Status in the table crate above gold_membership_users the Status values should be 2 Yes and No if the user is gold member, then status should be Yes else No.
alter table users add status varchar(10) default 'No';
update users set status='Yes' where users.userid in(select userid from gold_membership_users);
select * from users;

#18.Delete the users_ids 1,2 from users table and roll the back changes once both the rows are deleted one by one mention the result when performed roll back
start transaction;
delete from users where userid="John";
delete from users where userid="Mary";
select * from users;
rollback;

#19.Insert one more record as same (3,'Laptop',330) as product table
insert into product values(4,"laptop",330);
select * from product;
#20.Write a query to find the duplicates in product table
select product_name, price_value as ‘duplicates’ from product group by product_name having count(*)>1;



