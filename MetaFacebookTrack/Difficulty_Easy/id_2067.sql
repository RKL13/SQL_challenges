/*

https://platform.stratascratch.com/coding/2067-low-fat-and-recyclable

Low Fat and Recyclable

Amazon ID 2067

What percentage of all products are both low fat and recyclable?

Table: facebook_products

facebook_products

product_id:int
product_class:varchar
brand_name:varchar
is_low_fat:varchar
is_recyclable:varchar

*/

SELECT
    SUM(CASE 
            WHEN is_low_fat = 'Y' AND is_recyclable = 'Y' THEN 1 ELSE 0 END)::FLOAT/COUNT(*)::FLOAT *100 percentage
FROM facebook_products