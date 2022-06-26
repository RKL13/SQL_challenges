/*

https://platform.stratascratch.com/coding/2109-products-with-no-sales

Products with No Sales

Amazon ID 2109

Write a query to get a list of products that have not had any sales. Output the ID and market name of these products.

Table: worker

fct_customer_sales

cust_id:varchar
prod_sku_id:varchar
order_date:datetime
order_value:int
order_id:varchar

dim_product

prod_sku_id:varchar
prod_sku_name:varchar
prod_brand:varchar
market_name:varchar

*/

SELECT
    dim_product.prod_sku_id,
    market_name
FROM fct_customer_sales
FULL OUTER JOIN dim_product
ON fct_customer_sales.prod_sku_id = dim_product.prod_sku_id
WHERE fct_customer_sales.prod_sku_id IS NULL