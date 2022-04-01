CREATE TABLE pizzas(
id INT,
stock INT CHECK (stock >= 0.00),
costo DECIMAL,
nombre VARCHAR(25),
PRIMARY KEY(id)
);
CREATE TABLE ventas(
cliente VARCHAR(20),
fecha DATE,
monto DECIMAL,
pizza INT,
FOREIGN KEY (pizza) REFERENCES pizzas(id)
);

INSERT INTO pizzas (id, stock, costo, nombre) VALUES (1, 0, 12000,
'Uhlalá');

BEGIN;
INSERT INTO pizzas (id, stock, costo, nombre) VALUES (2, 2, 15000,
'Jamón a todo dar');
COMMIT;

BEGIN;
INSERT INTO ventas (cliente, fecha, monto, pizza) VALUES ('Dexter
Gonzalez', '2020-02-02', 12000, 1);
UPDATE pizzas SET stock = stock - 1 WHERE id = 1;
COMMIT;


BEGIN;
INSERT INTO ventas (cliente, fecha, monto, pizza) VALUES ('Juan Bravo',
'2020-02-02', 15000, 2);
UPDATE pizzas SET stock = stock - 1 WHERE id = 2;
SAVEPOINT checkpoint;
INSERT INTO ventas (cliente, fecha, monto, pizza) VALUES ('Utonio
Ramirez', '2020-02-02', 12000, 1);
UPDATE pizzas SET stock = stock - 1 WHERE id = 1;


-- Acá recibirás un error por intentar rebajar el stock de una pizza
cuyo stock es 0
ROLLBACK TO checkpoint;

pg_dump -U postgres pizzeria > pizzeria.sql

DROP DATABASE pizzeria;


CREATE DATABASE pizzeria ;
CREATE DATABASE pizzeria ;
$ sudo su - postgres
$ psql -U postgres pizzeria < pizzeria.sql

