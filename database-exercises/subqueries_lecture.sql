USE codeup_test_db;

SELECT name
FROM suppliers
WHERE id IN
      (
        SELECT supplier_id
            FROM coffees
            WHERE name = 'Berry Bonanza Brew'
    );

SELECT s.name
FROM suppliers s
    JOIN coffees c
        ON s.id = c.supplier_id
WHERE c.name = 'Berry Bonanza Brew';

SELECT name, price
FROM coffees
WHERE id IN (
    SELECT coffee_id
    FROM coffees_shops
    WHERE shop_id IN (
        SELECT id
        FROM shops
        WHERE name = 'Bean Me Up Coffee'
        )
    );
