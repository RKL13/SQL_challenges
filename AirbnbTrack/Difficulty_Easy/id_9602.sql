/*

https://platform.stratascratch.com/coding/9602-dirty-hotel-rooms

Dirty Hotel Rooms

Airbnb ID 9602

Find hotels in the Netherlands that got complaints from guests about room dirtiness 
(word "dirty" in its negative review). Output all the columns in your results

Table: hotel_reviews

hotel_reviews

hotel_address:varchar
additional_number_of_scoring:int
review_date:date
timeaverage_score:float
hotel_name:varchar
reviewer_nationality:varchar
negative_review:varchar
review_total_negative_word_counts:int
total_number_of_reviews:int
positive_review:varchar
review_total_positive_word_counts:int
total_number_of_reviews_reviewer_has_given:int
reviewer_score:float
tags:varchar
days_since_review:varchar
lat:float
lng:float

*/

SELECT *
FROM hotel_reviews
WHERE 
    hotel_address ILIKE '%Netherlands%' AND
    negative_review ILIKE '%dirty%';