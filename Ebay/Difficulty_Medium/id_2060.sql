with t1 as (select *,
count(*) over (partition by department_name) n_dpt
from az_employees
order by n_dpt desc)
select first_name, last_name
from t1
where n_dpt = (select max(n_dpt) from t1)
and position ilike '%manager%'