/*

https://platform.stratascratch.com/coding/10314-revenue-over-time

Revenue Over Time

Amazon ID 10314

Find the 3-month rolling average of total revenue from purchases given a table with users, their purchase amount, and date purchased. 
Do not include returns which are represented by negative purchase values. Output the year-month (YYYY-MM) and 3-month rolling average 
of revenue, sorted from earliest month to latest month.

A 3-month rolling average is defined by calculating the average total revenue from all user purchases for the current month and previous 
two months. The first two months will not be a true 3-month rolling average since we are not given data from last year. 
Assume each month has at least one purchase.

Table: amazon_purchases

amazon_purchases

user_id:int
created_at:datetime
purchase_amt:int

*/

WITH preprocessed_table 
AS (SELECT TO_CHAR(created_at, 'YYYY-MM') AS year_month,
           SUM(purchase_amt) AS month_purchase_amt
    FROM amazon_purchases
    WHERE purchase_amt > 0 
    GROUP BY TO_CHAR(created_at, 'YYYY-MM') 
    ORDER BY TO_CHAR(created_at, 'YYYY-MM'))
    
SELECT
    year_month,
    AVG(month_purchase_amt) OVER(ORDER BY year_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
FROM preprocessed_table