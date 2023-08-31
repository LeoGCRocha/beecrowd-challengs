SELECT l.name, round((omega * 1.618),3) as "The N Factor"
FROM life_registry l
INNER JOIN dimensions d
ON d.id = l.dimensions_id
WHERE (d.name = 'C875' OR d.name='C774') AND
	LEFT(l.name, 7) = 'Richard'
