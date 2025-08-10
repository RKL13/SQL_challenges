select has_bonus, count(distinct id) from (select *, bonus_amount is not null::int as has_bonus
from employee left join bonus on employee.id = bonus.worker_ref_id)
group by has_bonus