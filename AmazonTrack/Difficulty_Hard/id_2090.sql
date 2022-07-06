/*

https://platform.stratascratch.com/coding/2090-first-day-retention-rate

First Day Retention Rate

Amazon ID 2090

Calculate the first-day retention rate of a group of video game players. 
The first-day retention occurs when a player logs in 1 day after their first-ever log-in.

Return the proportion of players who meet this definition divided by the total number of players.

Table: players_logins

players_logins

player_id:int
login_date:datetime

*/

WITH first_day_table 
AS (SELECT player_id,
           MIN(login_date) OVER(PARTITION BY player_id) AS first_day,
           login_date
    FROM players_logins),
first_day_players 
AS (SELECT player_id
    FROM first_day_table
    WHERE login_date - first_day <> 0
    GROUP BY player_id
    HAVING MIN(login_date - first_day) = 1)
    
SELECT
    ((SELECT COUNT(DISTINCT player_id) FROM first_day_players)::FLOAT/COUNT(DISTINCT player_id)) AS retention_rate
FROM players_logins