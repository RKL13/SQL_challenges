/*

https://platform.stratascratch.com/coding/10070-deepmind-employment-competition

DeepMind employment competition

Amazon ID 10070

Find the winning teams of DeepMind employment competition.

Output the team along with the average team score.

Sort records by the team score in descending order.

Tables: google_competition_participants, google_competition_scores

google_competition_participants

member_id:int
team_id:int

google_competition_scores

member_id:int
member_score:float

*/

SELECT 
    p.team_id,
    AVG(s.member_score) AS team_score
FROM google_competition_participants p
LEFT JOIN google_competition_scores s
ON p.member_id = s.member_id
GROUP BY p.team_id
ORDER BY team_score