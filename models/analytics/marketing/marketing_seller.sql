With marketing_seller as (
    SELECT
    *
    from {{ ref('marketing_all_deals') }}
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
    ON marketing_seller.closed_seller_id = sellers.seller_id
)

SELECT * from final