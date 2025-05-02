 /* Find the genre of the person with the most number of oscar winnings

Find the genre of the person with the most number of oscar winnings.

If there are more than one person with the same number of oscar wins, return the first one in alphabetic order based on their name. Use the names as keys when joining the tables.

category:text
id:bigint
movie:text
nominee:text
winner:boolean
year:bigint

amg_person_id:text
birthday:date
id:bigint
name:text
top_genre:text
 */

with ranked_oscar_count as (select nominee,
       count(nominee) n_oscar
from oscar_nominees 
where winner = TRUE
GROUP BY nominee
order by n_oscar DESC, nominee ASC)
select top_genre from nominee_information where name = (select nominee from ranked_oscar_count limit 1)