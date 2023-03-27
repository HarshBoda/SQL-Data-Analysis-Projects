SELECT * FROM faasos_dataset.ingredients;

#1 how many rolls were ordered
select count( roll_id) from customer_orders;

#2 how many unique customer order were made?
select count(distinct customer_id) from customer_orders;

#3 how many successful orders were  delivered by each driver
select driver_id, count(order_id) no_of_successfull_order from driver_order
join driver
using (driver_id)
where duration is not null
group  by driver_id;

#4 how many of each type of roll was delivered?
select roll_id,count(order_id) no_of_rolls from driver_order
join customer_orders
using (order_id)
join rolls
using (roll_id)
where duration is not null
group by roll_id ;

#5 how many veg and non veg rolls were ordered by each customer
select customer_id,roll_id, count(roll_id) cnt,roll_name from customer_orders
join rolls
using (roll_id)
group  by roll_name, customer_id,roll_id;


