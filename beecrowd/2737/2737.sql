-- Create table
CREATE TABLE lawyers (
    register SERIAL PRIMARY KEY,
    name VARCHAR,
    customers_number INTEGER
);

-- Insert table
INSERT INTO lawyers (register, name, customers_number)
VALUES
    (1648, 'Marty M. Harrison', 5),
    (2427, 'Jonathan J. Blevins', 15),
    (3365, 'Chelsey D. Sanders', 20),
    (4153, 'Dorothy W. Ford', 16),
    (5525, 'Penny J. Cormier', 6);

-- Beecrowd 2737
SELECT name, customers_number
FROM lawyers
WHERE customers_number = (SELECT MAX(customers_number) FROM lawyers)
UNION ALL
SELECT name, customers_number
FROM lawyers
WHERE customers_number = (SELECT MIN(customers_number) FROM lawyers)
UNION ALL
SELECT 'Average' as name, round(avg(customers_number)) as customers_number
FROM lawyers;

-- Customer with mox customer numbers
SELECT name, customers_number
FROM lawyers
WHERE customers_number = (SELECT MAX(customers_number) FROM lawyers)

-- Other option
SELECT name, customers_number
FROM lawyers
ORDER BY customers_number DESC
LIMIT 1
