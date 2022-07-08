/*

https://platform.stratascratch.com/coding/10139-number-of-speakers-by-language

Number of Speakers By Language

Amazon ID 10139

Find the number of speakers of each language by country. 
Output the country, language, and the corresponding number of speakers. 
Output the result based on the country in ascending order.

playbook_events

user_id:int
occurred_at:datetime
event_type:varchar
event_name:varchar
location:varchar
device:varchar

playbook_users

user_id:int
created_at:datetime
company_id:int
language:varchar
activated_at:datetime
state:varchar

*/

SELECT 
    location,
    language,
    COUNT(DISTINCT pe.user_id) n_languages_speaked
FROM playbook_events pe
LEFT JOIN playbook_users pu
ON pe.user_id = pu.user_id
GROUP BY location, language
ORDER BY location