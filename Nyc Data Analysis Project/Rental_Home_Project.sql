SELECT * FROM project_2.sql_project;

#1. write query to show name from NYC_1
select name from sql_project;

#2. write query to show count of id in nyc_1
select count(id) from sql_project;

#3. write query to show count of id in nyc_2
select count(id) from nyc_2;

#4. write query to show host id in nyc_1
select host_id from sql_project;

#5. write query to show all unique host id from nyc_1
select distinct host_id from sql_project;

#6. write query to show all unique neighbourhood_group from nyc_1
select distinct neighbourhood_group from sql_project;

#7. write query to show all unique neighbourhood from nyc_1
select distinct neighbourhood from sql_project;

#8. write query to show room_type from nyc_1
select room_type from sql_project;

#9. write query to show all values of Brooklyn & Manhattan from nyc_1
select neighbourhood_group from sql_project
where neighbourhood_group in ("manhattan","brooklyn");

#10. write query to show unique value of room type from nyc_1
select distinct room_type from sql_project;

#11. write query to show maximum price from nyc_2
select max(price) max_price from nyc_2;

#12.write query to show minimum price from nyc_2
select min(price) min_price from nyc_2;

#13. write query to show average price from nyc_2
select avg(price) avg_price from nyc_2;

#14.write query to show minimum value of minimum_nights from nyc_2
select min(minimum_nights) minimum_nights from nyc_2;
#15.write query to show maximum value of minimum_nights from nyc_2
select max(minimum_nights) maximum_nights from nyc_2;

#16. write query to show average availability_365
select avg(availability_365) from nyc_2;

#17.write query to show id , availability_365 and all availability_365 value is greater than 300
select id,availability_365 from nyc_2
where availability_365 > 300 ;

#18. write query to show count of id where price is in between 300 to 400
select count(id)  from nyc_2
where price between 300 and 400;

#19. write query to show count of id where minimum_nights spend is less than 5
select count(id) from nyc_2
where minimum_nights <5;

#20.write query to show count where minimum_nights spend is greater than 100
select count(id) from nyc_2
where minimum_nights >100;

#21. write query to show all data of nyc_1 & nyc_2
select * from nyc_2
full join sql_project
using (id);

#22. write query to show host name and price
select sp.host_name,n_2.price from sql_project sp
join nyc_2 n_2
using(id);

#23. write query to show room_type and price
select sp.room_type,n_2.price from sql_project sp
join nyc_2 n_2
using(id);

#24. write query to show neighbourhood_group&minimum_nights spend
select sp.neighbourhood_group,n_2.minimum_nights from sql_project sp
join nyc_2 n_2
using(id);

#25. write query to show neighbourhood & availability_365
select sp.neighbourhood,n_2.availability_365 from sql_project sp
join nyc_2 n_2
using(id);

#26.write query to show total price by neighbourhood_group
select neighbourhood_group, count(price) total_price from nyc_2
join sql_project
using(id)
group by neighbourhood_group;

#27.write query to show maximum price by neighbourhood_group
select neighbourhood_group, max(price) max_price from nyc_2
join sql_project
using(id)
group by neighbourhood_group;

#28.write query to show maximum night spend by neighbourhood_group
select neighbourhood_group,max(minimum_nights) max_night_spend from nyc_2
join sql_project
using(id)
group by neighbourhood_group;

#29.write query to show maximum reviews_per_month spend by neighbourhood
select neighbourhood,max(number_of_reviews) maximum_reviews_per_month from nyc_2
join sql_project
using(id)
group by neighbourhood;

#30.write query to show maximum price by room type
select room_type, max(price) max_price from nyc_2
join sql_project
using(id)
group by room_type;

#31.write query to show average number_of_reviews by room_type
select room_type, avg(number_of_reviews) average_number_of_reviews from nyc_2
join sql_project
using(id)
group by room_type;

#32.write query to show average price by room type
select room_type, avg(price) average_price from nyc_2
join sql_project
using(id)
group by room_type;

#33.write query to show average night spend by room type
select room_type, avg(minimum_nights) avg_night_spend from nyc_2
join sql_project
using(id)
group by room_type;

#34.write query to show average price by room type but average price is less than 100
select room_type, avg(price) avg_price from nyc_2
join sql_project
using(id)
group by room_type
having avg_price < 100;

#35.write query to show average night by neighbourhood and average_nights is greater than 5
select neighbourhood, avg(minimum_nights) avg_nights from nyc_2
join sql_project
using(id)
group by neighbourhood
having avg_nights > 5;

#36. write query to show all data from nyc_1 and price is greater than 200 using sub-query
select * from sql_project
where id in (select id from nyc_2 where price > 200);

#37. write query to show all values from nyc_2 table and host id is 314941
select * from nyc_2
where id in (select id from sql_project where host_id = 314941);

#38. Find all pairs of id having the same host id, each pair coming once only.

#39.write sql query to show fetch all records that have the term cozy in name
select name from sql_project 
where name like "%cozy%";

#40. write query to show price host id neighbourhood_group of manhattan neighbourhood_group
select price,id,neighbourhood_group,neighbourhood_group from sql_project
join nyc_2
using (id)
where neighbourhood_group = "manhattan";

#41.write query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood 
#also price is greater than 100
select id,host_name,neighbourhood,price from sql_project
join nyc_2
using(id)
where neighbourhood in ("upper west side","williamsburg") and price > 100;

#42.write query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant
select id,host_name,neighbourhood,price from sql_project
join nyc_2
using(id)
where host_name = "elise" and neighbourhood = "'Bedford-Stuyvesant";

/*43. write query to show 
host_name,availability_365,minimum_nights only for 100+ 
availability_365 and minimum_nights*/
SELECT host_name, availability_365, minimum_nights
FROM sql_project
join nyc_2
using (id)
WHERE availability_365 >= 100 AND minimum_nights >= 100;


/*44. write query to show to fetch id ,host_name , number_of_reviews, 
and reviews_per_month but show only that records where 
number of reviews are 500+ and review per month is 5+*/
select id,host_name,number_of_reviews,reviews_per_month from nyc_2
join sql_project
using (id)
where number_of_reviews > 500 and reviews_per_month >5;

#45. write query to show neighbourhood_group which have most total number of review
select neighbourhood_group,sum(number_of_reviews) total from sql_project
join nyc_2
using (id)
group by neighbourhood_group
order by total desc limit 1;

#46. write query to show host name which have most cheaper total price
select host_name,sum(price) cheap_price  from sql_project
join nyc_2
using (id)
group by host_name
order by cheap_price limit 1;

#47. write query to show host name which have most costly total price
select host_name,sum(price) total_price from sql_project
join nyc_2
using (id)
group by host_name
order by total_price desc limit 1;

#48. write query to show host name which have max price using subquery
select host_name,price from sql_project
join nyc_2
using (id)
where price = (select max(price) from nyc_2);

#49. write query to show neighbourhood_group which price are less than 100
select neighbourhood_group,price from sql_project
join nyc_2
using (id)
where price < 100;

#50. write query to find max price, average availability_365 for each 
#room type and order in ascending by maximum price
select room_type, max(price) max_price,avg(availability_365) avg_availability_365 from nyc_2
join sql_project
using (id)	
group by room_type 
order by max_price;