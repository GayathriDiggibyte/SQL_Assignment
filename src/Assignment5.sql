#create database for assignment5
create database ass5;
use ass5;
#1)	create a table named sales_data with columns: product_id, sale_date, and  quantity_sold.
create table sales_data(product_id int, sale_date date, quantity_sold int);
#2)	insert some sample data into the table:
insert into sales_data values(1, '2022-01-01', 20),
			     (2, '2022-01-01', 15),
   		             (1, '2022-01-02', 10),
    	        	     (2, '2022-01-02', 25),
    		             (1, '2022-01-03', 30),
    		             (2, '2022-01-03', 18),
			     (1, '2022-01-04', 12),
			     (2, '2022-01-04', 22);

select * from sales_data;
#3)	Assign rank by partition based on product_id and find the latest product_id sold
SELECT
    product_id,
    sale_date,
    quantity_sold,
    RANK() OVER (PARTITION BY product_id ORDER BY quantity_sold) AS rank_within_product,
    MAX(quantity_sold) OVER (PARTITION BY product_id) AS lates_sold_quantity
FROM
    sales_data;

#4)	Retrieve the quantity_sold value from a previous row and compare the quantity_sold.
select *,lag(quantity_sold) over(partition by product_id order by quantity_sold) 
as previous_quantity_sold
from sales_data;

#5)	Partition based on product_id and return the first and last values in ordered set.

select product_id,
first_value(quantity_sold) over(partition by product_id order by sale_date) as FirstValue,
last_value(quantity_sold) over(partition by product_id order by sale_date rows between unbounded preceding and unbounded following) as LastValue
from sales_data;

