/*

https://platform.stratascratch.com/coding/10067-google-fit-user-tracking

Google Fit User Tracking

Amazon ID 10067

Find the average session distance travelled by Google Fit users based on GPS location data. Calculate the distance for two scenarios:

    Taking into consideration the curvature of the earth

    Taking into consideration the curvature of the earth as a flat surface

Assume one session distance is the distance between the biggest and the smallest step. If the session has only one step id, discard it from the calculation.

Output the average session distances calculated in the two scenarios and the difference between them.

*/

WITH preprocessed_table
AS (SELECT user_id, session_id, day, MAX(step_id) max_step, MIN(step_id) min_step
    FROM google_fit_location
    GROUP BY user_id, session_id, day
    HAVING MAX(step_id)	<> MIN(step_id)),
preprocessed_table_bis
AS (SELECT 
    t1.user_id,
    t1.max_step,
    t1.min_step,
    t2.latitude	max_lat,
    t2.longitude max_long,
    t3.latitude	min_lat,
    t3.longitude min_long
FROM preprocessed_table t1
LEFT JOIN google_fit_location t2
ON t1.user_id = t2.user_id
AND t1.max_step = t2.step_id
LEFT JOIN google_fit_location t3
ON t1.user_id = t3.user_id
AND t1.min_step = t3.step_id)

SELECT
    AVG(ACOS(SIN(RADIANS(min_lat))*SIN(RADIANS(max_lat)) + COS(radians(min_lat))*COS(radians(max_lat))*COS(radians(max_long - min_long)))*6371) AS curved_distance,
    AVG(SQRT((min_lat-max_lat)^2 +(min_long-max_long)^2)*111) flat_sistance,
    AVG(ACOS(SIN(RADIANS(min_lat))*SIN(RADIANS(max_lat)) + COS(radians(min_lat))*COS(radians(max_lat))*COS(radians(max_long - min_long)))*6371) - AVG(SQRT((min_lat-max_lat)^2 +(min_long-max_long)^2)*111) difference
FROM preprocessed_table_bis