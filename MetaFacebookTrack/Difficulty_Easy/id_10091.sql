/*

https://platform.stratascratch.com/coding/10091-user-exile

User Exile

Amazon ID 10091

Find the number of relationships that user  with id == 1 is not part of.

Table: facebook_friends

facebook_friends

user1:int
user2:int

*/

SELECT 
    COUNT(*)
FROM facebook_friends
WHERE user1 <> 1
AND user2 <> 1