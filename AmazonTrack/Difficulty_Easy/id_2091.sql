/*

https://platform.stratascratch.com/coding/2091-latest-login-date

Latest Login Date

Amazon ID 2091

For each video game player, find the latest date when they logged in.

players_logins

player_id:int
login_date:datetime

*/

SELECT 
    player_id,
    MAX(login_date)
FROM players_logins
GROUP BY player_id