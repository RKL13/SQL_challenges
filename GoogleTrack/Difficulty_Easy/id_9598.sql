/*

https://platform.stratascratch.com/coding/9598-find-non-hs-sat-scores

Find non-HS SAT scores

Amazon ID 9598

Find SAT scores of students whose high school names do not end with 'HS'.

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
    * 
FROM sat_scores
WHERE school NOT LIKE '%HS'