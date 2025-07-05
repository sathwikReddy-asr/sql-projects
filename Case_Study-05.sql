--Platform used:Mode.com
--Tables used:tutorial.excel_sql_inventory_data       and            tutorial.excel_sql_transaction_data
--Date:05-07-2025

--Q1: Write a query to join the above tables. Use left join ?
select *                                                                                         --selecting every thing from the tables
from tutorial.excel_sql_inventory_data as a                                                      --
left join tutorial.excel_sql_transaction_data as b
on a.product_id=b.product_id;

--Q2: Find the product which does not sell a single unit ?
select a.*
from tutorial.excel_sql_inventory_data as a
left join tutorial.excel_sql_transaction_data as b
on a.product_id=b.product_id 
where b.product_id is null;

--Q3: Write a query to find how many units are sold per product. Sort the data in terms of unit sold(descending order) ?
select a.product_name,b.product_id, count(*) as units_sold
from tutorial.excel_sql_inventory_data as a
left join tutorial.excel_sql_transaction_data as b
on a.product_id=b.product_id 
group by 1,2
order by units_sold desc;

--Q4: Write a query to return product_type and units_sold where product_type is sold more than 50 times ?
select a.product_type,count(b.product_id) as units_sold
from tutorial.excel_sql_inventory_data as a
left join tutorial.excel_sql_transaction_data as b
on a.product_id=b.product_id 
group by 1
having count(b.product_id)>50;

--Q5: Write a query to return the total revenue generated ?
select a.product_name,a.product_id,a.price_unit,count(b.transaction_id) as units_sold,a.price_unit*count(b.transaction_id) as revenue
from tutorial.excel_sql_inventory_data as a
left join tutorial.excel_sql_transaction_data as b
on a.product_id=b.product_id
where a.price_unit is not null
group by 1,2,3
order by revenue desc;

--Q6: Write a query to return the most selling product under product_type = ‘dry goods’ ?
select a.product_type,a.product_name,count(*) as total_count
from tutorial.excel_sql_inventory_data as a
left join tutorial.excel_sql_transaction_data as b
on a.product_id=b.product_id 
where a.product_type='dry_goods'
group by 1,2
order by total_count
limit 1;

--Q7: Write a query to find the difference between inventory and total sales per product_type ?
select a.product_type,sum(a.current_inventory) as total_inventory,a.price_unit*count(b.transaction_id) as total_sales,sum(a.current_inventory)-count(b.transaction_id) as difference
from tutorial.excel_sql_inventory_data as a
left join tutorial.excel_sql_transaction_data as b
on a.product_id=b.product_id 
group by 1,a.price_unit;

--Q8: Find the product-wise sales for product_type =’dairy’ ?
select a.product_name,a.product_id,a.price_unit*count(b.transaction_id) as total_sales
from tutorial.excel_sql_inventory_data as a
left join tutorial.excel_sql_transaction_data as b
on a.product_id=b.product_id 
where a.product_type='dairy'
group by 1,2,a.price_unit
order by total_sales desc;
