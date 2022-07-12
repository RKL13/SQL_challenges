/*

https://platform.stratascratch.com/coding/9611-find-the-80th-percentile-of-hours-studied

Find the 80th percentile of hours studied

Amazon ID 9611

Find the 80th percentile of hours studied.

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

SELECT 
    PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY  hrs_studied) AS percentile_hour
FROM sat_scores