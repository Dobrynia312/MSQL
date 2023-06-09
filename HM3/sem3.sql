# 1. Создание БД
CREATE DATABASE IF NOT EXISTS lesson_3;

USE lesson_3;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    post VARCHAR(45) NOT NULL,
    seniority INT, 
    salary DECIMAL(8,2), -- 100 000 . 00
    age INT
);
-- 4. Заполнение таблицы данными
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
("Петр", "Петров", "Начальник", 8, 70000, 30),
  ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
  ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
  ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
  ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
  ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
  ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
  ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
  ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
  ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
  ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
  ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
  ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT * FROM staff;

-- ORDER BY - сортировка 
SELECT 
	salary,
    id,
    CONCAT(firstname, " ", lastname) AS fullname -- "1" + " " + "1" = "1 1"
FROM staff
ORDER BY salary DESC; 

SELECT 
	salary,
    id,
    CONCAT(firstname, " ", lastname) AS fullname -- "1" + " " + "1" = "1 1"
FROM staff
ORDER BY salary;

SELECT 
	salary,
    id,
    CONCAT(firstname, " ", lastname) AS fullname -- "1" + " " + "1" = "1 1"
FROM staff
ORDER BY salary DESC
LIMIT 5; 

SELECT
SUM(salary),
post
FROM staff
GROUP BY(post);

SELECT
	post,
    COUNT(id)
FROM staff
WHERE age BETWEEN 24 and 49
GROUP BY post
HAVING post = 'Рабочий';

SELECT
COUNT(DISTINCT post) AS 'post'
FROM staff;

SELECT 
post,
AVG(age)
FROM staff
GROUP BY post
HAVING AVG(age) > 30;

