/*

https://platform.stratascratch.com/coding/9668-english-german-french-spanish-speakers

English, German, French, Spanish Speakers

Amazon ID 9668

Find ids of companies that have more than 2 users who speak English, German, French, or Spanish.

Table: playbook_users

playbook_users

user_id:int
created_at:datetime
company_id:int
language:varchar
activated_at:datetime
state:varchar

*/

WITH filtered_table 
AS (SELECT *
    FROM playbook_users
    WHERE language IN ('english', 'spanish', 'german', 'french')
    )
    
SELECT 
    company_id
FROM filtered_table
GROUP BY company_id
HAVING COUNT(*) > 2