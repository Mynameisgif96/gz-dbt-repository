--with orders_ship as (
select 
    orders_id,
    date_date,
    round(sum((margin + shipping_fee) - (logcost - ship_cost)),2) as operational_margin,
    sum(quantity) as quantity

from {{ ref('int_orders_margin') }}
join {{ ref('stg_raw__ship') }}
using (orders_id)

group by orders_id,date_date

order by date_date desc