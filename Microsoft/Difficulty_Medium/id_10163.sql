select product_name,n_product_name  from (select max(excel_sql_transaction_data.product_id) product_id, product_name, count(product_name) n_product_name
from excel_sql_transaction_data left join excel_sql_inventory_data 
on excel_sql_transaction_data.product_id = excel_sql_inventory_data.product_id
group by product_name) order by product_id