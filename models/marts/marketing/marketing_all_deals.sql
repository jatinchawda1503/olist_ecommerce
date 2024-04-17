WITH marketing_deals AS (
    SELECT * FROM {{ ref('stg_marketing_qualified_leads') }}
),
closed_deals AS (
    SELECT
        mql_id
    FROM {{ ref('stg_closed_deals') }}
),
final AS (
    SELECT
        marketing_deals.*,
        case when closed_deals.mql_id is not null then 'yes' else 'no' end as is_closed
    FROM marketing_deals
    LEFT JOIN closed_deals ON marketing_deals.mql_id = closed_deals.mql_id
)
SELECT * FROM final
