/*

https://platform.stratascratch.com/coding/9881-make-a-report-showing-the-number-of-survivors-and-non-survivors-by-passenger-class

Make a report showing the number of survivors and non-survivors by passenger class

Amazon ID 9881

Make a report showing the number of survivors and non-survivors by passenger class.
Classes are categorized based on the pclass value as:
pclass = 1: first_class
pclass = 2: second_classs
pclass = 3: third_class
Output the number of survivors and non-survivors by each class.

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
    survived,
    SUM(CASE WHEN pclass = 1 THEN 1 ELSE 0 END) pclass_1,
    SUM(CASE WHEN pclass = 2 THEN 1 ELSE 0 END) pclass_2,
    SUM(CASE WHEN pclass = 3 THEN 1 ELSE 0 END) pclass_3
FROM titanic
GROUP BY survived