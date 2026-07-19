                                                             -- SQL analysis
-- ====================================================================================================================================================
create database sales_analysis;
use sales_analysis
Select count(*) AS total_rows from dataset;
                                                        -- Top 10 Profitable Products
select product_name,
sum(profit) AS total_profit from dataset
group by product_name
order by total_profit DESC
limit 10;
													   -- Top 10 Customer by Sales
select customer_name,
SUM(sales) AS total_sales from dataset
group by customer_name
order by total_sales DESC
limit 10;
                                                       -- Region-wise Total Sales
select region,
sum(sales) AS total_sales
from dataset
group by region
order by total_sales DESC
                                                      -- Category-wise Average Profit
select category,
AVG(profit) AS average_profit 
from dataset
group by category;
													 -- Highest Discount Category
select category,
AVG(discount) AS avg_discount
from dataset
group by category
order by avg_discount DESC;

													-- Orders with Negative Profit
select * from dataset
where profit < 0;

													-- Monthly Sales Trend
select 
date_format(str_to_date(order_date,'%d-%m-%Y'), '%Y-%m') AS month,
SUM(sales) AS total_sales
from dataset
group by month
order by month;

                                                  -- Market-wise Revenue Analysis
select market,
SUM(sales) AS revenue
from dataset
group by market
order by revenue DESC;

                                                  -- Top Performing Sub-Categories
select sub_category,
SUM(profit) AS total_profit
from dataset
group by sub_category
order by total_profit DESC
limit 10;

												-- Ship Mode Usage Analysis
select ship_mode,
COUNT(*) AS total_orders
from dataset
group by ship_mode
order by total_orders DESC;


                                                    -- SQL Analysis Insights
-- =======================================================================================================================================
-- 1. APAC generated the highest revenue(450,832), making it the best-performing market.
-- 2. Central region recorded the highest total sales.
-- 3. Office Supplies has the highest average discount, while furniture has the lowest.
-- 4. Standard Class is the most frequently used shipping mode with 5,675 orders.
-- 5.Several orders have negative profit, indicating loss-making transactions.
-- 6. Monthly sales show fluctuations, with some months generating higher sales than others.
-- 7. Office Supplies has the highest average profit among three categories.

													-- END Task
-- ================================================================================================================================