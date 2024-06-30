CREATE DATABASE inventoryDB;
USE inventoryDB;
CREATE TABLE products (name VARCHAR(255), description VARCHAR(255), price DECIMAL(65,2), quantity INT(255), category VARCHAR(255));
INSERT INTO products VALUES 
    ('pencil', 'used to write', 10, 100, 'stationery'), 
    ('trimmer', 'used to shave', 999.99, 10, 'electronics'), 
    ('camera', 'used to take photo', 4999, 5, 'electronics'),
    ('eraser', 'used to erase', 5, 20, 'stationery'),
    ('toothbrush', 'used to brush', 30, 10, 'essentials');

-- Retrieve all products
SELECT * FROM products;

-- Retrieve products with price less than 50
SELECT * FROM products WHERE price < 50;

-- Retrieve products with quantity greater than 10
SELECT * FROM products WHERE quantity > 10;

-- Update price of camera
UPDATE products SET price = 6000 WHERE name = 'camera';

-- Delete trimmer
DELETE FROM products WHERE name = 'trimmer';
