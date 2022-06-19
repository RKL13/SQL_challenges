/*

https://platform.stratascratch.com/coding/10187-find-the-total-number-of-available-beds-per-hosts-nationality

Find the total number of available beds per hosts' nationality

Airbnb ID 10187

Find the total number of available beds per hosts' nationality.
Output the nationality along with the corresponding total number of available beds.
Sort records by the total available beds in descending order.

Tables: airbnb_apartments, airbnb_hosts

airbnb_apartments

host_id:int
apartment_id:varchar
apartment_type:varchar
n_beds:int
n_bedrooms:int
country:varchar
city:varchar

airbnb_hosts

host_id:int
nationality:varchar
gender:varchar
age:int

*/

SELECT 
    hosts.nationality, 
    SUM(apartments.n_beds) as sum_n_beds
FROM airbnb_apartments AS apartments
LEFT JOIN airbnb_hosts AS hosts
    ON apartments.host_id = hosts.host_id
GROUP BY hosts.nationality
ORDER BY sum_n_beds DESC;