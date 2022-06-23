/*

https://platform.stratascratch.com/coding/9876-find-the-top-ten-hotels-with-the-most-negative-reviews-in-summer-june-aug

Find the top two hotels with the most negative reviews

Airbnb ID 9876

Find the top two hotels with the most negative reviews.
Output the hotel name along with the corresponding number of negative reviews.
Sort records based on the number of negative reviews in descending order.

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
    hotel_name,
    n_negative_review
FROM (SELECT 
        hotel_name,
        RANK() OVER(ORDER BY n_negative_review DESC) AS rank_desc,
        n_negative_review
    FROM (SELECT 
            hotel_name,
            COUNT(negative_review) AS n_negative_review
            FROM hotel_reviews
            WHERE negative_review <> 'No Negative'
            GROUP BY hotel_name) 
            AS couple_hotel_negative_review) 
    AS couple_hotel_negative_review_ranked
WHERE rank_desc <= 2;