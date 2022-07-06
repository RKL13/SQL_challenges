/*

https://platform.stratascratch.com/coding/2059-player-with-longest-streak

Player with Longest Streak

Amazon ID 2059

You are given a table of tennis players and their matches that they could either win (W) or lose (L). 
Find the longest streak of wins. A streak is a set of consecutive won matches of one player. 
The streak ends once a player loses their next match. Output the ID of the player or players and the length of the streak.

Table: players_results

players_results

player_id:int
match_date:datetime
match_result:varchar

*/

WITH ranked_table
AS (SELECT *,
           RANK() OVER(PARTITION BY player_id ORDER BY match_date) AS rank_date,
           RANK() OVER(PARTITION BY player_id, match_result ORDER BY match_date) AS rank_match
    FROM players_results
    ORDER BY player_id, match_date),
rank_delay_table
AS (SELECT *,
           rank_date-rank_match AS rank_delay
    FROM ranked_table
    WHERE match_result = 'W'),
rank_delay_occurences 
AS (SELECT player_id,
           rank_delay,
           COUNT(rank_delay) AS rank_delay_occurences
    FROM rank_delay_table
    GROUP BY player_id, rank_delay
    ORDER BY player_id)
    
SELECT
    player_id,
    rank_delay_occurences successive_wins
FROM rank_delay_occurences
WHERE rank_delay_occurences = (SELECT MAX(rank_delay_occurences) FROM rank_delay_occurences)