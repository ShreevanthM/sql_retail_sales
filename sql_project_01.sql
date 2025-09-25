select * from retail_sales
create database sql_project_p2;

create table retail_sales(
 transactions_id int PRIMARY KEY,	
sale_date DATE,	
sale_time	TIME,
customer_id  INT,
gender	VARCHAR(25),
age INT,
category VARCHAR(24),	
quantiy	INT,price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT
);

delete from retail_sales



where transactions_id is null or 
sale_date  is null or 
sale_time is null or 
customer_id  is null or 
gender   is null or 

category  is null or 
quantiy  is null or 
price_per_unit  is null or 
cogs  is null or 
total_sale  is null ;
1
select * from retail_sales where category='Clothing' and quantiy>=4 and to_char(sale_date,'yyyy-mm')='2022-11'
2
 select * from retail_sales 
where category='Clothing' and
quantiy>=4 and 
extract (year  from sale_date)='2022' and 
extract (month from sale_date )='11'

3 
select category ,sum(total_sale) as total from retail_sales
group by category
4
select avg(age)as avg_age from retail_sales
where category ='Beauty'
5
select * from retail_sales 
where total_sale>1000
6
select category , gender , count(*) as  ti_ni from retail_sales 
group by 1,2 
order by 1
7
select * from (
select extract(YEAR from sale_date) as year  ,
extract(month from sale_date) as mount,
avg(total_sale) as avg_sale,
RANK()OVER(PARTITION BY extract(YEAR from sale_date) ORDER BY AVG(total_sale) desc) as rank
from retail_sales
group by 1 ,2) as t1 
where rank=1
--order by 1,3 desc

8
select customer_id,sum(total_sale) as total from retail_sales 
group by 1
order by total desc
limit 5
9
select category , count(distinct customer_id) as counte 
from retail_sales 
group by 1

10
with  new_table as(
select *, 
case 
when extract (hour from sale_time ) <12 then'moring' 
when extract (hour from sale_time ) between 12 and 17 then 'afternoon' 
else 'evening'
end shift
from retail_sales)
select shift, count (*) as no_order from new_table 
group by 1 

order by 1

