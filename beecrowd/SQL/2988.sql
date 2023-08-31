SELECT camp.name, 
	camp.matches, 
	camp.victories, 
	camp.defeats, 
	camp.draws,
	(camp.victories * 3 + camp.draws) as score
	FROM(SELECT  t.id as id,
			t.name, 
			count(*) as matches,
			SUM(CASE WHEN t.id = m.team_1 AND m.team_1_goals > m.team_2_goals THEN 1
				WHEN t.id = m.team_2 AND m.team_2_goals > m.team_1_goals THEN 1
				ELSE 0 END) as victories,
			SUM (CASE WHEN t.id = m.team_1 AND m.team_1_goals < m.team_2_goals THEN 1
				WHEN t.id = m.team_2 AND m.team_1_goals > m.team_2_goals THEN 1
				ELSE 0 END) AS defeats,
			SUM (CASE WHEN t.id = m.team_1 AND m.team_1_goals = m.team_2_goals THEN 1
				WHEN t.id = m.team_2 AND m.team_1_goals = m.team_2_goals THEN 1
				ELSE 0 END) as draws
	FROM 
	teams t
	LEFT JOIN 
	matches m ON t.id = m.team_1 OR t.id = m.team_2
	GROUP BY t.id
)  AS camp
JOIN teams ON teams.id = camp.id
ORDER BY score DESC, camp.victories DESC;
