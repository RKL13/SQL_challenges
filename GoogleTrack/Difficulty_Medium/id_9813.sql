/*

https://platform.stratascratch.com/coding/9813-make-the-friends-network-symmetric

Make the friends network symmetric

Amazon ID 9813

Make the friends network symmetric.
For example, if 0 and 1 are friends, have the output contain both 0 and 1 under 1 and 0 respectively

Table: google_friends_network

google_friends_network

user_id:int
friend_id:int

*/

SELECT 
    user_id,
    friend_id
FROM google_friends_network
UNION
SELECT 
    friend_id AS user_id,
    user_id AS friend_id 
FROM google_friends_network