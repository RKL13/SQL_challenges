/*

https://platform.stratascratch.com/coding/9882-find-how-the-survivors-are-distributed-by-the-gender-and-passenger-classes

Find how the survivors are distributed by the gender and passenger classes

Amazon ID 9882

Find how the survivors are distributed by the gender and passenger classes.
Classes are categorized based on the pclass value as:
pclass = 1: first_class
pclass = 2: second_classs
pclass = 3: third_class
Output the sex along with the corresponding number of survivors for each class.

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

SELECT 
    sex,
    SUM(CASE WHEN pclass = 1 THEN 1 ELSE 0 END) pclass_1,
    SUM(CASE WHEN pclass = 2 THEN 1 ELSE 0 END) pclass_2,
    SUM(CASE WHEN pclass = 3 THEN 1 ELSE 0 END) pclass_3
FROM titanic
WHERE survived = 1
GROUP BY sex