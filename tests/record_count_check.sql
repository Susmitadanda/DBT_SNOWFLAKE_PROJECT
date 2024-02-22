{% set expected_counts = { 'customer': 50 ,'orders' : 250 } %}

--Test the count ---

{% for table,expected_count in expected_counts.items()  %}

    SELECT '{{ table }}'  as table_name,
            (SELECT COUNT(*) FROM {{ source("landing",table)}}) as record_count,
            {{ expected_count }} as expected_count
    WHERE (SELECT COUNT(*) FROM {{ source("landing",table)}}) < {{expected_count}}

{% if not loop.last %} UNION ALL {% endif %}

{% endfor %}