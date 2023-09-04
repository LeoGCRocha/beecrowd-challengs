SELECT products.name 
FROM products
INNER JOIN providers
ON providers.id = products.id_providers
WHERE amount > 10 and amount < 20 and providers.name LIKE 'P%'
