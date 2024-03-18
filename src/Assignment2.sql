#create database for assignment2
create database ass2;
use ass2;
#create table product_details
create table product_details(sell_date DATE,product varchar(30));
#inserting records to product_details
delete from product_details;
insert into product_details values('2020-05-30', 'Headphones'),
('2020-06-01','Pencil'),
('2020-06-02','Mask'),
('2020-05-30','Basketball'),
('2020-06-01','Book'),
('2020-06-02', 'Mask'),
('2020-05-30','T-Shirt');
#displaying all records from product_details
select * from product_details;
#Write a query to find for each date the number of different products sold and their names. 
select sell_date,count(distinct product) as num_of_products,
group_concat(distinct product) as product_names 
from product_details group by sell_date;

