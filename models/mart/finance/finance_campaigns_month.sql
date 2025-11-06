select 
    extract(month from date_date) as datemonth
    ,round(sum(ads_margin),2) as ads_margin
    ,round(sum(average_basket),2) as average_basket
    ,round(sum(operational_margin),2) as operational_margin
    ,sum(ads_cost) as ads_cost
    ,sum(impressions) as impressions
    ,sum(clicks) as clicks 
    ,sum(total_products_sold) as quantity 
    ,round(sum(revenue),2) as revenue
    ,round(sum(purchase_cost),2) as purchase_cost
    ,round(sum(margin),2) as margin
    ,round(sum(shipping_fees),2) as shipping_fees
    ,round(sum(total_log_costs),2) as total_log_costs
    ,sum(shipping_cost) as shipping_cost
from {{ ref('finance_campaigns_day') }}

group by datemonth

order by datemonth desc