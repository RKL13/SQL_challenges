/*

https://platform.stratascratch.com/coding/9822-find-the-average-number-of-friends-a-user-has

Find the average number of friends a user has

Amazon ID 9822

Find the average number of friends a user has.

Table: google_friends_network

google_friends_network

user_id:int
friend_id:int

*/

WITH friend_table 
AS (SELECT user_id,
           friend_id
    FROM google_friends_network
    UNION  
    SELECT 
        friend_id user_id,
        user_id friend_id 
    FROM google_friends_network),
n_friend_table AS (SELECT user_id,
                          COUNT(*) n_friends
                   FROM friend_table
                   GROUP BY user_id)
SELECT 
    AVG(n_friends)
FROM n_friend_table