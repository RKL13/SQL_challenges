/*

https://platform.stratascratch.com/coding/9767-find-all-messages-which-have-references-to-either-user-2-or-3

Find all messages which have references to either user 2 or 3

Amazon ID 9767

Find all messages which have references to either user 2 or 3.

Table: facebook_messages_sent

facebook_messages_sent

sender:int
message_id:int
text:varchar

*/

SELECT 
    * 
FROM facebook_messages_sent
WHERE text ILIKE '%2%'
OR text ILIKE '%3%'