with sales_product as(
select 
    date_date,
    orders_id,
    products_id,
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
    products_id,
    quantity,
    revenue,
    purchase_cost,
    round((revenue - purchase_cost),2) as margin,
    round({{ margin_percent( 'revenue', 'purchase_cost')}} *100, 2) as margin_percent
from sales_product