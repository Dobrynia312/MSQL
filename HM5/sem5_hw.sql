CREATE DATABASE IF NOT EXISTS lesson5;
USE lesson5;
DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;
#1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE OR REPLACE VIEW cars_tablet AS
SELECT
	name, cost
FROM cars
WHERE cost < 25000;

SELECT * FROM cars_tablet;

#2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW cars_tablet AS
SELECT
	name, cost
FROM cars
WHERE cost < 30000;

SELECT * FROM cars_tablet;

#3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE OR REPLACE VIEW cars_tablet1 AS
SELECT
	name, cost
FROM cars
WHERE name = "Audi" OR name = "Skoda";

SELECT * FROM cars_tablet1;


#4. Использование функции LEAD

DROP TABLE IF EXISTS trains;
CREATE TABLE trains
(
	id INT NOT NULL PRIMARY KEY,
	train_id INT,
    station VARCHAR(45),
    station_time TIME
);
INSERT trains
VALUES
	(1,110, "San Francisco", '10:00:00'),
    (2,110, "Redwood City", '10:54:00'),
    (3,110, "Palo Alto", '11:02:00'),
    (4,110, "San Jose", '12:35:00'),
	(5,120, "San Francisco", '11:00:00'),
    (6,120, "Palo Alto", '12:49:00'), 
    (7,120, "San Jose", '13:30:00');
    
SELECT * FROM trains;
SELECT train_id, station, station_time,
LEAD(station_time, 1, 0) OVER (PARTITION BY train_id ORDER BY id)  AS 'time_to_next_station'
FROM trains;

SELECT *,
       TIMEDIFF(LEAD(station_time) OVER (PARTITION BY train_id ORDER BY id),station_time) AS 'time_to_next_station'
FROM trains
ORDER BY train_id;


