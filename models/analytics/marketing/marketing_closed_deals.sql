With marketing_seller as (
    SELECT
    *
    from {{ ref("stg_closed_deals") }}
),
sellers as (
    SELECT * from {{ ref('stg_sellers') }}
),
final as (
    SELECT
        marketing_seller.*,
        sellers.*
    FROM marketing_seller
    LEFT JOIN sellers
    ON marketing_seller.seller_id = sellers.seller_id
    WHERE marketing_seller.seller_id IS NOT NULL
)
SELECT * from final