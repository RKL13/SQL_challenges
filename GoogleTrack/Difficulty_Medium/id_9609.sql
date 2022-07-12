/*

https://platform.stratascratch.com/coding/9609-find-nexus5-control-group-users-in-italy-who-dont-speak-italian

Find Nexus5 control group users in Italy who don't speak Italian

Amazon ID 9609

Find user id, language, and location of all Nexus 5 control group users in Italy who do not speak Italian. 
Sort the results in ascending order based on the occured_at value of the playbook_experiments dataset.

Tables: playbook_experiments, playbook_users

playbook_experiments

user_id:int
occurred_at:datetime
experiment:varchar
experiment_group:varchar
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
    pe.user_id,	
    pu.language,
    pe.location
FROM playbook_experiments pe
LEFT JOIN playbook_users pu
ON pe.user_id = pu.user_id
WHERE pe.device = 'nexus 5'
AND location = 'Italy'
AND language <> 'italian'
AND experiment_group = 'control_group'
ORDER BY pe.occurred_at