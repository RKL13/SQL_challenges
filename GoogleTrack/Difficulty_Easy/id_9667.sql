/*

https://platform.stratascratch.com/coding/9667-count-users-that-speak-english-german-french-or-spanish

Count users that speak English, German, French or Spanish

Amazon ID 9667

How many users speak English, German, French or Spanish?

Note: Users who speak more than one language are counted only once.

Table: playbook_users

playbook_users

user_id:int
created_at:datetime
company_id:int
language:varchar
activated_at:datetime
state:varchar

*/

SELECT 
    COUNT(DISTINCT user_id) AS ang_ger_fren_spa_speakers
FROM playbook_users
WHERE language IN ('english', 'german', 'french', 'spanish')