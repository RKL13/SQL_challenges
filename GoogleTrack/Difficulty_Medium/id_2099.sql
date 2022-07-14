/*

https://platform.stratascratch.com/coding/2099-election-results

Election Results

Amazon ID 2099

The election is conducted in a city and everyone can vote for one or more candidates, or choose not to vote at all. 
Each person has 1 vote so if they vote for multiple candidates, their vote gets equally split across these candidates. 
For example, if a person votes for 2 candidates, these candidates receive an equivalent of 0.5 vote each. All candidates can vote too.
Find out who got the most votes and won the election. Output the name of the candidate or multiple names in case of a tie. 
To avoid issues with a floating-point error you can round the number of votes received by a candidate to 3 decimal places.

Table: voting_results

voting_results

voter:varchar
candidate:varchar

*/

WITH vote_weights_table 
AS (SELECT voter,
           candidate,
           1/COUNT(candidate) OVER(PARTITION BY voter)::FLOAT AS vote_weight
    FROM voting_results
    WHERE candidate IS NOT NULL),
ranked_table 
AS (SELECT candidate,
           SUM(vote_weight),
           RANK() OVER(ORDER BY SUM(vote_weight) DESC) AS results
    FROM vote_weights_table
    GROUP BY candidate)
    
SELECT 
    candidate
FROM ranked_table
WHERE results = 1