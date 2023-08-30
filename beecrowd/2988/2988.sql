-- teams table
CREATE TABLE teams(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

-- matches table
CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team_1 int,
    team_2 int,
    team_1_goals integer,
    team_2_goals integer,
    CONSTRAINT fk_team_1
        FOREIGN KEY (team_1)
            REFERENCES teams (id),
    CONSTRAINT fk_team_2
        FOREIGN KEY (team_2)
            REFERENCES teams (id)
);

-- inserts
INSERT INTO teams (id, name) VALUES (1, 'CEARA');
INSERT INTO teams (id, name) VALUES (2, 'FORTALEZA');
INSERT INTO teams (id, name) VALUES (3, 'GUARANY DE SOBRAL');
INSERT INTO teams (id, name) VALUES (4, 'FLORESTA');

-- championship results
INSERT INTO matches (id, team_1, team_2, team_1_goals, team_2_goals) VALUES (1, 4, 1, 0, 4);
INSERT INTO matches (id, team_1, team_2, team_1_goals, team_2_goals) VALUES (2, 3, 2, 0, 1);
INSERT INTO matches (id, team_1, team_2, team_1_goals, team_2_goals) VALUES (3, 1, 3, 3, 0);
INSERT INTO matches (id, team_1, team_2, team_1_goals, team_2_goals) VALUES (4, 3, 4, 0, 1);
INSERT INTO matches (id, team_1, team_2, team_1_goals, team_2_goals) VALUES (5, 1, 2, 0, 0);
INSERT INTO matches (id, team_1, team_2, team_1_goals, team_2_goals) VALUES (6, 2, 4, 2, 1);

-- bee crowd 2988
-- part(1)
SELECT t.name, count(*) as matches
FROM 
teams t
-- left because if doesnt exist any matches team still appears
LEFT JOIN 
matches m ON t.id = m.team_1 OR t.id = m.team_2
GROUP BY t.id;

-- part(2)
SELECT t.name, 
	   	count(*) as matches,
		-- number of victories
		SUM(CASE WHEN t.id = m.team_1 AND m.team_1_goals > m.team_2_goals THEN 1
			WHEN t.id = m.team_2 AND m.team_2_goals > m.team_1_goals THEN 1
			ELSE 0 END) as victories
FROM 
teams t
LEFT JOIN 
matches m ON t.id = m.team_1 OR t.id = m.team_2
GROUP BY t.id;

-- part(3)
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
