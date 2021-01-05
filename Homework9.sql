-- “Транзакции, переменные, представления” --
-- 1 задание --

START TRANSACTION;
SELECT total FROM shop.users WHERE user_id = 1;
INSERT INTO sample.users (total)

DELETE FROM shop.users

COMMIT;

-- 2 задание --

START TRANSACTION;
SELECT name FROM catalogs WHERE name.accounts = name.catalogs;
COMMIT;

-- “Хранимые процедуры и функции, триггеры" --
-- 1 задание --

DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	IF(CURTIME() BETWEEN '06:00:00' AND '12:00:00') THEN
		SELECT 'Доброе утро';
	ELSEIF(CURTIME() BETWEEN '12:00:00' AND '18:00:00') THEN
		SELECT 'Добрый день';
	ELSEIF(CURTIME() BETWEEN '18:00:00' AND '00:00:00') THEN
		SELECT 'Добрый вечер';
	ELSE
		SELECT 'Доброй ночи';
	END IF;
END //
delimiter ;

CALL hello();


-- 2 задание --

CREATE TRIGGER nullTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN

INSERT INTO products (name, description, coast, catalog_id)
VALUES (NULL, NULL, 1000, 2);

INSERT INTO products (name, description, coast, catalog_id)
VALUES ("1", NULL, 2000, 3);

INSERT INTO products (name, description, coast, catalog_id)
VALUES ("2", "+", 2000, 3);