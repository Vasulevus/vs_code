CREATE OR REPLACE TABLE ecommerce.partition_by_day

PARTITION BY date_formatted

OPTIONS(
    DESCRIPTION = "a table partitioned by date"
) AS
SELECT DISTINCT
PARSE_DATE("%Y%m%d", date) AS date_formatted,
fullvisitorId,
FROM `data-to-insights.ecommerce.all_sessions_raw`