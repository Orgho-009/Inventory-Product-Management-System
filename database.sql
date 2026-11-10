CREATE DATABASE IF NOT EXISTS inventory_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE inventory_db;

CREATE TABLE IF NOT EXISTS categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price >= 0.00),
    managed_by VARCHAR(60) NOT NULL,
    CONSTRAINT fk_products_category
        FOREIGN KEY (category) REFERENCES categories(category_name)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE products;
TRUNCATE TABLE categories;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO categories (category_name) VALUES
('Cargo & Joggers'),
('Drop Shoulder T-Shirt'),
('Graphic T-Shirt'),
('Polo Shirt'),
('Winter Hoodie');

INSERT INTO products (product_name, category, stock_quantity, unit_price, managed_by) VALUES
('Heavyweight Drop Shoulder Tee', 'Drop Shoulder T-Shirt', 180, 650.00, 'Orgho'),
('Acid Wash Oversized Tee', 'Drop Shoulder T-Shirt', 120, 750.00, 'Nafis'),
('Vintage Streetwear Graphic Tee', 'Graphic T-Shirt', 200, 550.00, 'Orgho'),
('Urban Typography Print Tee', 'Graphic T-Shirt', 150, 520.00, 'Siam'),
('Classic Pique Cotton Polo', 'Polo Shirt', 140, 880.00, 'Orgho'),
('Contrast Collar Tipped Polo', 'Polo Shirt', 110, 920.00, 'Nafis'),
('Fleece Lined Pullover Hoodie', 'Winter Hoodie', 85, 1450.00, 'Orgho'),
('Heavyweight Zip-Up Winter Hoodie', 'Winter Hoodie', 65, 1650.00, 'Siam'),
('Embroidered Minimalist Hoodie', 'Winter Hoodie', 75, 1550.00, 'Orgho'),
('Multi-Pocket Tactical Cargo Pant', 'Cargo & Joggers', 95, 1350.00, 'Nafis'),
('Stretch Twill Slim Joggers', 'Cargo & Joggers', 115, 1100.00, 'Orgho'),
('Relaxed Fit Ripstop Cargo', 'Cargo & Joggers', 80, 1280.00, 'Siam');
