/*

https://platform.stratascratch.com/coding/10149-gender-with-generous-reviews

Gender With Generous Reviews

Airbnb ID 10149

Write a query to find which gender gives a higher average review score when writing reviews as guests. 
Use the from_type column to identify guest reviews. Output the gender and their average review score.

Table:  airbnb_reviews, airbnb_guests

airbnb_reviews

from_user:int
to_user:int
from_type:varchar
to_type:varchar
review_score:int

airbnb_guests

guest_id:int
nationality:varchar
gender:varchar
age:int

*/

SELECT guests.gender, AVG(reviews.review_score)
FROM airbnb_reviews AS reviews
LEFT JOIN airbnb_guests AS guests
    ON reviews.from_user = guests.guest_id
WHERE reviews.from_type = 'guest'
GROUP BY guests.gender
LIMIT 1;