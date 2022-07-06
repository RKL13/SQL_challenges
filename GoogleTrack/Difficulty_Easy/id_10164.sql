/*

https://platform.stratascratch.com/coding/10164-total-adwords-earnings

Total AdWords Earnings

Amazon ID 10164

Find the total AdWords earnings for each business type. Output the business types along with the total earnings.

Table: google_adwords_earnings

google_adwords_earnings

business_type:varchar
n_employees:int
ear:int
adwords_earnings:int

*/

SELECT 
    business_type,
    SUM(adwords_earnings)
FROM google_adwords_earnings
GROUP BY business_type