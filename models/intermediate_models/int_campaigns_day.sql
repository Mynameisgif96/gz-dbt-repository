select 
    date_date
    ,sum(ads_cost) as ads_cost
    ,sum(impression) as impressions
    ,sum(click) as clicks
from {{ ref('int_campaigns') }}

GROUP BY date_date

order by date_date desc