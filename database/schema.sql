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
