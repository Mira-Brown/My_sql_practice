-- Lesson: Crossing into CROSS JOIN
-- See: ../../assets/cross_join.png

-- CROSS JOIN pairs every row from the left table with every row from
-- the right table — called a Cartesian product.
-- No ON clause — there is no matching condition.
-- Result rows = left table rows × right table rows.

-- Example: pair every prime minister with every monarch (small tables)
-- prime_ministers has 10 rows, monarchs has 4 rows → 10 × 4 = 40 rows

SELECT pm.prime_minister, m.monarch
FROM prime_ministers AS pm
CROSS JOIN monarchs AS m
ORDER BY pm.prime_minister;
