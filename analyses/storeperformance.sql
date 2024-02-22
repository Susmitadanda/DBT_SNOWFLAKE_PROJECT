select 
    storeid,
    sum(totalprice) as ActualSales,
    salestarget as TargetSales
from 
    {{ ref("orders_stg") }} o
join 
    {{ ref("salestarget") }} star on star.storeid = o.storeid
group by storeid