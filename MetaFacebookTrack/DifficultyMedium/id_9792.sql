/*

https://platform.stratascratch.com/coding/9792-user-feature-completion

User Feature Completion

Amazon ID 9792

An app has product features that help guide users through a marketing funnel. 
Each feature has "steps" (i.e., actions users can take) as a guide to complete the funnel. 
What is the average percentage of completion for each feature?

Tables: facebook_product_features, facebook_product_features_realizations

facebook_product_features

feature_id:int
n_steps:int

facebook_product_features_realizations

feature_id:int
user_id:int
step_reached:int
timestamp:datetime

*/

WITH prepared_table
AS (SELECT f.feature_id,
           f.n_steps,
           r.user_id,
           MAX(step_reached)/n_steps::FLOAT*100 percentage_of_compl
    FROM facebook_product_features f
    LEFT JOIN facebook_product_features_realizations r
    ON f.feature_id = r.feature_id
    GROUP BY f.feature_id, f.n_steps, r.user_id)
    
SELECT 
    feature_id,
    CASE WHEN AVG(percentage_of_compl) IS NOT NULL THEN AVG(percentage_of_compl) ELSE 0 END AS avg_percentage_completion
FROM prepared_table
GROUP BY feature_id
ORDER BY avg_percentage_completion DESC