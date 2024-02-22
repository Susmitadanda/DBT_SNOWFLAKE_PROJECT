/* 
{{
    config(
        materialized = 'ephemeral'
    )
}}

 
ephemeral materialized does not create table/view in datawarehose 
but we want to have it in dbt for code modularity and reusability
*/


select
    customerid,
    concat(firstname, ' ', lastname) as customer_name,
    email,
    address,
    city,
    state
    zip,
    updated_at
from 
    {{ source('landing','customer') }}
