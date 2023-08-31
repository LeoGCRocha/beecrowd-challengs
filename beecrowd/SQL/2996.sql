WITH pre_table AS (
	SELECT year, name as sender, id_user_receiver as receiver
	FROM users u
	INNER JOIN packages p ON u.id = p.id_user_sender
	WHERE (year = 2015 or color = 'blue') AND
		(u.address <> 'Taiwan' )
	ORDER BY year DESC
)
SELECT pre.year, pre.sender, u.name as receiver
FROM pre_table pre
INNER JOIN users u
ON pre.receiver = u.id
WHERE u.address <> 'Taiwan'
