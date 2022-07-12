/*

https://platform.stratascratch.com/coding/9661-find-the-student-with-the-highest-efficiency-for-mathematics

Find the student with the highest efficiency for mathematics

Amazon ID 9661

Find the student with the highest efficiency for mathematics?

The efficiency is defined as the score divided by hours studied.
Output the result along with the student id, hours studies and the obtained score for mathematics.
Sort the results based on the efficiency in the descending order.

Table: sat_scores

sat_scores

school:varchar
teacher:varchar
student_id:float
sat_writing:float
sat_verbal:float
sat_math:float
hrs_studied:float
id:int
average_sat:float
love:datetime

*/

WITH efficiency_table 
AS (SELECT student_id,
           sat_math,
           hrs_studied,
           sat_math/hrs_studied AS efficiency_coef,
           RANK() OVER(ORDER BY sat_math/hrs_studied DESC) AS efficiency_rank
    FROM sat_scores
    WHERE hrs_studied > 0)
    
SELECT
    *
FROM efficiency_table
WHERE efficiency_rank = 1