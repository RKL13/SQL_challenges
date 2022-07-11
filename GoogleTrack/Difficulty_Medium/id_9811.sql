/*

https://platform.stratascratch.com/coding/9811-find-the-minimal-adwords-earnings-for-each-business-type

Find the minimal adwords earnings for each business type

Amazon ID 9811

Find the minimal adwords earnings for each business type.
Output the business type along with the minimal earning.

Table: google_adwords_earnings

google_adwords_earnings

business_type:varchar
n_employees:intyear:int
adwords_earnings:int

*/

SELECT 
    business_type,
    MIN(adwords_earnings) min_adwords_earnings
FROM google_adwords_earnings
GROUP BY business_type