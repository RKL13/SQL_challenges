/*

https://platform.stratascratch.com/coding/9774-find-the-maximum-step-reached-for-every-feature

Find the maximum step reached for every feature

Amazon ID 9774

Find the maximum step reached for every feature.

Output the feature id along with its maximum step.

Table: facebook_product_features_realizations

facebook_product_features_realizations

feature_id:int
user_id:int
step_reached:int
timestamp:datetime

*/

SELECT 
    feature_id,
    MAX(step_reached)
FROM facebook_product_features_realizations
GROUP BY feature_id