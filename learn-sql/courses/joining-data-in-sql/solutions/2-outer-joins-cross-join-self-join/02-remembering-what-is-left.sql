-- Solution: Remembering what is LEFT

SELECT c.name AS country, p.president
FROM countries AS c
LEFT JOIN presidents AS p
    ON c.name = p.country;
