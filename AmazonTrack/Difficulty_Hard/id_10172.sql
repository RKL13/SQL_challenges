/*

https://platform.stratascratch.com/coding/10172-best-selling-item

Best Selling Item

Amazon ID 10172

Find the best selling item for each month (no need to separate months by year) where the biggest total invoice was paid. 
The best selling item is calculated using the formula (unitprice * quantity). Output the description of the item 
along with the amount paid.

Table: online_retail

online_retail

invoiceno:varchar
stockcode:varchar
description:varchar
quantity:int
invoicedate:datetime
unitprice:float
customerid:float
country:varchar

*/

WITH preprocessed_table
AS (SELECT description,
           unitprice*quantity AS total_invoice,
           EXTRACT(MONTH FROM invoicedate) AS month
    FROM online_retail
    ORDER BY EXTRACT(MONTH FROM invoicedate)),
preprocessed_table_ranked 
AS (SELECT month, 
           description,
           SUM(total_invoice) AS total_invoice_product,
           RANK() OVER(PARTITION BY month ORDER BY SUM(total_invoice) DESC) AS month_rank
    FROM preprocessed_table
    GROUP BY month, description
    ORDER BY month)

SELECT
    *
FROM preprocessed_table_ranked
WHERE month_rank = 1