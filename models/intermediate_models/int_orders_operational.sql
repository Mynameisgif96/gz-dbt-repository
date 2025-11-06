with orders_ship as (
select 
    orders_id,
    date_date,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    logcost,
    ship_cost,
    quantity

from {{ ref('int_orders_margin') }}
join {{ ref('stg_raw__ship') }}
using (orders_id)
)

select 
    orders_id,
    date_date,
    round(sum((margin + shipping_fee) - (logcost - ship_cost)),2) as operational_margin,
    sum(quantity) as quantity,
    sum(revenue) as revenue,
    sum(margin) as margin,
    sum(purchase_cost) as purchase_cost,
    sum(ship_cost) as shipping_cost,
    sum(shipping_fee) as shipping_fee,
    sum(logcost) as logcost
    
from orders_ship

group by orders_id,date_date

order by date_date desc