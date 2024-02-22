{{
    config(materialized='incremental',
            unique_key='orderid')
}}


select
    orderid,
    orderdate,
    customerid,
    storeid,
    totalprice,
    status as statuscd,
    case
        when status = 'O'
        then 'Completed'
        when status = 'P'
        then 'In Progress'
        when status = 'F'
        then 'Cancelled'
        else null
    end as statusdesc,
    updated_at,
    current_date as dbt_updated_at
   
from {{ source('landing','orders') }}


{% if is_incremental() %}

where updated_at>=(select max(dbt_updated_at) from {{this}})

{% endif %}

