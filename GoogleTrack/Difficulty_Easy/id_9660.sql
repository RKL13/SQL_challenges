/*

https://platform.stratascratch.com/coding/9660-count-the-number-of-students-lectured-by-each-teacher

Count the number of students lectured by each teacher

Amazon ID 9660

Count the number of students lectured by each teacher.

Output the result along with the name of the teacher.

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
    teacher,
    COUNT(DISTINCT student_id) n_students
FROM sat_scores
GROUP BY teacher