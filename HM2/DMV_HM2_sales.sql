CREATE DATABASE IF NOT EXISTS lesson_2;
USE lesson_2;
DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`order_date` CHAR(10),
`count_product` INT
);

INSERT INTO sales (order_date, count_product)
VALUES 
(2022-01-01,156),
(2022-01-02,180),
(2022-01-03,21),
(2022-01-04,124),
(2022-01-05,341);
ALTER TABLE sales
ADD order_type VARCHAR(45);
UPDATE sales
SET order_type =  CASE
	WHEN count_product < 100
		THEN "Маленький заказ"
	WHEN count_product BETWEEN 100 and 300
		THEN "Средний заказ"
	WHEN count_product > 300
		THEN "Большой заказ"
	ELSE "something wrong"
END;
SELECT id, order_date, count_product, order_type FROM sales;


