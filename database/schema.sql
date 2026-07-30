/* 
=====================================================
Pharamacy Inventory System
Data Schema

Author:  Benefits2PointOh
Project: Pharmacy Inventory Management System
Version: 1.0
=====================================================
*/

DROP DATABASE IF EXISTS pharmacy_inventory_management_system;

CREATE DATABASE pharmacy_inventory_management_system;

USE pharmacy_inventory_management_system;

-- ROLES TABLE
CREATE TABLE roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE
);
-- INSERT
INSERT INTO roles (role_name)
VALUES
('Administrator'),
('Pharmacist'),
('Cashier');

-- USERS TABLE
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,

    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,

    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(100),
    phone VARCHAR(20),

    role_id INT NOT NULL,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_users_roles
        FOREIGN KEY (role_id)
        REFERENCES roles(role_id)
);

-- CATEGORIES TABLE
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,

    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);
-- INSERT DEFAULT CAT
INSERT INTO categories (category_name, description)
VALUES
('Pain Relief', 'Pain relief medications'),
('Antibiotics', 'Prescription antibiotics'),
('Cold & Flu', 'Cold and flu medications'),
('Vitamins', 'Vitamin supplements'),
('Allergy', 'Allergy medications'),
('First Aid', 'First aid supplies'),
('Digestive Health', 'Digestive system medications'),
('Skin Care', 'Creams, ointments and skin treatments');

-- SUPPLIERS TABLE
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,

    company_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),

    phone VARCHAR(20),
    email VARCHAR(100),
    website VARCHAR(100),

    address VARCHAR(255),

    is_active BOOLEAN DEFAULT TRUE,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);
-- INSSERT DEFAULT SUPPLIERS
INSERT INTO suppliers
(
    company_name,
    contact_person,
    phone,
    email,
    website,
    address
)
VALUES
(
'Dis-Chem Distribution',
'John Smith',
'0111111111',
'orders@dischem.co.za',
'www.dischem.co.za',
'Johannesburg'
),
(
'Clicks Distribution',
'Jane Brown',
'0212222222',
'sales@clicks.co.za',
'www.clicks.co.za',
'Cape Town'
),
(
'Pharma Wholesale',
'David Jones',
'0313333333',
'info@pharma.co.za',
'www.pharma.co.za',
'Durban'
);

-- MEDS TABLE
CREATE TABLE medicines (

    medicine_id INT AUTO_INCREMENT PRIMARY KEY,

    medicine_code VARCHAR(20) NOT NULL UNIQUE,

    medicine_name VARCHAR(100) NOT NULL,

    brand VARCHAR(100),

    category_id INT NOT NULL,

    supplier_id INT NOT NULL,

    barcode VARCHAR(50),

    dosage VARCHAR(50),

    unit VARCHAR(30),

    batch_number VARCHAR(50),

    expiry_date DATE NOT NULL,

    quantity_in_stock INT NOT NULL DEFAULT 0,

    reorder_level INT NOT NULL DEFAULT 10,

    cost_price DECIMAL(10,2) NOT NULL,

    selling_price DECIMAL(10,2) NOT NULL,

    is_active BOOLEAN DEFAULT TRUE,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_medicine_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id),

    CONSTRAINT fk_medicine_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id)
);
-- INSERT DEFAULT MEDS
INSERT INTO medicines
(
medicine_code,
medicine_name,
brand,
category_id,
supplier_id,
barcode,
dosage,
unit,
batch_number,
expiry_date,
quantity_in_stock,
reorder_level,
cost_price,
selling_price
)
VALUES
(
'MED-0001',
'Paracetamol',
'Panado',
1,
1,
'6001234567890',
'500mg',
'Tablets',
'B001',
'2028-12-31',
150,
20,
2.50,
5.99
),
(
'MED-0002',
'Amoxicillin',
'Adco',
2,
3,
'6001234567891',
'250mg',
'Capsules',
'A201',
'2027-08-30',
75,
15,
12.00,
21.99
),
(
'MED-0003',
'Vitamin C',
'Centrum',
4,
2,
'6001234567892',
'1000mg',
'Tablets',
'V500',
'2029-01-15',
200,
30,
6.50,
12.99
);

-- CUSTOMERS TABLE
CREATE TABLE customers (

    customer_id INT AUTO_INCREMENT PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    phone VARCHAR(20),

    email VARCHAR(100),

    loyalty_points INT DEFAULT 0,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);
-- INSETRT DEFAULT CUSTOMERS
INSERT INTO customers
(
    first_name,
    last_name,
    phone,
    email
)
VALUES
(
'John',
'Doe',
'0821234567',
'john@example.com'
),
(
'Mary',
'Smith',
'0839876543',
'mary@example.com'
);

-- SALES TABLE
CREATE TABLE sales (

    sale_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NULL,
-- Not every customer wants to register, but the cashier should still be able to complete a sale.

    user_id INT NOT NULL,

    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    total_amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_sales_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_sales_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);

-- SALE ITEMS TABLE
CREATE TABLE sale_items (

    sale_item_id INT AUTO_INCREMENT PRIMARY KEY,

    sale_id INT NOT NULL,

    medicine_id INT NOT NULL,

    quantity INT NOT NULL,

    unit_price DECIMAL(10,2) NOT NULL,

    line_total DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_saleitems_sale
        FOREIGN KEY (sale_id)
        REFERENCES sales(sale_id),

    CONSTRAINT fk_saleitems_medicine
        FOREIGN KEY (medicine_id)
        REFERENCES medicines(medicine_id)
);

-- CEATE INDEXES TO MAKE SEARCHING EASIER
CREATE INDEX idx_username
ON users(username);

CREATE INDEX idx_medicine_name
ON medicines(medicine_name);

CREATE INDEX idx_medicine_code
ON medicines(medicine_code);

CREATE INDEX idx_barcode
ON medicines(barcode);

CREATE INDEX idx_supplier
ON medicines(supplier_id);

CREATE INDEX idx_category
ON medicines(category_id);

CREATE INDEX idx_sale_date
ON sales(sale_date);

CREATE INDEX idx_customer
ON sales(customer_id);

CREATE INDEX idx_expiry
ON medicines(expiry_date);

/*
-- TESTING, SHOULD NOT HAVE FK (FOREIGN KEY) ERROR

SHOW TABLES;

SELECT * FROM roles;
SELECT * FROM categories;
SELECT * FROM suppliers;
SELECT * FROM medicines;
SELECT * FROM customers;
*/