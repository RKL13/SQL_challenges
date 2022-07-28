/*

https://platform.stratascratch.com/coding/9814-counting-instances-in-text

Counting Instances in Text

Amazon ID 9814

Find the number of times the words 'bull' and 'bear' occur in the contents. 
We're counting the number of times the words occur so words like 'bullish' should not be included in our count.

Output the word 'bull' and 'bear' along with the corresponding number of occurrences.

Table: google_file_store

google_file_store

filename:varchar
contents:varchar

*/

WITH trimmerd_table 
AS (SELECT lower(TRIM(unnest(regexp_split_to_array(contents, ' ')), '.,')) words
    FROM google_file_store)
    
SELECT
    words,
    COUNT(words)
FROM trimmerd_table
WHERE words IN ('bull', 'bear')
GROUP BY words