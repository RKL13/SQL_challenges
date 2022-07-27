/*

https://platform.stratascratch.com/coding/9815-price-of-a-handyman

Price Of A Handyman

Amazon ID 9815

Find the price that a small handyman business is willing to pay per employee. 
Get the result based on the mode of the adword earnings per employee distribution. 
Small businesses are considered to have not more than ten employees.

Table: google_adwords_earnings

google_adwords_earnings

business_type:varchar
n_employees:int
year:int
adwords_earnings:int

*/

WITH ad_on_n_employees_table 
AS (SELECT adwords_earnings::FLOAT/n_employees::FLOAT            ad_on_n_employees,
            COUNT(*) OVER(PARTITION BY adwords_earnings::FLOAT/n_employees::FLOAT) n_occurence
    FROM google_adwords_earnings
    WHERE business_type = 'handyman'
    AND n_employees <= 10),
ad_on_n_employees_table_ranked 
AS (SELECT ad_on_n_employees,
           RANK() OVER(ORDER BY MAX(n_occurence) DESC) rank_occurences
    FROM ad_on_n_employees_table
    GROUP BY ad_on_n_employees)
    
SELECT 
    ad_on_n_employees
FROM ad_on_n_employees_table_ranked
WHERE rank_occurences = 1