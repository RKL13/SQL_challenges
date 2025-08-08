with t1 as (select *, 
case when page_number%2 = 0 then 'l' when page_number%2 = 1 then 'r' end l_r,
page_number - 1 page_number_
from cookbook_titles),
t2 as (select generate_series(min(page_number), max(page_number)) from t1),
left_p as (select * from t1 where l_r = 'l'),
right_p as (select * from t1 where l_r = 'r')
select generate_series as left_page_number, left_p.title left_title, right_p.title right_title from t2
left join left_p on t2.generate_series = left_p.page_number
left join right_p on t2.generate_series = right_p.page_number_
where left_p.title is not null or right_p.title is not null 