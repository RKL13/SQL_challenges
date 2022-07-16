/*

https://platform.stratascratch.com/coding/9823-common-letters

Common Letters

Amazon ID 9823

Find the top 3 most common letters across all the words from both the tables. 
Output the letter along with the number of occurrences and order records in descending order based on the number of occurrences.

*/

WITH unnested_table
AS (SELECT unnest(regexp_split_to_array(contents, '')) 
    FROM google_file_store
    UNION ALL 
    SELECT unnest(regexp_split_to_array(words1, '')) word1_split
    FROM google_word_lists
    UNION ALL 
    SELECT unnest(regexp_split_to_array(words2, '')) word2_split
    FROM google_word_lists),
clean_unnested_table 
AS (SELECT LOWER(TRIM('0123456789_.,!' FROM unnest)) cleaned_char
    FROM unnested_table),
rank_table 
AS (SELECT cleaned_char,
           COUNT(cleaned_char) count_char,
           RANK() OVER(ORDER BY COUNT(cleaned_char) DESC) char_rank
    FROM clean_unnested_table
    WHERE cleaned_char NOT IN  ('', ' ')
    GROUP BY cleaned_char
    ORDER BY cleaned_char)

SELECT 
    * 
FROM rank_table
WHERE char_rank <= 3
ORDER BY char_rank