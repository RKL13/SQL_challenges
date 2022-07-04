/*

https://platform.stratascratch.com/coding/9918-arizona-california-and-hawaii-employees

Arizona, California, and Hawaii Employees

Amazon ID 9918

Find employees from Arizona, California, and Hawaii while making sure to output all employees from each city. 
Output column headers should be Arizona, California, and Hawaii. Data for all cities must be ordered on the first name.

Assume unequal number of employees per city.

Table: employee

employee

id:int
first_name:varchar
last_name:varchar
age:intsex:varchar
employee_title:varchar
department:varchar
salary:int
target:int
bonus:int
email:varchar
city:varchar
address:varchar
manager_id:int

*/

WITH name_city 
AS (SELECT first_name,city 
    FROM employee
    WHERE city in ('Arizona','California','Hawaii')),
arizona_table 
AS (SELECT first_name AS Arizona,
           ROW_NUMBER() OVER(ORDER BY first_name) AS row_id
    FROM name_city
    WHERE city = ('Arizona')
    ORDER BY first_name),
california_table 
AS (SELECT first_name AS California,
           ROW_NUMBER() OVER(ORDER BY first_name) AS row_id
    FROM name_city
    WHERE city = ('California')
    ORDER BY first_name),
hawaii_table 
AS (SELECT first_name AS Hawaii,
           ROW_NUMBER() OVER(ORDER BY first_name) AS row_id
    FROM name_city
    WHERE city = ('Hawaii')
    ORDER BY first_name)
    
SELECT 
    arizona,
    california,	
    hawaii
FROM arizona_table a 
FULL OUTER JOIN california_table c
ON a.row_id = c.row_id
FULL OUTER JOIN hawaii_table h
ON a.row_id = h.row_id