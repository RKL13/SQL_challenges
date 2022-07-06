/*

https://platform.stratascratch.com/coding/2089-cookbook-recipes

Cookbook Recipes

Amazon ID 2089

You are given the table with titles of recipes from a cookbook and their page numbers. 
You are asked to represent how the recipes will be distributed in the book.

Produce a table consisting of three columns: left_page_number, left_title and right_title. 
The k-th row (counting from 0), should contain the number and the title of the page with the number 2×k2 \times k2×k in the first 
and second columns respectively, and the title of the page with the number 2×k+12 \times k + 12×k+1 in the third column.

Each page contains at most 1 recipe. If the page does not contain a recipe, the appropriate cell should remain empty (NULL value). 
Page 0 (the internal side of the front cover) is guaranteed to be empty.

Table: cookbook_titles

cookbook_titles

page_number:int
title:varchar

*/

WITH table_left_page_number 
AS (SELECT DISTINCT generate_series(0,(SELECT MAX(page_number) FROM cookbook_titles))*2 AS left_page_number
    FROM cookbook_titles),
book_structure 
AS (SELECT left_page_number,
           left_page_number AS left_title_number,
           left_page_number + 1 AS right_title_number
    FROM table_left_page_number
    ORDER BY left_page_number)
    
SELECT left_page_number,
           c_left.title AS left_title,
           c_right.title AS right_title
FROM book_structure b
LEFT JOIN cookbook_titles c_left
ON b.left_title_number = c_left.page_number
LEFT JOIN cookbook_titles c_right
ON b.right_title_number = c_right.page_number
WHERE left_page_number <= (SELECT MAX(page_number) FROM cookbook_titles)
ORDER BY left_page_number