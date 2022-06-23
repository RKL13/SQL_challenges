/*

https://platform.stratascratch.com/coding/10071-hosts-abroad-apartments

Hosts' Abroad Apartments

Airbnb ID 10071

Find the number of hosts that have accommodations in countries of which they are not citizens.

Tables: airbnb_hosts, airbnb_apartments

airbnb_hosts

host_id:int
nationality:varchar
gender:varchar
age:int

airbnb_apartments

host_id:int
apartment_id:varchar
apartment_type:varchar
n_beds:int
n_bedrooms:int
country:varchar
city:varchar

*/

SELECT COUNT(DISTINCT hosts.host_id)
FROM airbnb_hosts hosts
JOIN airbnb_apartments apartments
ON hosts.host_id = apartments.host_id
AND hosts.nationality <> apartments.country;