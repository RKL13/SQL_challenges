/*

https://platform.stratascratch.com/coding/9608-exclusive-amazon-products

Exclusive Amazon Products

Amazon ID 9608

Find products which are exclusive to only Amazon and therefore not sold at Top Shop and Macy's. 
Your output should include the product name, brand name, price, and rating.

Two products are considered equal if they have the same product name and same maximum retail price (mrp column).



Tables: innerwear_macys_com, innerwear_topshop_com, innerwear_amazon_com

innerwear_macys_com

product_name:varcha
rmrp:varcharprice:varchar
pdp_url:varchar
brand_name:varchar
product_category:varchar
retailer:varchar
description:varchar
rating:float
review_count:float
style_attributes:varchar
total_sizes:varchar
available_size:varchar
color:varchar

innerwear_topshop_com

product_name:varchar
mrp:varchar
price:varchar
pdp_url:varchar
brand_name:varchar
product_category:varchar
retailer:varchar
description:varchar
rating:float
review_count:float
style_attributes:datetime
total_sizes:varchar
available_size:varchar
color:varchar

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

WITH macy_product_mrp 
AS (SELECT product_name, 
           mrp 
    FROM innerwear_macys_com),
innerwear_topshop_com 
AS (SELECT product_name, 
           mrp 
    FROM innerwear_topshop_com)

SELECT a.product_name, 
       a.brand_name,
       a.price,
       a.rating
FROM innerwear_amazon_com a
FULL OUTER JOIN macy_product_mrp m
ON a.product_name = m.product_name
AND a.mrp = m.mrp
FULL OUTER JOIN innerwear_topshop_com t
ON a.product_name = t.product_name
AND a.mrp = t.mrp
WHERE m.product_name IS NULL
and t.product_name IS NULL