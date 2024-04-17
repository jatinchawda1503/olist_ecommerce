SELECT
    *
FROM
    {{ source('olist_customers', 'customers')}}