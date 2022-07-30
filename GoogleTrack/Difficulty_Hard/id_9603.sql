/*

https://platform.stratascratch.com/coding/9603-find-fare-differences-on-the-titanic-using-a-self-join

Find fare differences on the Titanic using a self join

Amazon ID 9603

Find the average absolute fare difference between a specific passenger and all passengers that belong to the same pclass,  
both are non-survivors and age difference between two of them is 5 or less years. Do that for each passenger 
(that satisfy above mentioned coniditions). Output the result along with the passenger name.

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

WITH cleaned_table
AS (SELECT name,
           pclass,
           survived,
           age,
           fare
    FROM titanic
    WHERE survived = 0
    ORDER BY pclass)
    
SELECT 
    ct1.name,
    AVG(ABS(ct1.fare - ct2.fare)) avg_fare
FROM cleaned_table ct1
LEFT JOIN cleaned_table ct2
ON ct1.pclass = ct2.pclass
WHERE ABS(ct1.age - ct2.age) <= 5
AND ct1.name <> ct2.name
GROUP BY ct1.name