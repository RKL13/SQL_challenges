/*

https://platform.stratascratch.com/coding/10322-finding-user-purchases

Finding User Purchases

Amazon ID 10322

Write a query that'll identify returning active users. 
A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. 
Output a list of user_ids of these returning active users.

For simplicity, you can assume that every first name in the dataset is unique.

Table: amazon_transactions

amazon_transactions

id:int
user_id:int
item:varchar
created_at:datetime
revenue:int

*/

/* Starred : the trick to join a table to itself is quite interesting ! */

SELECT 
    DISTINCT table1.user_id
FROM amazon_transactions table1
JOIN amazon_transactions table2
ON table1.user_id = table2.user_id
AND table1.id <> table2.id
AND table2.created_at - table1.created_at
    BETWEEN 0 AND 7