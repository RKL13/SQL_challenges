/*

https://platform.stratascratch.com/coding/9607-the-most-expensive-products-per-category

The Most Expensive Products Per Category

Amazon ID 9607

Find the most expensive products on Amazon for each product category. Output category, product name and the price (as a number)

Table: innerwear_amazon_com

innerwear_amazon_com

product_name:varchar
mrp:varchar
price:varchar
pdp_url:varchar
brand_name:varchar
product_category:varchar
retailer:varchar
description:varchar
rating:float
review_count:int
style_attributes:varchar
total_sizes:varchar
available_size:varchar
color:varchar

*/

WITH table_price_num 
AS (SELECT SUBSTRING(price FROM '[0-9]+.[0-9]+$')::FLOAT AS price_num,
           *
FROM innerwear_amazon_com),
tuple_category_max_price 
AS (SELECT product_category,
           MAX(price_num) AS max_price
    FROM table_price_num
    GROUP BY product_category)
    
SELECT 
    tuple_category_max_price.product_category,
    tuple_category_max_price.max_price,
    table_price_num.product_name
FROM tuple_category_max_price
LEFT JOIN table_price_num
ON tuple_category_max_price.product_category = table_price_num.product_category
AND tuple_category_max_price.max_price = table_price_num.price_num