/*

https://platform.stratascratch.com/coding/2071-customers-with-specific-brands

Customers with Specific Brands

Amazon ID 2071

In the latest promotion, the marketing department wants to target customers who have 
bought products from two specific brands.

Prepare a list of customers who purchased products from both the "Fort West" and the "Golden" brands.

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

WITH preprocessed_table 
AS (SELECT customer_id,
           SUM(CASE WHEN brand_name IN ('Fort West') THEN 1 ELSE 0 END) fort_west,
           SUM(CASE WHEN brand_name IN ('Golden') THEN 1 ELSE 0 END) golden
    FROM facebook_products p
    LEFT JOIN facebook_sales s
    ON p.product_id = s.product_id
    GROUP BY customer_id
    HAVING customer_id IS NOT NULL)
    
SELECT 
    customer_id 
FROM preprocessed_table
WHERE fort_west >= 1
AND golden >= 1