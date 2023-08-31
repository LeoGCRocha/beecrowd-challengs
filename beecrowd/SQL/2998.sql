WITH client_operations AS (
	SELECT 
		c.id, 
		c.name, 
		c.investment, 
		op.month, 
		op.profit, 
		SUM(op.profit) OVER(PARTITION BY c.id ORDER BY op.id), -- sum clients operations
		SUM(op.profit) OVER(PARTITION BY c.id ORDER BY op.id) - c.investment AS return -- calculate diff. about invest and earnings
	FROM clients c
	LEFT JOIN operations op
	ON c.id = op.client_id
)
SELECT client_operations.name, 
	payback_month_return.investment, 
	payback_month_return.month_of_payback,
	client_operations.return
FROM (
	SELECT DISTINCT ON(id)
		name, 
		investment, 
		month AS month_of_payback,
		return
	FROM client_operations
	WHERE return >= 0
) AS payback_month_return
INNER JOIN client_operations USING (return)
ORDER BY return DESC