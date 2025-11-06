
select 
    date_date,
    count(orders_id) as nb_transactions,
    round(sum(revenue),2) as revenue,
    round(sum(quantity) / count(orders_id),2) as average_basket,
    round(sum(operational_margin),2) as operational_margin,
    round(sum(purchase_cost),2) as purchase_cost,
    round(sum(shipping_fee),2) as shipping_fees,
    round(sum(logcost),2) as total_log_costs,
    sum(quantity) as total_products_sold
from {{ ref('int_orders_operational') }}

group by date_date 

order by date_date desc

