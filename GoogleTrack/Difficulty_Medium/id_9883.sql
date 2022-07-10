/*

https://platform.stratascratch.com/coding/9883-find-the-oldest-survivor-per-passenger-class

Find the oldest survivor per passenger class

Amazon ID 9883

Find the oldest survivor of each passenger class.

Output the name and the age of the survivor along with the corresponding passenger class.

Order records by passenger class in ascending order.

Table: titanic

titanic

passengerid:int
survived:int
pclass:int
name:varchar
sex:varchar
age:float
sibsp:int
parch:int
ticket:varchar
fare:float
cabin:varchar
embarked:varchar

*/

WITH class_max_age 
AS (SELECT pclass,
           MAX(age) max_age_survivor
    FROM titanic
    WHERE survived = 1
    GROUP BY pclass)
    
SELECT 
    name,
    age,
    t.pclass
FROM titanic t
LEFT JOIN class_max_age c
ON t.pclass = c.pclass
AND t.age = c.max_age_survivor
WHERE c.pclass IS NOT NULL
ORDER BY pclass ASC