CREATE DATABASE IF NOT EXISTS lesson_2;
USE lesson_2;
DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`employee_id` CHAR(3),
`amount` DOUBLE,
`order_status` VARCHAR(10)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES 
("e03",15.00, "OPEN"),
("e01",25.50, "OPEN"),
("e05",100.70, "CLOSED"),
("e02",22.18, "OPEN"),
("e04",9.50, "CANCELLED");

ALTER TABLE orders
ADD full_order_status VARCHAR(45);
UPDATE orders
SET full_order_status =  CASE
	WHEN order_status = "OPEN"
		THEN "Order is in open state"
	WHEN order_status = "CLOSED"
		THEN "Order is closed"
	WHEN order_status = "CANCELLED"
		THEN "Order is cancelled"
	ELSE "something wrong"
END;
SELECT id, employee_id, amount, order_status, full_order_status FROM orders;


