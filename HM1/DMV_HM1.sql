CREATE DATABASE IF NOT EXISTS lesson_1;
USE lesson_1;
DROP TABLE IF EXISTS phone;
CREATE TABLE phone
(
id INT PRIMARY KEY AUTO_INCREMENT, 
ProductName VARCHAR(45),
Manufacturer VARCHAR(45),
ProductCount INT,
Price INT
);
INSERT phone (ProductName, Manufacturer, ProductCount, Price)
VALUES
	("Iphone X", "Apple", 3, 76000),
    ("Iphone 8", "Apple", 2, 51000),
    ("Galaxy S9", "Samsung", 2, 56000),
    ("Galaxy S8", "Samsung", 1, 41000),
    ("P20 Pro", "Huawei", 5, 36000);
    
# SELECT ProductName, Manufacturer, ProductCount, Price FROM phone WHERE ProductCount > 2;
# SELECT ProductName, Manufacturer, ProductCount, Price FROM phone WHERE Manufacturer = "Samsung";
# SELECT ProductName, Manufacturer, ProductCount, Price FROM phone WHERE ProductCount * Price BETWEEN 100000 AND 145000;
# SELECT ProductName, Manufacturer, ProductCount, Price FROM phone WHERE ProductName REGEXP "Iphone";
# SELECT ProductName, Manufacturer, ProductCount, Price FROM phone WHERE ProductName REGEXP "Galaxy";
# SELECT ProductName, Manufacturer, ProductCount, Price FROM phone WHERE ProductName REGEXP '[:digit:]';
 SELECT ProductName, Manufacturer, ProductCount, Price FROM phone WHERE ProductName REGEXP '8';


    