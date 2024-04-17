with closed_deals as(
    SELECT
        mql_id,
        seller_id,
        sdr_id,
        sr_id,
        won_date,
        case when business_segment is null or business_segment = '' then 'unknown' else business_segment end,
        case when lead_type is null or lead_type = '' then 'unknown' else lead_type end,
        case when lead_behaviour_profile is null or lead_behaviour_profile = '' then 'unknown' else lead_behaviour_profile end,
        case when business_type is null or business_type = '' then 'unknown' else business_type end
    from {{ source('olist_marketing','closed_deals') }}
),
final as (
    SELECT * from closed_deals
)
SELECT * FROM final