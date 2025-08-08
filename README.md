# SQL_challenges :honey_pot: :honey_pot: :honey_pot: 

We solve daily between 2 to 5 SQL challenges (starting 06-19-2022) from real SQL interview questions.

Easy | Medium | Hard | Track
:---:| :---:|:---:| ---
✅| ✅| ✅| [AirBnB](https://github.com/RKL13/SQL_challenges/tree/main/AirbnbTrack)
✅| ✅| ✅| [Amazon](https://github.com/RKL13/SQL_challenges/tree/main/AmazonTrack)
✅| ✅| ✅| [Google](https://github.com/RKL13/SQL_challenges/tree/main/GoogleTrack)
✅| ⬜️| ⬜️| [Meta/Facebook](https://github.com/RKL13/SQL_challenges/tree/main/MetaFacebookTrack)
⬜️| ⬜️| ⬜️| [Netflix](https://github.com/RKL13/SQL_challenges/tree/main/Netflix)
⬜️| ⬜️| ✅| [Twitch](https://github.com/RKL13/SQL_challenges/tree/main/Twitch)
⬜️| ✅| ✅| [Ebay](https://github.com/RKL13/SQL_challenges/tree/main/Ebay)
⬜️| ⬜️| ⬜️| [Microsoft](https://github.com/RKL13/SQL_challenges/tree/main/Microsoft)

### Cheat Sheet of SQL's interesting funtions, tricks and challenges :wrench:

This section gather some SQL's functions, tricks and challenges we found interesting.

+ ##### Functions :loop:

	+ RANK(), DENSE_RANK(), ROW_NUMBER(), WINDOW(), PERCENT_RANK() followed by OVER() clause (below)
	+ OVER( (PARTITION BY (remember that one can put several columns here such as a GROUP BY) clause) (ORDER BY clause) (ROW or RANGE clause) ) 
	+ EXTRACT( FROM )
	+ TO_CHAR() for dates format
	+ COALESCE()
	+ LAG() OVER()
	+ PERCENTILE_CONT ( numeric_literal ) WITHIN GROUP ( ORDER BY order_by_expression) OVER () [id_9611](https://github.com/RKL13/SQL_challenges/blob/main/GoogleTrack/Dificulty_Medium/id_9611_starred.sql) NB : CONT NOT COUNT
	+ CORR(dependant, independant) OVER() [id_10069](https://github.com/RKL13/SQL_challenges/blob/main/GoogleTrack/Difficulty_Hard/id_10069.sql)
	+ regexp_split_to_array(), unnest(), array_agg(), array_to_string() [id_9818](https://github.com/RKL13/SQL_challenges/blob/main/GoogleTrack/Difficulty_Hard/id_9818.sql)
	+ TRIM(content) or TRIM(content, 'characters') [id_9817](https://github.com/RKL13/SQL_challenges/blob/main/GoogleTrack/Difficulty_Hard/id_9817.sql)
	+ CARDINALITY()[id_9812](https://github.com/RKL13/SQL_challenges/blob/main/GoogleTrack/Difficulty_Hard/id_9812.sql)
	+ TRANSLATE()(replace regex into a string)[id_9794](https://github.com/RKL13/SQL_challenges/blob/main/GoogleTrack/Difficulty_Hard/id_9794.sql)
	+ Datetimes : DATE_PART(), EXTRACT(YEAR/MONTH/etc FROM var) (careful must put AS for aliases with EXTRACT), TO_CHAR()
	+ generate_series(x, y) <=> ~range(x, y) pandas (nb: can be MIN MAX, etc)

+ ##### Tricks :stars:

	+ One can join a table on itself to solve problem e.g : [id_10322](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Dificulty_Medium/id_10322_starred.sql) 

	+ One can use UNION ALL on the same table to duplicates records e.g : [id_9858](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Dificulty_Medium/id_9858_starred.sql) 

	+ One can use AVG() OVER() to make a moving/rolling average e.g : [id_10314](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Difficulty_Hard/id_10314_starred.sql)
	
	+ One can use generate_series in PostgreSQL to generate a serie e.g : [id_2089](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Difficulty_Hard/id_2089.sql)

	+ COUNT(CASE ... END)[id_10141](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Dificulty_Medium/id_10141_starred.sql)[id_2105.sql](https://github.com/RKL13/SQL_challenges/blob/main/GoogleTrack/Difficulty_Hard/id_2105.sql)

	+ One can order by several contradictory sorting order ex: (ORDER BY x ASC, y DESC) [id_10351.sql](https://github.com/RKL13/SQL_challenges/blob/main/GoogleTrack/Difficulty_Hard/id_10351.sql)

	+ Date difference with ex : WHERE created_at BETWEEN '2020-02-10'::DATE - 30 * INTERVAL '1 day' AND '2020-02-10' [id_2004.sql](https://github.com/RKL13/SQL_challenges/blob/main/MetaFacebookTrack/Difficulty_Easy/id_2004.sql)

+ ##### Special Mention Challenges :trophy:

	+ [id_2059.sql](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Difficulty_Hard/id_2059_starred.sql)



#### On possible difficulty folders imbalance in tracks 

There are often fewer HARD level challenges available on StartaScratch hence the imbalance one can find in between tracks' level folders. 
This imbalance does not come from our part as we tend to resolve all the challenges, whatever their difficulties are. :horse_racing:

#### Order of SQL

FROM + JOIN → WHERE → GROUP BY → HAVING → SELECT (+ fonctions de fenêtre OVER) → ORDER BY → LIMIT