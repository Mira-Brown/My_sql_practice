-- ============================================================
-- CAPSTONE — Chapter 4: Working with Dates and Timestamps
-- ============================================================
-- Engine: PostgreSQL — psql -d eda
--
-- Scenario: Build a monthly operations dashboard for evanston311 requests.
--
-- Requirements:
--   1. Produce ONE row per month across the full data range — including months
--      with zero requests (use generate_series + LEFT JOIN).
--   2. Per month report:
--        - requests_created  = count of requests created that month
--        - avg_completion    = avg(date_completed - date_created) for requests
--                              created that month (completed only)
--        - pct_completed     = share of that month's requests that are completed
--   3. Order by month ascending.
-- ============================================================

-- Reference query:
SELECT months.month,
       count(e.id)                                              AS requests_created,
       avg(e.date_completed - e.date_created)
           FILTER (WHERE e.date_completed IS NOT NULL)          AS avg_completion,
       round(100.0 * count(e.date_completed) / nullif(count(e.id), 0), 1)
                                                                AS pct_completed
FROM (SELECT generate_series(
               date_trunc('month', (SELECT min(date_created) FROM evanston311)),
               date_trunc('month', (SELECT max(date_created) FROM evanston311)),
               '1 month') AS month) AS months
LEFT JOIN evanston311 AS e
       ON date_trunc('month', e.date_created) = months.month
GROUP BY months.month
ORDER BY months.month;
