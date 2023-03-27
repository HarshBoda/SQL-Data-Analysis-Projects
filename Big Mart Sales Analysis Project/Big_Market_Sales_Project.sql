SELECT * FROM sql_project;

#1. WRITE a sql query to show all Item_Identifier
select item_identifier from sql_project;

#2. WRITE a sql query to show count of total Item_Identifier
select count(item_identifier) total_identifier from sql_project;

#3. WRITE a sql query to show maximum Item Weight
select max(item_weight) from sql_project;

#4. WRITE a query to show minimun Item Weight
select min(item_weight) from sql_project;

#5. WRITE a query to show average Item_Weight
select avg(item_weight) avg_weight from sql_project;

#6. WRITE a query to show count OF Item_Fat_Content WHERE Item_Fat_Content IS Low Fat
select count(item_fat_content) from sql_project
where Item_Fat_Content = "low fat";

#7. WRITE a query to show count OF Item_Fat_Content WHERE Item_Fat_Content IS Regular
select count(item_fat_content) from sql_project
where Item_Fat_Content = "regular";

#8. WRITE a query TO show maximum Item_MRP
select max(item_mrp) max_item_mrp from sql_project;

#9. WRITE a query TO show minimum Item_MRP 
select min(item_mrp) max_item_mrp from sql_project;

#10.WRITE a query to show Item_Identifier , Item_Fat_Content ,Item_Type,Item_MRP and Item_MRP IS greater than 200
select Item_Identifier, Item_Fat_Content ,Item_Type,Item_MRP from sql_project
where Item_MRP>200;

#11.WRITE a query to show maximum Item_MRP WHERE Item_Fat_Content IS Low Fat
select max(item_mrp) from sql_project
where Item_Fat_Content = "low fat";

#12.WRITE a query to show minimum Item_MRp AND Item_Fat_Content IS Low Fat
select min(item_mrp) from sql_project
where Item_Fat_Content = "low fat";

#13.WRITE a query to show ALL DATA WHERE item MRP IS BETWEEN 50 TO 100
select * from sql_project
where Item_MRP between 50 and 100;

#14.WRITE a query to show ALL UNIQUE value Item_Fat_Content
select distinct item_fat_content from sql_project;

#15.WRITE a query to show ALL UNIQUE value Item_Type
select distinct item_type from sql_project;

#16.WRITE a query to show ALL DATA IN descending ORDER BY Item MRP
select * from sql_project
order by Item_MRP desc;

#17.WRITE a query to show ALL DATA IN ascending ORDER BY Item_Outlet_Sales
select * from sql_project 
order by Item_Outlet_Sales;

#18.WRITE a query to show ALL DATA IN ascending BY Item_Type
select * from sql_project
order by Item_Type;

#19.WRITE a query to show DATA OF item_type dairy & Meat
select * from sql_project
where Item_Type in ("dairy","meat");

#20.WRITE a query to show ALL UNIQUE value OF Outlet_Size
select distinct outlet_size from sql_project;

#21.WRITE a query to show ALL UNIQUE value OF Outlet_Location_Type
select distinct outlet_location_type from sql_project;

#22.WRITE a query to show ALL UNIQUE value OF Outlet_Type
select distinct outlet_type from sql_project;

#23.WRITE a query to show count NO. OF item BY Item_Type AND ordered it IN descending
select Item_Type,count(item_type) as no_of_item from sql_project
group by Item_Type
order by no_of_item desc;

#24.WRITE a query to show count NO. OF item BY Outlet_Size AND ordered it IN ascending
SELECT Outlet_Size, COUNT(Item_identifier) AS Item_Count
FROM sql_project
GROUP BY Outlet_Size
ORDER BY Item_Count ASC;


#26.WRITE a query to show count NO. OF item BY Outlet_Type AND ordered it IN descending
select Outlet_Type,count(outlet_type) as no_of_item from sql_project
group by Outlet_Type
order by Outlet_Type desc;

#27.WRITE a query to show count of item BY Outlet_Location_Type AND ordered it IN descending
select count(outlet_location_type) from sql_project
order by outlet_location_type desc;

#28.WRITE a query to show maximum MRP BY Item_Type
select Item_Type,max(item_mrp) as max_mrp from sql_project
group by Item_Type
order by Item_Type;

#29.WRITE a query to show minimum MRP BY Item_Type
select Item_Type,min(item_mrp) as minimum_item_mrp from sql_project
group by Item_Type
order by minimum_item_mrp;

#30.WRITE a query to show minimum MRP BY Outlet_Establishment_Year AND ordered it IN descending
SELECT Outlet_Establishment_Year, MIN(item_MRP) AS Minimum_MRP
FROM sql_project
GROUP BY Outlet_Establishment_Year
ORDER BY Minimum_MRP DESC;

#31.WRITE a query to show maximum MRP BY Outlet_Establishment_Year AND ordered IN descending
select Outlet_Establishment_Year,max(item_mrp) maximum_mrp
from sql_project
group by Outlet_Establishment_Year
order by maximum_mrp desc;

