/*

https://platform.stratascratch.com/coding/10065-find-whether-the-number-of-seniors-works-at-facebook-is-higher-than-its-number-of-usa-based-employees

Find whether the number of seniors works at Meta/Facebook is higher than its number of USA based employees

Amazon ID 10065

Find whether the number of senior workers (i.e., more experienced) at Meta/Facebook 
is higher than number of USA based employees at Facebook/Meta.

If the number of seniors is higher then output as 'More seniors'. Otherwise, output as 'More USA-based'.

Table: facebook_employees

facebook_employees

id:int
location:varchar
age:int
gender:varchar
is_senior:bool

*/

WITH preprocessed_table
AS (SELECT COUNT(CASE WHEN is_senior = TRUE THEN is_senior  ELSE NULL END) AS senior,
           COUNT(CASE WHEN location = 'USA' THEN location   ELSE NULL END) AS usa
    FROM facebook_employees)
    
SELECT 
    CASE WHEN senior > usa THEN 'More seniors' ELSE 'More USA-based' END 
FROM preprocessed_table