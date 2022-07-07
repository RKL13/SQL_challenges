/*

https://platform.stratascratch.com/coding/2100-salary-by-education

Salary by Education

Amazon ID 2100

Given the education levels and salaries of a group of individuals, find what is the average salary for each level of education.

google_salaries

id:int
first_name:varchar
last_name:varchar
department:varchar
education:varchar
salary:int

*/

SELECT 
    education,
    AVG(salary) avg_salary
FROM google_salaries
GROUP BY education