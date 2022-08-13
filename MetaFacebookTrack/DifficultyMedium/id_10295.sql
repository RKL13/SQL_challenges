/*

https://platform.stratascratch.com/coding/10295-most-active-users-on-messenger

Most Active Users On Messenger

Amazon ID 10295

Meta/Facebook Messenger stores the number of messages between users in a table named 'fb_messages'. 
In this table 'user1' is the sender, 'user2' is the receiver, and 'msg_count' is the number of messages 
exchanged between them.

Find the top 10 most active users on Meta/Facebook Messenger by counting their total number of messages sent and received. 
Your solution should output usernames and the count of the total messages they sent or received

Table: fb_messages

fb_messages

id:int
date:datetime
user1:varchar
user2:varchar
msg_count:int

*/

WITH bidirectional_table
AS (SELECT user1 AS username, 
           msg_count
    FROM fb_messages
    UNION ALL
    SELECT 
        user2 AS username,	
        msg_count
    FROM fb_messages),
ranked_table
AS (SELECT username,
           SUM(msg_count) n_msg,
           RANK() OVER(ORDER BY SUM(msg_count) DESC) rank_msg
    FROM bidirectional_table
    GROUP BY username)
    
SELECT 
    username,	
    n_msg
FROM ranked_table
WHERE rank_msg <= 10