/*

https://platform.stratascratch.com/coding/10319-monthly-percentage-difference

Monthly Percentage Difference

Amazon ID 10319

Given a table of purchases by date, calculate the month-over-month percentage change in revenue. 
The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, 
and sorted from the beginning of the year to the end of the year.

The percentage change column will be populated from the 2nd month forward and can be calculated as 
((this month's revenue - last month's revenue) / last month's revenue)*100.

Table: sf_transactions

sf_transactions

id:int
created_at:datetime
value:int
purchase_id:int

*/

WITH formated_sf_transaction 
AS (SELECT TO_CHAR(created_at, 'YYYY-MM') AS year_month,
           id,
           value,
           purchase_id
    FROM sf_transactions),
table_ordered_indexed
AS (SELECT year_month,
           SUM(value) AS month_value,
           ROW_NUMBER() OVER(ORDER BY year_month) AS t1,
           ROW_NUMBER() OVER(ORDER BY year_month) - 1 AS t0
    FROM formated_sf_transaction
    GROUP BY year_month
    ORDER BY year_month)
 
SELECT 
    table0.year_month,
    ROUND(((table0.month_value - table1.month_value)/table1.month_value)*100, 2) AS month_over_month_percentage_revenue
FROM table_ordered_indexed as table0
LEFT JOIN table_ordered_indexed as table1
ON table0.t0 = table1.t1