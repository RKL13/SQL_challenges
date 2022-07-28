/*

https://platform.stratascratch.com/coding/9610-find-students-with-a-median-writing-score

Find students with a median writing score

Amazon ID 9610

Output ids of students with a median score from the writing SAT.

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
    student_id 
FROM sat_scores
WHERE sat_writing = (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY sat_writing)
                     FROM sat_scores)