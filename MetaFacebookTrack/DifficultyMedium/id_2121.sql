/*

https://platform.stratascratch.com/coding/2121-highest-sales-with-promotions

Highest Sales with Promotions

Amazon ID 2121

Which products had the highest sales (in terms of units sold) in each promotion? 
Output promotion id, product id with highest sales and highest sales itself.

Table: facebook_sales

facebook_sales

product_id:int
promotion_id:int
cost_in_dollars:int
customer_id:int
date:datetime
units_sold:int

*/

WITH preprocessed_table
AS (SELECT product_id, 
           promotion_id,
           SUM(units_sold) total_sales
    FROM facebook_sales
    GROUP BY promotion_id, product_id),
max_sales_per_promotion
AS (SELECT promotion_id,
           MAX(total_sales) total_sales
    FROM preprocessed_table 
    GROUP BY promotion_id
    ORDER BY promotion_id)
    
SELECT 
    p.product_id,
    m.promotion_id,
    m.total_sales
FROM max_sales_per_promotion m
LEFT JOIN preprocessed_table p
ON p.promotion_id = m.promotion_id
AND p.total_sales = m.total_sales