/*

https://platform.stratascratch.com/coding/10156-number-of-units-per-nationality

Number Of Units Per Nationality

Airbnb ID 10156

Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.

Tables: airbnb_hosts, airbnb_units

airbnb_hosts

host_id:int
nationality:varchar
gender:varchar
age:int

airbnb_units

host_id:int
unit_id:varchar
unit_type:varcha
rn_beds:int
n_bedrooms:int
country:varchar
city:varchar

*/

SELECT
    hosts.nationality,
    COUNT(DISTINCT units.unit_id) AS n_apartments
FROM airbnb_hosts AS hosts
LEFT JOIN airbnb_units AS units
    ON hosts.host_id = units.host_id
WHERE hosts.age < 30
AND units.unit_type = 'Apartment'
GROUP BY hosts.nationality
ORDER BY n_apartments DESC;