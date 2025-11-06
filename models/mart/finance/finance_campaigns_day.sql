select 
    date_date
    ,round((operational_margin - ads_cost),2) as ads_margin
    ,average_basket
    ,operational_margin
    ,ads_cost
    ,impressions
    ,clicks
    ,total_products_sold
    ,revenue
    ,purchase_cost
    ,margin
    ,shipping_fees
    ,total_log_costs
    ,shipping_cost

from {{ ref('int_campaigns_day') }}
join {{ ref('finance_days') }}
using (date_date)