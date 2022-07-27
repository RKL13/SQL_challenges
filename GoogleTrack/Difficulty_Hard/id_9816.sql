/*

https://platform.stratascratch.com/coding/9816-find-the-list-of-intersections-between-both-word-lists

Find the list of intersections between both word lists

Amazon ID 9816

Find the list of intersections between both word lists.

Table: google_word_lists

google_word_lists

words1:varchar
words2:varchar

*/

WITH w1 
AS (SELECT unnest(regexp_split_to_array(words1, ',')) words
    FROM google_word_lists),
w2 AS (SELECT unnest(regexp_split_to_array(words2, ','))        words
        FROM google_word_lists)

SELECT 
    w1.words
FROM w1
INNER JOIN w2
ON w1.words = w2.words