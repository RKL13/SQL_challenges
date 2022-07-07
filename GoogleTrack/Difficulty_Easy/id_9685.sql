/*

https://platform.stratascratch.com/coding/9685-companies-with-chinese-speakers

Companies With Chinese Speakers

Amazon ID 9685

Find companies that have at least 2 Chinese speaking users.

Table: playbook_users

playbook_users

user_id:int
created_at:datetime
company_id:int
language:varchar
activated_at:datetime
state:varchar

*/

WITH chinese_speaker_count
AS (SELECT company_id,
           SUM(CASE WHEN language = 'chinese' THEN 1 ELSE 0 END) AS number_of_chinese_speaker
    FROM playbook_users
    GROUP BY company_id)
    
SELECT 
    company_id
FROM chinese_speaker_count
WHERE number_of_chinese_speaker >= 2