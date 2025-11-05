with sales_product as(
select 
    date_date,
    orders_id,
    quantity * purchase_price as purchase_cost,
    revenue,
    quantity

from {{ ref('stg_raw__sales') }}
join {{ ref('stg_raw__product') }}
using (products_id)
)

select 
    date_date,
    orders_id,
    purchase_cost,
    round((revenue - purchase_cost),2) as margin
from sales_product