#32.WRITE a query to show average MRP BY Outlet_Size AND ordered IN descending
select Outlet_Size,avg(item_mrp) as avg_price from sql_project
group by Outlet_Size
order by avg_price desc;

#33.WRITE a query to show average MRP BY Outlet_Size
select Outlet_Size,avg(item_mrp) as avg_mrp from sql_project
group by Outlet_Size;

#34.WRITE a query to show Average MRP BY Outlet_Type AND ordered IN ascending
select outlet_type,avg(item_mrp) as avg_item_price from sql_project
group by Outlet_Type
order by avg_item_price;

#35.WRITE a query to show maximum MRP BY Outlet_Type
select Outlet_Type,max(item_mrp) as max_price from sql_project
group by Outlet_Type;

#36.WRITE a query to show maximum Item_Weight BY Item_Type 
select Item_Type,max(item_weight) max_item_weight from sql_project
group by item_type
order by max_item_weight;

#37.WRITE a query to show maximum Item_Weight BY Outlet_Establishment_Year 
select Outlet_Establishment_Year,max(item_weight) as max_item_weight from sql_project
group by Outlet_Establishment_Year
order by max_item_weight;

#38.WRITE a query to show minimum Item_Weight BY Outlet_Type 
select Outlet_Type, max(item_weight) max_weight from sql_project
group by Outlet_Type;

#39.WRITE a query to show average Item_Weight BY Outlet_Location_Type ORDER BY descending
select Outlet_Location_Type, avg(item_weight) avg_item_weight from sql_project
group by Outlet_Location_Type
order by avg_item_weight desc;

#40.WRITE a query to show maximum Item_Outlet_Sales BY Item_Type
select Item_Type, max(Item_Outlet_Sales) max_sales from sql_project
group by Item_Type
order by max_sales;

#40.WRITE a query to show maximum Item_Outlet_Sales BY Item_Type
select Item_Type, max(Item_Outlet_Sales) max_sales from sql_project
group by Item_Type
order by max_sales;
 
#41.WRITE a query to show minimum Item_Outlet_Sales BY Item_Type
select Item_Type, min(Item_Outlet_Sales) min_sales from sql_project
group by Item_Type
order by min_sales;

#42.WRITE a query to show minimum Item_Outlet_Sales BY Outlet_Establishment_Year
select Outlet_Establishment_Year, min(Item_Outlet_Sales) min_item_outlet_sales from sql_project
group by Outlet_Establishment_Year
order by min_item_outlet_sales;

#43.WRITE a query to show maximum Item_Outlet_Sales BY Outlet_Establishment_Year ordered BY descending
select Outlet_Establishment_Year, max(Item_Outlet_Sales) min_item_outlet_sales from sql_project
group by Outlet_Establishment_Year
order by min_item_outlet_sales desc;

#44.WRITE a query to show average Item_Outlet_Sales BY Outlet_Size AND ORDER it itn descending
select Outlet_size, avg(Item_Outlet_Sales) avg_item_outlet_sales from sql_project
group by Outlet_size
order by avg_item_outlet_sales desc;

#45.WRITE a query to show average Item_Outlet_Sales BY Outlet_Size 
select Outlet_size, avg(Item_Outlet_Sales) avg_item_outlet_sales from sql_project
group by Outlet_size;

#46.WRITE a query to show average Item_Outlet_Sales BY Outlet_Type
select Outlet_type, avg(Item_Outlet_Sales) avg_item_outlet_sales from sql_project
group by Outlet_type;

#47.WRITE a query to show maximum Item_Outlet_Sales BY Outlet_Type
select Outlet_type, max(Item_Outlet_Sales) max_item_outlet_sales from sql_project
group by Outlet_type;

#49.WRITE a query to show total Item_Outlet_Sales BY Item_Type
select item_type,count(Item_Outlet_Sales) from sql_project
group by item_type;

#51.WRITE a query to show total Item_Outlet_Sales BY Item_Fat_Content
select Item_Fat_Content,count(Item_Outlet_Sales) from sql_project
group by Item_Fat_Content;

#52.WRITE a query to show maximum Item_Visibility BY Item_Type
select item_type,max(Item_Visibility) max_Item_Visibility from sql_project
group by item_type;

#53.WRITE a query to show Minimum Item_Visibility BY Item_Type 
select item_type,min(Item_Visibility) min_Item_Visibility from sql_project
group by item_type;

#54.WRITE a query to show total Item_Outlet_Sales BY Item_Type but ONLY WHERE Outlet_Location_Type IS Tier 1
select Item_Type,count(Item_Outlet_Sales),Outlet_Location_Type from sql_project
group by Item_Type,Outlet_Location_Type
having Outlet_Location_Type = "tier 1";

#55.WRITE a query to show total Item_Outlet_Sales BY Item_Type WHERE Item_Fat_Content IS ONLY Low Fat & L
select item_type,count(Item_Outlet_Sales) as total_Outlet_Sales,Item_Fat_Content from sql_project
group by Item_Type,Item_Fat_Content
having Item_Fat_Content = "low fat";





