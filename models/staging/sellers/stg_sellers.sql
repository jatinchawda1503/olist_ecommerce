WITH sellers as(
    SELECT 
    distinct(seller_id) as seller_id, 
    seller_zip_code_prefix,
    seller_city,
    seller_state
     FROM 
    {{ source('olist_sellers','sellers') }}
    WHERE seller_id is NOT NULL
),
final as (
    SELECT * from sellers
)
SELECT * FROM final
