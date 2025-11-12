-- ============================================================
-- SQL MINI PROJECT : RETAIL STORE DATABASE  (SQLite Version)
-- By Aman Kumar (Career247 Data Science Track)
-- ============================================================

PRAGMA foreign_keys = ON;

-- Drop tables if they exist
DROP TABLE IF EXISTS product_reviews;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- ============================================================
-- 1️⃣ CREATE TABLES (DDL)
-- ============================================================

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    price REAL NOT NULL CHECK (price > 0),
    stock_quantity INTEGER NOT NULL DEFAULT 0,
    added_on DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status TEXT DEFAULT 'Pending',
    total_amount REAL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    item_price REAL NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount_paid REAL NOT NULL CHECK (amount_paid > 0),
    method TEXT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE product_reviews (
    review_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id INTEGER,
    customer_id INTEGER,
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ============================================================
-- 2️⃣ INSERT SAMPLE DATA (DML)
-- ============================================================

INSERT INTO customers (name, email, phone) VALUES
('Amit Sharma', 'amit@gmail.com', '9876543210'),
('Bhavna Singh', 'bhavna@gmail.com', '9988776655'),
('Chirag Patel', 'chirag@gmail.com', '9876123456'),
('Divya Mehta', 'divya@gmail.com', '9898989898'),
('Arjun Nair', 'arjun@gmail.com', '9765432109');

INSERT INTO products (name, category, price, stock_quantity) VALUES
('Smartphone', 'Electronics', 15000.00, 25),
('Laptop', 'Electronics', 55000.00, 10),
('Headphones', 'Electronics', 2500.00, 0),
('T-shirt', 'Clothing', 800.00, 100),
('Jeans', 'Clothing', 2000.00, 40),
('Microwave', 'Home Appliances', 7000.00, 15),
('Refrigerator', 'Home Appliances', 30000.00, 8);

INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, '2025-10-01', 'Shipped', 15500.00),
(2, '2025-10-02', 'Pending', 58000.00),
(3, '2025-10-03', 'Delivered', 2000.00),
(4, '2025-10-04', 'Shipped', 31000.00),
(5, '2025-10-05', 'Delivered', 9500.00);

INSERT INTO order_items (order_id, product_id, quantity, item_price) VALUES
(1, 1, 1, 15000.00),
(1, 3, 1, 2500.00),
(2, 2, 1, 55000.00),
(3, 5, 1, 2000.00),
(4, 7, 1, 30000.00),
(5, 6, 1, 7000.00),
(5, 4, 2, 800.00);

INSERT INTO payments (order_id, amount_paid, method) VALUES
(1, 15500.00, 'UPI'),
(2, 58000.00, 'Credit Card'),
(3, 2000.00, 'Cash'),
(4, 31000.00, 'UPI'),
(5, 9500.00, 'Credit Card');

INSERT INTO product_reviews (product_id, customer_id, rating, review_text) VALUES
(1, 1, 5, 'Excellent phone, good battery!'),
(2, 2, 4, 'Great laptop, slightly heavy.'),
(5, 3, 3, 'Jeans quality average.'),
(6, 5, 5, 'Microwave works perfectly.');

-- ============================================================
-- 3️⃣ LEVEL 1 to LEVEL 6 Queries
-- ============================================================

-- (All queries as previously shared remain the same)
