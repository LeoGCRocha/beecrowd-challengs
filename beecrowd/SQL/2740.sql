SELECT * FROM(
	SELECT CONCAT('Podium: ', team) as name 
	FROM league
	ORDER BY position ASC
	LIMIT 3
) as query1
UNION ALL
SELECT name FROM(
	SELECT * FROM(
		SELECT position, CONCAT('Demoted: ', team) as name 
		FROM league
		ORDER BY position DESC
		LIMIT 2
	) as query2 
	ORDER BY position asc
) as query3
