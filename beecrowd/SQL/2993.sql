SELECT amount FROM (
	SELECT amount, count(*) most_frequent_value
	FROM value_table
	GROUP BY amount
	ORDER BY most_frequent_value DESC
	LIMIT 1
) as table_value
