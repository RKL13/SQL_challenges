select customer_id, n_mobile
from (select *, 
            dense_rank() over (order by n_mobile)
from (select customer_id,
             sum(case when client_id = 'mobile' then 1 else 0 end) n_mobile
      from fact_events
      group by customer_id)
      )
where dense_rank <= 2