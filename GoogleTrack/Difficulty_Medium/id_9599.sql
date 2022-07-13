/*

https://platform.stratascratch.com/coding/9599-old-and-young-athletes

Old And Young Athletes

Amazon ID 9599

Find the old-to-young player ratio for each Olympic games. 
'Old' is defined as ages 50 and older and 'young' is defined as athletes 25 or younger. 
Output the Olympic games, number of old athletes, number of young athletes, and the old-to-young ratio.

Table: olympics_athletes_events

olympics_athletes_events

id:int
name:varchar
sex:varchar
age:float
height:float
weight:datetime
team:varchar
noc:varchar
games:varchar
year:int
season:varchar
city:varchar
sport:varchar
event:varchar
medal:varchar

*/

WITH young_old_table 
AS (SELECT CASE WHEN age >= 50 THEN 1 ELSE 0 END AS old,
           CASE WHEN age <= 25 THEN 1 ELSE 0 END AS young,
           *
    FROM olympics_athletes_events),
distinct_young_old_table 
AS (SELECT DISTINCT games,
                    name,
                    old,
                    young
    FROM young_old_table)
    
SELECT 
    games,
    SUM(old) n_old, 
    SUM(young) n_young,
    SUM(old)::FLOAT/SUM(young)::FLOAT ratio_young_to_old
FROM distinct_young_old_table
GROUP BY games