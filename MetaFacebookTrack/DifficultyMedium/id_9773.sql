/*

https://platform.stratascratch.com/coding/9773-day-1-common-reactions

Day 1 Common Reactions

Amazon ID 9773

Find the most common reaction for day 1 by counting the number of occurrences for each reaction. 
Output the reaction alongside its number of occurrences.

Table: facebook_reactions

facebook_reactions

poster:int
friend:int
reaction:varchar
date_day:int
post_id:int

*/

WITH ranked_table 
AS (SELECT reaction,
           COUNT(reaction) n_reaction,
           RANK() OVER(ORDER BY COUNT(reaction) DESC) rank_n_reaction
    FROM facebook_reactions
    WHERE date_day = 1
    GROUP BY reaction)
    
SELECT 
    reaction,	
    n_reaction
FROM ranked_table
WHERE rank_n_reaction = 1