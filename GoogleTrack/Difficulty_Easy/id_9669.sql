/*

https://platform.stratascratch.com/coding/9669-count-the-number-of-speakers-per-each-language

Count the number of speakers per each language

Amazon ID 9669

Count the number of speakers for each language.

Sort the result based on the number of speakers in descending order.

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
    language,
    COUNT(*) AS n_speakers
FROM playbook_users
GROUP BY language
ORDER BY n_speakers