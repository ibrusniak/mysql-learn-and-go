
USE dbtest0;

DROP TABLE IF EXISTS
    warehouses,
    products,
    leftoversofgoods;

CREATE TABLE warehouses (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(150),
    PRIMARY KEY (id)
);

CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(150),
    PRIMARY KEY (id)
);

CREATE TABLE leftoversofgoods (
    warehouse INT NOT NULL,
    product INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (warehouse) REFERENCES warehouses (id) ON DELETE NO ACTION,
    FOREIGN KEY (product) REFERENCES products (id) ON DELETE NO ACTION,
    PRIMARY KEY (warehouse, product)
);

INSERT INTO products (title)
VALUES
    ("Ryzen 5 3600"),
    ("Ryzen 5 5600X"),
    ("Ryzen 5 5600G"),
    ("Ryzen 7 3700X"),
    ("Ryzen 7 5800X"),
    ("Core i5-10400F"),
    ("Ryzen 7 5700G");

INSERT INTO warehouses (title)
VALUES
    ("First warehouse"),
    ("City store 1"),
    ("My shelf above computer");

INSERT INTO leftoversofgoods (warehouse, product, quantity)
VALUES
    (1, 7, 10),
    (2, 7, 20),
    (1, 5, 10);

# Products without stock
SELECT
    p.id product,
    p.title title
FROM
    products p
    LEFT JOIN
    leftoversofgoods l ON p.id = l.product
WHERE
    l.product IS NULL
ORDER BY
    p.id;

SELECT
    *
FROM
    products p CROSS JOIN leftoversofgoods l ON TRUE;
;
