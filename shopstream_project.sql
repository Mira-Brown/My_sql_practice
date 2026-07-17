-- Q1 — Warm-up: size up the data.
SELECT COUNT(*)                   AS total_events,
       COUNT(DISTINCT user_id)     AS distict_users,
       COUNT(DISTINCT product_id)  AS distict_prod,
	   COUNT(*) FILTER (WHERE event_type = 'purchase') AS events_purchased
FROM events;

-- Q2 — Marketing: which brands get eyeballs?
SELECT brand,
       COUNT(*) AS view_count
FROM events
WHERE event_type = 'view'
  AND brand IS NOT NULL
GROUP BY brand
HAVING COUNT(*) > 50000
ORDER BY view_count DESC;

-- Q3 — Growth: the top-line funnel.
SELECT
    SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END)     AS total_views,
    SUM(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END)     AS total_carts,
    SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS total_purchases,
    ROUND(
        100.0 * SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END), 0)
    , 2) AS  view_purchase_conversion_rate
FROM events;

-- Q4 — Merchandising: revenue by category.
SELECT category_code,
       COUNT(*)              AS num_of_purchases,
       ROUND(AVG(price), 2)  AS avg_price,
       ROUND(SUM(price), 2)  AS total_revenue
FROM events
WHERE event_type = 'purchase'
  AND category_code IS NOT NULL
GROUP BY category_code
ORDER BY total_revenue DESC
LIMIT 10;

-- Q5 — Growth: find the hesitant shoppers.
SELECT user_id,
	   COUNT(*) AS cart_events
FROM events
WHERE event_type = 'cart'
AND user_id NOT IN 
    (SELECT user_id 
	FROM events
	WHERE event_type = 'purchase'
	AND user_id IS NOT NULL)
GROUP BY user_id
ORDER BY cart_events DESC
LIMIT 20;

-- Q6 — Merchandising: interest vs. action, by product
SELECT COUNT(*)     AS viewed_never_purchased
FROM(
     SELECT product_id FROM events WHERE event_type = 'view'
EXCEPT 
     SELECT product_id FROM events WHERE event_type = 'purchase'
);

-- viewed and purchased

SELECT COUNT(*)     AS viewed_and_purchased
FROM(
     SELECT product_id FROM events WHERE event_type = 'view'
INTERSECT 
     SELECT product_id FROM events WHERE event_type = 'purchase'
);

-- Q7 — Merchandising: the best "look-to-book" products
WITH view_sessions AS (
    SELECT product_id,
           COUNT(DISTINCT user_session) AS view_session_count
    FROM events
    WHERE event_type = 'view'
    GROUP BY product_id),
purchase_sessions AS (
    SELECT product_id,
           COUNT(DISTINCT user_session) AS purchase_session_count
    FROM events
    WHERE event_type = 'purchase'
    GROUP BY product_id)
SELECT
    v.product_id,
    v.view_session_count,
    COALESCE(p.purchase_session_count, 0) AS purchase_session_count,
    ROUND(100.0 * COALESCE(p.purchase_session_count, 0) / 
	v.view_session_count, 2) AS conversion_pct
FROM view_sessions AS v
LEFT JOIN purchase_sessions AS p ON v.product_id = p.product_id
WHERE v.view_session_count >= 500
ORDER BY conversion_pct DESC
LIMIT 15;

-- Q8 — Merchandising: top products within each category.
WITH product_revenue AS (
     SELECT category_code,
            product_id,
            SUM(price) AS revenue
     FROM events
     WHERE event_type = 'purchase'
      AND category_code IS NOT NULL
     GROUP BY category_code, product_id),
ranked AS (
    SELECT category_code,
           product_id,
           revenue,
     RANK() OVER (PARTITION BY category_code ORDER BY revenue DESC) AS revenue_rank
FROM product_revenue)
SELECT category_code,
       product_id,
       revenue,
       revenue_rank
FROM ranked
WHERE revenue_rank <= 3
ORDER BY category_code, revenue_rank;

-- Q9 — Growth: the daily revenue trend.
WITH daily_revenue AS (
    SELECT event_time::date AS purchase_day,
           SUM(price) AS daily_total
    FROM events
    WHERE event_type = 'purchase'
    GROUP BY event_time::date)
SELECT
    purchase_day,
    daily_total,
    SUM(daily_total)
	OVER (ORDER BY purchase_day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
	AS cumulative_revenue,
    ROUND(AVG(daily_total) 
	OVER (ORDER BY purchase_day ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
    , 2) AS moving_avg_3day
FROM daily_revenue
ORDER BY purchase_day;

-- Q10 — The exec summary: a pivoted event breakdown
WITH category_counts AS (
    SELECT category_code,
           COUNT(*) FILTER (WHERE event_type = 'view')     AS views,
           COUNT(*) FILTER (WHERE event_type = 'cart')     AS carts,
           COUNT(*) FILTER (WHERE event_type = 'purchase') AS purchases,
           COUNT(*)                                         AS total_events
    FROM events
    WHERE category_code IS NOT NULL
    GROUP BY category_code
    HAVING COUNT(*) > 100000
)
SELECT
    category_code,
    SUM(views)     AS views,
    SUM(carts)     AS carts,
    SUM(purchases) AS purchases
FROM category_counts
GROUP BY ROLLUP(category_code)
ORDER BY category_code NULLS LAST;
