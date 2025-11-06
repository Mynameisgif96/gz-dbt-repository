select 
    date_date
    ,paid_source
    --,campaign_key
    --,campaign_name
    ,sum(ads_cost) as ads_cost
    ,sum(impression) as impressions
    ,sum(click) as clicks
from {{ ref('int_campaigns') }}

GROUP BY date_date, paid_source

order by date_date desc