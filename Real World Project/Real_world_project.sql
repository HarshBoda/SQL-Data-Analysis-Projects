use real_world_project;


select * from superstore_final_dataset sfd ;
select count(row_id) from superstore_final_dataset;

#1)What percentage of total orders were shipped on the same date?
SELECT (COUNT(CASE WHEN order_date = ship_date THEN 1 END) / COUNT(*)) * 100 AS percentage
FROM superstore_final_dataset;

#2)Name top 3 customers with highest total value of orders.
select customer_name,sum(sales) as total_value from superstore_final_dataset
group by customer_name
order by total_value desc limit 3;

#3)Find the top 5 items with the highest average sales per day.
select Product_Name,Order_Date, 
avg(sales)over(partition by Order_Date  ) as avg_sales
from superstore_final_dataset
order by  avg_sales desc limit 5;

#4)Write a query to find the average order value for each customer, and rank the customers by their average order value.
select *,
dense_rank()over(order by x.avg_order_value desc ) as customer_rank
from (
      select distinct  customer_name,
      avg(sales)over(partition by Customer_Name) as avg_order_value
      from superstore_final_dataset
      order by avg_order_value desc) x;

#5)Give the name of customers who ordered highest and lowest orders from each city.
select distinct customer_name,city,
first_value (sales)over(partition by city order by sales desc) as highest_order,
first_value(sales)over(partition by city order by Sales) as lowest_order
from superstore_final_dataset;

#6)What is the most demanded sub-category in the west region?

select distinct sub_category,region,
sum(Sales) over(partition by Sub_Category) as total_sale
from superstore_final_dataset
where region = "west"
order by total_sale desc limit 1;


#7)Which order has the highest number of items? And which order has the highest cumulative value?

select distinct order_id,
count(Product_ID)over(partition by Order_ID ) as total_item
from superstore_final_dataset
order by total_item desc limit 1;

#8)Which order has the highest cumulative value?
select distinct order_id,
sum(sales)over(partition by Order_ID) as cumulative_value
from superstore_final_dataset
order by cumulative_value desc limit 1;

#9)Which segment’s order is more likely to be shipped via first class?
SELECT Segment, COUNT(*)
FROM superstore_final_dataset
WHERE Ship_Mode = 'First Class'
GROUP BY Segment
ORDER BY COUNT(*) DESC;


select * from superstore_final_dataset sfd ;

#10)Which city is least contributing to total revenue?

select city,sum(sales) revenue
from superstore_final_dataset
group by City 
order by revenue  limit 1;

#11)What is the average time for orders to get shipped after order is placed?

UPDATE superstore_final_dataset
SET Order_Date = DATE_FORMAT(STR_TO_DATE(Order_Date, '%d-%m-%Y'), '%Y-%m-%d');

UPDATE superstore_final_dataset
SET ship_date = DATE_FORMAT(STR_TO_DATE(ship_date, '%d-%m-%Y'), '%Y-%m-%d');

select avg(shipping_time) avg_delivery_time
from(SELECT distinct Order_ID, abs(DATEDIFF(Order_Date,Ship_Date))  AS Shipping_Time
FROM superstore_final_dataset) a ;















