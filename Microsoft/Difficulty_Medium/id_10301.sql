with t1 as (select project_id, count(distinct emp_id) n_emp from ms_emp_projects group by project_id)
select title, round(budget/n_emp::numeric, 0) as budget_per_emp from ms_projects left join t1 on ms_projects.id = t1.project_id
where budget/n_emp is not null
order by budget_per_emp desc