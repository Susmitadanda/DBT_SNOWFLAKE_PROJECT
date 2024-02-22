select orderid 
from {{ ref('orders_stg')}}
where totalprice<0