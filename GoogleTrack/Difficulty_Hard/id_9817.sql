/*

https://platform.stratascratch.com/coding/9817-find-the-number-of-times-each-word-appears-in-drafts

Find the number of times each word appears in drafts

Amazon ID 9817

Find the number of times each word appears in drafts.
Output the word along with the corresponding number of occurrences.

Table: google_file_store

google_file_store

filename:varchar
contents:varchar

*/

WITH words_table
AS (SELECT unnest(regexp_split_to_array(contents, ' ')) words
    FROM google_file_store
    WHERE filename ILIKE '%draft%')
    
SELECT 
   lower(TRIM(words , '.,')) words,
   COUNT(lower(TRIM(words , '.,'))) count_words
FROM words_table
GROUP BY lower(TRIM(words , '.,'))
ORDER BY COUNT(lower(TRIM(words , '.,'))) DESC 