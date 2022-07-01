/*

https://platform.stratascratch.com/coding/2108-responsible-for-most-customers

Responsible for Most Customers

Amazon ID 2108

Each Employee is assigned one territory and is responsible for the Customers from this territory. 
There may be multiple employees assigned to the same territory.
Write a query to get the Employees who are responsible for the maximum number of Customers. 
Output the Employee ID and the number of Customers.

Tables: map_employee_territory, map_customer_territory

map_employee_territory

empl_id:varchar
territory_id:varchar

map_customer_territory

cust_id:varchar
territory_id:varchar

*/

WITH territory_cust_count 
AS (SELECT 
    territory_id,
    COUNT(cust_id) AS count_cust_id
FROM map_customer_territory
GROUP BY territory_id)

SELECT 
    * 
FROM territory_cust_count cust_count
LEFT JOIN map_employee_territory empl
ON cust_count.territory_id = empl.territory_id
WHERE count_cust_id = (SELECT MAX(count_cust_id) FROM territory_cust_count)