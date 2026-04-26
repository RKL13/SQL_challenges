-- PostGre Execution time: 0.00612 seconds -- Scalable -- Clear

SELECT ABS(MAX(salary) FILTER (WHERE department = 'marketing') - MAX(salary) FILTER (WHERE department = 'engineering'))
FROM db_employee
LEFT JOIN db_dept ON db_employee.department_id = db_dept.id


-- MySQL Execution time: 0.00490 seconds -- Low Scalability

with cte as (select department, max(salary) as mx_salary
             from db_employee
             left join db_dept on db_employee.department_id = db_dept.id
             where department in ('marketing', 'engineering')
             group by department)

select abs(max(mx_salary) - min(mx_salary)) as abs_diff from cte

-- MySQL Execution time: 0.00451 seconds -- Scalable -- Clear BEST

select abs(max(case when department = 'marketing' then salary end) - max(case when department = 'engineering' then salary end)) as abs_diff
from db_employee
left join db_dept on db_employee.department_id = db_dept.id