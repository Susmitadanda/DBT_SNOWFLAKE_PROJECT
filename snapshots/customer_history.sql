{% snapshot customer_history %}
{{
    config(
        target_schema='my_schema',
        unique_key='customerid',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from {{source("landing",'customer')}}

{% endsnapshot %}