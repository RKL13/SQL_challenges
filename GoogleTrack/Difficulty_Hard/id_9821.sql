/*

https://platform.stratascratch.com/coding/9821-common-friends-friend

Common Friends Friend

Amazon ID 9821

Find the number of a user's friends' friend who are also the user's friend. Output the user id along with the count.

Table: google_friends_network

google_friends_network

user_id:int
friend_id:int

*/

WITH friendship_table
AS (SELECT distinct * 
    FROM google_friends_network
    UNION 
    SELECT 
        friend_id AS user_id,
        user_id	AS friend_id
    FROM google_friends_network),
full_table
AS (SELECT ft1.user_id a,
           ft1.friend_id b,
           ft2.friend_id c
    FROM friendship_table ft1
    LEFT JOIN friendship_table ft2
    ON ft1.friend_id = ft2.user_id
    ORDER BY a, b, c)
    
SELECT 
    ft1.a,
    COUNT(DISTINCT ft1.b) n_friends
FROM full_table ft1
INNER JOIN full_table ft2
ON ft1.a = ft2.a
AND ft1.b = ft2.c
GROUP BY ft1.a