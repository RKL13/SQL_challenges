/*

https://platform.stratascratch.com/coding/2070-top-three-classes

Top Three Classes

Amazon ID 2070

The marketing department wants to launch a new promotion for the most successful product classes. 
What are the top 3 product classes by number of sales?

Tables: facebook_products, facebook_sales

facebook_products

product_id:int
product_class:varchar
brand_name:varchar
is_low_fat:varchar
is_recyclable:varchar
product_category:int
product_family:varchar

facebook_sales

product_id:int
promotion_id:int
cost_in_dollars:int
customer_id:int
date:datetime
units_sold:int

*/

WITH ranked_table
AS (SELECT product_class,
           COUNT(*) n_sales,
           RANK() OVER(ORDER BY COUNT(*) DESC) sales_ranked
    FROM facebook_products p
    LEFT JOIN facebook_sales s
    ON p.product_id = s.product_id
    GROUP BY product_class)
    
SELECT 
    product_class,	
    n_sales
FROM ranked_table
WHERE sales_ranked <= 3