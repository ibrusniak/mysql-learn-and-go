
SELECT FIELD('A', 'D', 'F', 'A', 'C', '4', 'B', 'B');

# NULL can not be compared normally with '=', only 'IS NULL'
SELECT FIELD(NULL, FALSE, TRUE, FALSE, '2', 200, NULL, 0);

SELECT
	FIELD("STRING VALUE",
		"2", '200', 20, TRUE, "STRING VALUE", NULL);
