-- MySQL Execution time: 0.00442 seconds

select first_name
from employee
where target > 150 and department = 'Sales' 
order by first_name desc