/*

https://platform.stratascratch.com/coding

Salary Less Than Twice The Average

Amazon ID 2110

Write a query to get the list of managers whose salary is less than twice the average salary of employees reporting to them. 
For these managers, output their ID, salary and the average salary of employees reporting to them.

Tables: map_employee_hierarchy, dim_employee

map_employee_hierarchy

empl_id:varchar
manager_empl_id:varchar

dim_employee

empl_id:varchar
empl_name:varchar
empl_city:varchar
empl_dob:datetime
empl_pin:int
salary:int

*/

WITH employee_salary_table 
AS (SELECT
    map_employee_hierarchy.manager_empl_id,
    AVG(dim_employee.salary) AS total_employee_salary
FROM map_employee_hierarchy
LEFT JOIN dim_employee
ON map_employee_hierarchy.empl_id = dim_employee.empl_id
GROUP BY manager_empl_id)

SELECT 
    manager_empl_id,
    salary,
    total_employee_salary 
FROM employee_salary_table
INNER JOIN dim_employee
ON employee_salary_table.manager_empl_id = dim_employee.empl_id
WHERE total_employee_salary*2 >= salary