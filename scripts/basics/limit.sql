
SELECT
	`word`,
    `rank`
FROM
	(SELECT 'Ipsum' AS `word`, 10 AS `rank` UNION ALL
	SELECT 'is', 11 UNION ALL
	SELECT 'simply', 15 UNION ALL
	SELECT 'dummy', 9 UNION ALL
	SELECT 'text', 10 UNION ALL
	SELECT 'of', 7 UNION ALL
	SELECT 'the', 4) AS `words`
ORDER BY
	`rank` DESC;

SELECT
	`word`,
    `rank`
FROM
	(SELECT 'Ipsum' AS `word`, 10 AS `rank` UNION ALL
	SELECT 'is', 11 UNION ALL
	SELECT 'simply', 15 UNION ALL
	SELECT 'dummy', 9 UNION ALL
	SELECT 'text', 10 UNION ALL
	SELECT 'of', 7 UNION ALL
	SELECT 'the', 4) AS `words`
ORDER BY
	`rank` DESC
LIMIT 2, 3;

SELECT
	`word`,
    `rank`
FROM
	(SELECT 'Ipsum' AS `word`, 10 AS `rank` UNION ALL
	SELECT 'is', 11 UNION ALL
	SELECT 'simply', 15 UNION ALL
	SELECT 'dummy', 9 UNION ALL
	SELECT 'text', 10 UNION ALL
	SELECT 'of', 7 UNION ALL
	SELECT 'the', 4) AS `words`
ORDER BY
	`rank` DESC
LIMIT 3
OFFSET 2; # The same result as previus
