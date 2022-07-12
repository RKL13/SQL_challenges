/*

https://platform.stratascratch.com/coding/9810-find-all-uses-that-have-more-than-3-friends

Find all uses that have more than 3 friends

Amazon ID 9810

Find all users that have more than 3 friends.

Table: google_friends_network

google_friends_network

user_id:int
friend_id:int

*/

WITH bidirectional_table 
AS (SELECT user_id
    FROM google_friends_network
    UNION ALL 
    SELECT friend_id AS user_id 
    FROM google_friends_network)
    
SELECT 
    user_id
FROM bidirectional_table
GROUP BY user_id
HAVING COUNT(*) > 3