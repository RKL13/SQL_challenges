/*

https://platform.stratascratch.com/coding/9878-countries-with-most-negative-reviews

Countries With Most Negative Reviews

Airbnb ID 9878

Find the countries with the most negative reviews. 
Output the country along with the number of negative reviews and sort records based on the number of negative reviews in descending order. 
You can ignore countries with no negative reviews.

Table: hotel_reviews

hotel_reviews

hotel_address:varchar
additional_number_of_scoring:int
review_date:datetime
average_score:float
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

SELECT 
    reviewer_nationality,
    COUNT(negative_review) AS n_negative_reviews
FROM hotel_reviews
WHERE negative_review <> 'No Negative'
GROUP BY reviewer_nationality
ORDER BY n_negative_reviews DESC;