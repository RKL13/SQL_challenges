/*

https://platform.stratascratch.com/coding/2056-number-of-shipments-per-month

Number of Shipments Per Month

Amazon ID 2056

Write a query that will calculate the number of shipments per month. 
The unique key for one shipment is a combination of shipment_id and sub_id. 
Output the year_month in format YYYY-MM and the number of shipments in that month.

Table: amazon_shipment

amazon_shipment

shipment_id:int
sub_id:int
weight:int
shipment_date:datetime
add:datetime

*/

SELECT 
    TO_CHAR(shipment_date, 'YYYY-MM') AS year_month,
    COUNT(DISTINCT (shipment_id, sub_id))
FROM amazon_shipment
GROUP BY year_month