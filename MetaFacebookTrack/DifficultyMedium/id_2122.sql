/*

https://platform.stratascratch.com/coding/2122-products-never-sold

Products Never Sold

Amazon ID 2122

The VP of Sales feels that some product categories don't sell and can be completely removed from the inventory. 
As a first pass analysis, they want you to find what percentage of product categories have never been sold.

Tables: facebook_products, facebook_sales, facebook_product_categories

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

facebook_product_categories

category_id:int
category_name:varchar

*/

WITH preprocessed_table 
AS (SELECT category_name,
           CASE WHEN SUM(units_sold) IS NOT NULL THEN 0 ELSE 1 END AS sales_or_not
    FROM facebook_products p
    LEFT JOIN facebook_sales s
    ON p.product_id = s.product_id
    RIGHT JOIN facebook_product_categories c
    ON p.product_category = c.category_id
    GROUP BY category_name)
    
SELECT 
    SUM(sales_or_not)/COUNT(DISTINCT category_name)::FLOAT*100 percentages_no_sales
FROM preprocessed_table