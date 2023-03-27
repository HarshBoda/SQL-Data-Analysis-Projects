use superstore_orders;
select * from copy_of_superstore_orders ;

-- 1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)

select * from superstore_orders
where Customer_Name like '_a_d%';

-- 2- write a sql to get all the orders placed in the month of dec 2020 (352 rows) 

select * from copy_of_superstore_orders
where Order_Date between '2020-12-01' and '2020-12-31';

-- 3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 (944 rows)

select * from copy_of_superstore_orders
where Ship_Mode not in ("standard class","first class") and ship_date > '2020-11-30';

-- 4- write a query to get all the orders where customer name neither start with "A" and nor ends with "n" (9815 rows)

select * from copy_of_superstore_orders
where customer_name not like 'A%' and customer_name not like '%n';

-- 5- write a query to get all the orders where profit is negative (1871 rows)

select* from copy_of_superstore_orders coso 
where profit <0;

-- 6- write a query to get all the orders where either quantity is less than 3 or profit is 0 (3348)

select * from copy_of_superstore_orders coso 
where quantity < 3 or profit = 0;

-- 7- your manager handles the sales for South region and he wants you to create a report of all the orders 
-- in his region where some discount is provided to the customers (815 rows)

select * from copy_of_superstore_orders coso 
where region = 'south' and discount > 0;

-- 8- write a query to find top 5 orders with highest sales in furniture category 

select * from copy_of_superstore_orders
where category = 'Furniture' 
order by sales desc limit 5;

-- 9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only (1021 rows)

select * from copy_of_superstore_orders coso 
where category in ('Furniture','Technology'	) and order_date  between '2020-01-01' and '2020-12-31';

-- 10-write a query to find all the orders where order date is in year 2020 but ship date is in 2021 (33 rows)

select * from copy_of_superstore_orders coso
where order_date between '2020-01-01' and '2020-12-31' and ship_date between '2021-01-01' and '2021-12-31';




-- 1- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909
update copy_of_superstore_orders
set city = null 
where order_id  in ("CA-2020-161389" , "US-2021-156909");

-- 2- write a query to find orders where city is null (2 rows)
select * from copy_of_superstore_orders
where city is null;

-- 3- write a query to get total profit, first order date and latest order date for each category
select category ,min(order_id) as first_order_date,max(order_id) as latest_order_date ,sum(profit)
from copy_of_superstore_orders 
group by category ;


-- 4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category
select sub_category ,avg(profit) as avg_profit from copy_of_superstore_orders coso
group by sub_category 
having avg(profit) > (max(profit)/2);


-- 5- create the exams table with below script;
create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

-- write a query to find students who have got same marks in Physics and Chemistry.

select student_id ,marks , count(student_id) from exams e 
where subject in ('physics','chemistry')
group by student_id,marks 
having count(student_id )>1;


select * from copy_of_superstore_orders ;

-- 6- write a query to find total number of products in each category.
select category , count(product_id) as no_of_products from copy_of_superstore_orders coso 
group by category ;

-- 7- write a query to find top 5 sub categories in west region by total quantity sold
select sub_category , sum(quantity) as total
from copy_of_superstore_orders coso 
where region = "west"
group by sub_category 
order by sum(quantity) desc limit 5;


-- 8- write a query to find total sales for each region and ship mode combination for orders in year 2020
select region,ship_mode , sum(sales) as total_sales from copy_of_superstore_orders coso
where order_date between '2020-01-01' and '2020-12-31'
group by region,ship_mode ;



select * from returns;
select * from copy_of_superstore_orders ;


-- 1- write a query to get region wise count of return orders
select region,count(distinct coso.order_id) as no_of_orders from copy_of_superstore_orders coso 
join returns 
using(order_id)
group by region;

-- 2- write a query to get category wise sales of orders that were not returned

select category,sum(sales)as total_sales from copy_of_superstore_orders coso 
left join returns r 
using(order_id)
where r.return_reason is null
group by category;

create table employee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);


insert into employee values(1,'Ankit',100,10000,4,39);
insert into employee values(2,'Mohit',100,15000,5,48);
insert into employee values(3,'Vikas',100,10000,4,37);
insert into employee values(4,'Rohit',100,5000,2,16);
insert into employee values(5,'Mudit',200,12000,6,55);
insert into employee values(6,'Agam',200,12000,2,14);
insert into employee values(7,'Sanjay',200,9000,2,13);
insert into employee values(8,'Ashish',200,5000,2,12);
insert into employee values(9,'Mukesh',300,6000,6,51);
insert into employee values(10,'Rakesh',500,7000,6,50);


create table dept(
    dep_id int,
    dep_name varchar(20)
);
insert into dept values(100,'Analytics');
insert into dept values(200,'IT');
insert into dept values(300,'HR');
insert into dept values(400,'Text Analytics');


-- 3- write a query to print dep name and average salary of employees in that dep .
select dep_name,avg(salary) as avg_salary from employee e 
join dept d
on e.dept_id = d.dep_id
group by dep_name;


-- 4- write a query to print dep names where none of the emplyees have same salary.
select dep_name from employee e 
join dept d
on e.dept_id = d.dep_id
group by dep_name
having count(emp_id) = count(distinct salary);

-- 5- write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)
select * from returns;
select * from copy_of_superstore_orders ;

select o.sub_category
from copy_of_superstore_orders o
join returns r
using(order_id)
group by sub_category
having count(distinct r.return_reason)=3;


-- 6- write a query to find cities where not even a single order was returned.
select city from copy_of_superstore_orders
left join returns 
using(order_id)
group by city
having count(return_reason)=0;

-- 7- write a query to find top 3 subcategories by sales of returned orders in east region
select sub_category,sum(sales) from copy_of_superstore_orders
join returns 
using(order_id)
where region = "east"
group by sub_category
order by sum(sales) desc limit 3;


select * from employee;
select * from dept;


-- 8- write a query to print dep name for which there is no employee
select dep_name,dep_id from employee e
right join dept d
on d.dep_id=e.dept_id
where emp_name is null;

-- 9- write a query to print employees name for dep id is not avaiable in dept table
select emp_name from employee e
left join dept d
on d.dep_id=e.dept_id
where dep_id is null;

select * from employee;
alter table employee 
drop column dob;



















