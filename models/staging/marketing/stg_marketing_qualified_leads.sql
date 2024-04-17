with marketing_qualified_leads as(
    SELECT
        mql_id,
        first_contact_date,
        landing_page_id,
        case when origin is null or origin = '' then 'unknown' else origin end
    from {{ source('olist_marketing','marketing_qualified_leads') }}
),
final as(
    SELECT * from marketing_qualified_leads
)
SELECT * FROM final