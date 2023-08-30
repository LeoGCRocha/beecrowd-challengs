-- Cria a tabela 'categories'
CREATE TABLE categories (
    id numeric PRIMARY KEY,
    name character varying(255)
);

-- Cria a tabela 'products'
CREATE TABLE products (
    id numeric PRIMARY KEY,
    name character varying(255),
    amount numeric,
    price numeric,
    id_categories numeric REFERENCES categories(id)
);

-- Inserções na tabela 'categories'
INSERT INTO categories (id, name) VALUES
    (1, 'Superior'),
    (2, 'Super Luxury'),
    (3, 'Modern'),
    (4, 'Nerd'),
    (5, 'Infantile'),
    (6, 'Robust'),
    (9, 'Wood');

-- Inserções na tabela 'products'
INSERT INTO products (id, name, amount, price, id_categories) VALUES
    (1, 'Blue Chair', 30, 300.00, 9),
    (2, 'Red Chair', 200, 2150.00, 2),
    (3, 'Disney Wardrobe', 400, 829.50, 4),
    (4, 'Blue Toaster', 20, 9.90, 3),
    (5, 'Solar Panel', 30, 3000.25, 4);

-- bee2623
SELECT products.name, categories.name FROM
products
INNER JOIN categories ON products.id_categories = categories.id
WHERE products.amount > 100 AND (categories.id = ANY(ARRAY[1,2,3,6,9]))
ORDER BY categories.id ASC
