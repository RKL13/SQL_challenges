/*

https://platform.stratascratch.com/coding/10160-rank-guests-based-on-their-ages

Rank guests based on their ages

Airbnb ID 10160

Rank guests based on their ages.
Output the guest id along with the corresponding rank.
Order records by the age in descending order.

Table: airbnb_guests

airbnb_guests

guest_id:int
nationality:varchar
gender:varchar
age:int

*/

SELECT
    guest_id,
    RANK() OVER(ORDER BY age DESC) AS rank
FROM airbnb_guests
ORDER BY rank ASC;