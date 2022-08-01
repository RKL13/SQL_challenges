/*

https://platform.stratascratch.com/coding/10061-popularity-of-hack

Popularity of Hack

Amazon ID 10061

Find all posts which were reacted to with a heart. 
For such posts output all columns from facebook_posts table.
Meta/Facebook has developed a new programing language called Hack.
To measure the popularity of Hack they ran a survey with their employees. 
The survey included data on previous programing familiarity as well as the number of years of experience, 
age, gender and most importantly satisfaction with Hack. Due to an error location data was not collected, 
but your supervisor demands a report showing average popularity of Hack by office location. 
Luckily the user IDs of employees completing the surveys were stored.

Tables: facebook_employees, facebook_hack_survey

facebook_employees

id:int
location:varchar
age:int
gender:varchar
is_senior:bool

facebook_hack_survey

employee_id:int
age:int
gender:varchar
popularity:int

*/

SELECT 
    e.location,
    AVG(popularity)
FROM facebook_employees e
LEFT JOIN facebook_hack_survey h
ON e.id = h.employee_id
GROUP BY e.location