 /* Top Percentile Fraud

We want to identify the most suspicious claims in each state. We'll consider the top 5 percentile of claims with the highest fraud scores in each state as potentially fraudulent.

Your output should include the policy number, state, claim cost, and fraud score.

claim_cost:bigint
fraud_score:double precision
policy_num:text
state:text
 */

with ranked_table as (select 
    *,
    percent_rank() over(partition by state order by fraud_score desc) as percentile_rank -- trick here is to give the desc in the partition by to avoid further issues
from fraud_score)
SELECT policy_num,
       state,
       claim_cost,
       fraud_score
FROM ranked_table
WHERE percentile_rank <= .05