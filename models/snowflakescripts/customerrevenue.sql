{{
  config(
    materialized = "table",
    transient = false
  )
}}


select
    c.customerid,
    c.customer_name,
    count(orderid) as ordercount,
    sum(totalprice) as revenue
from {{ ref("orders_stg") }} o
join {{ ref("customer_stg") }} c on c.customerid = c.customerid
group by c.customerid, c.customer_name
