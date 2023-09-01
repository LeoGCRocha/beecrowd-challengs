SELECT p.id, p.name
FROM products p
INNER JOIN categories c
ON p.id_categories = c.id
WHERE LEFT(c.name, 5) = 'super'
