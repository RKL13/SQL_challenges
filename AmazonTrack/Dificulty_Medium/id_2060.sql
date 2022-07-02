/*

https://platform.stratascratch.com/coding/2060-manager-of-the-largest-department

Manager of the Largest Department

Amazon ID 2060

Given a list of a company's employees, find the name of the manager from the largest department. 
Manager is each employee that contains word "manager" under their position.  
Output their first and last name.

Table: az_employees

az_employees

id:int
first_name:varchar
last_name:varchar
department_id:int
department_name:varchar
position:varchar

*/

WITH table_ranked 
AS (SELECT department_name,
           RANK() OVER(ORDER BY COUNT(*) DESC) as ranked_dpt
    FROM az_employees
    GROUP BY department_name)
    
SELECT 
    * 
FROM az_employees
LEFT JOIN table_ranked
ON az_employees.department_name = table_ranked.department_name
WHERE position ILIKE '%manager%'
AND ranked_dpt = 1