/*

https://platform.stratascratch.com/coding/9858-find-employees-in-the-hr-department-and-output-the-result-with-one-duplicate

Find employees in the HR department

Amazon ID 9858

Find employees in the HR department
Output the first name and the department of employees. 
Duplicate the output, e.g. if there are 3 employees/rows, output should have 6 rows, so that each employee has two rows.

Table: worker

worker

worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar

*/

SELECT 
    first_name,
    department
FROM worker
WHERE department = 'HR'
UNION ALL
SELECT 
    first_name,
    department
FROM worker
WHERE department = 'HR'