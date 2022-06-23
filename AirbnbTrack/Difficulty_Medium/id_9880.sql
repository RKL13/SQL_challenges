/*

https://platform.stratascratch.com/coding/9880-find-the-top-five-hotels-with-the-highest-total-reviews-given-by-a-particular-reviewer

Find the top five hotels with the highest total reviews given by a particular reviewer

Airbnb ID 9880

For each hotel find the number of reviews from the most active reviewer. The most active is the one with highest number of total reviews.
Output the hotel name along with the highest total reviews of that reviewer. Output only top 5 hotels with highest total reviews. 
Order records based on the highest total reviews in descending order.

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
    max_total_review
FROM
    (SELECT 
        hotel_name,
        RANK() OVER(ORDER BY max_total_review DESC) AS rank_desc,
        max_total_review
    FROM (SELECT 
            hotel_name,
            MAX(total_number_of_reviews_reviewer_has_given) AS max_total_review
            FROM 
            hotel_reviews
            GROUP BY 
            hotel_name) AS couple_name_max_reviews)
        AS tuple_name_max_reviews_rank
WHERE tuple_name_max_reviews_rank.rank_desc <= 5 