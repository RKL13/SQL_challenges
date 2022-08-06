/*

https://platform.stratascratch.com/coding/2068-find-products

Find Products

Amazon ID 2068

Find product ids whose average sales price is at least $3 and that are sold at least 2 times? 
Output product id and their brand.

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

SELECT 
    p.product_id,
    brand_name
FROM facebook_products p
LEFT JOIN facebook_sales s
ON p.product_id = s.product_id
GROUP BY p.product_id, brand_name
HAVING AVG(cost_in_dollars) >= 3
AND COUNT(units_sold) >= 2