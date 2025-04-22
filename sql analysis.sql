select * from wcd

-- count total rows 

select count(*) from wcd

-- calculate profit and other matrix 

select sum(profit) as total_profit, sum(units_sold) as total_unit_sold, sum(gross_sales) as gross_sale from wcd

-- product wise sales and profit

select product, round(sum(gross_sales),2) as gross_sales, round(sum(profit),2) as profit,
round(sum(units_sold)) as unit_sold from wcd
group by product order by gross_sales desc, profit desc

-- country wise sales 

select country, round(sum(gross_sales),2) as gross_sales from wcd 
group by country order by gross_sales desc

-- find rank based on sales

with tp as (select country, round(sum(gross_sales),2) as gross_sales from wcd 
group by country order by gross_sales desc)
select *, rank()over(order by gross_sales desc) as rnk from tp

-- calculate segment wise profit and sales

select segment, round(sum(gross_sales),2) as gross_sales, round(sum(profit),2) as profit
from wcd group by segment order by gross_sales desc, profit desc

-- as you can see Enterprise segment is making loss, lets try to see which product is making 
-- loss and other factor

select product, round(sum(gross_sales),2) as gross_sales, round(sum(profit),2) as profit,
round(sum(units_sold)) as unit_sold from wcd where segment = 'Enterprise'
group by product order by profit desc