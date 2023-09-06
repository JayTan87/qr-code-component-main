USE codeup_test_db;

CREATE TABLE suppliers
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100) NOT NULL,
    established INT          NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE coffees
(
    id          INT UNSIGNED  NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100)  NOT NULL,
    roast       VARCHAR(100)  NOT NULL,
    price       DECIMAL(5, 2) NOT NULL,
    supplier_id INT UNSIGNED  NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT coffee_supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES suppliers (id)
);
SHOW TABLES;
DESCRIBE coffees;

INSERT INTO suppliers (name, established)
VALUES ('Bean There, Done That Distributors', 1988),
       ('Caffeine Cartel Connections', 2005);

INSERT INTO coffees (name, roast, price, supplier_id)
VALUES ('Hazelnutty Delight', 'medium', 5.99, 2),
       ('Choco-nut Nirvana', 'light', 4.49, 1),
       ('Berry Bonanza Brew', 'dark', 4.99, 1),
       ('Caramel Bliss-presso', 'espresso', 5.99, 1),
       ('Raspberry Rhapsody Roast', 'medium', 5.49, 2),
       ('S\'more Energy Latte', 'light', 4.99, 2);

SELECT c.name AS Coffee, c.roast AS Roast, s.name AS Supplier, s.established AS "Established In"
FROM coffees AS c
         JOIN suppliers AS s
              ON c.supplier_id = s.id
ORDER BY s.name, c.name;

CREATE TABLE roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');
INSERT INTO roles (name)
VALUES ('author');
INSERT INTO roles (name)
VALUES ('reviewer');
INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', null),
       ('mike', 'mike@example.com', null);

SELECT users.name as User, roles.name as Role
FROM users
         JOIN roles ON users.role_id = roles.id;

SELECT users.name as User, roles.name as Role
FROM users
         LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name as User, roles.name as Role
FROM users
         RIGHT JOIN roles ON users.role_id = roles.id;

CREATE TABLE shops
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE coffees_shops (
    coffee_id INT UNSIGNED NOT NULL,
    shop_id INT UNSIGNED NOT NULL,
    CONSTRAINT coffees_shops_coffee_id_fk FOREIGN KEY (coffee_id) REFERENCES coffees (id),
    CONSTRAINT coffees_shops_shop_id_fk FOREIGN KEY (shop_id) REFERENCES shops (id)
);
INSERT INTO shops (name, address)
VALUES ('Steve\'s Coffee Spot', '123 Cool Ave'),
       ('Bean Me Up Coffee', '124 Cool Ave');

INSERT INTO coffees_shops (coffee_id, shop_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (5, 1),
       (6, 1),
       (1, 2),
       (3, 2),
       (6, 2)
;

SELECT c.name AS Coffee, s.name AS Shop
FROM shops s
JOIN coffees_shops cs
    ON s.id = cs.shop_id
JOIN coffees c
    ON cs.coffee_id = c.id