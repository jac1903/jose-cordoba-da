-- =====================================================
-- Customer Churn Analysis - Database Schema
-- Project: Customer Churn Prediction & Analysis
-- Author: Jose Cordoba
-- Date: July 2026
-- =====================================================

-- 1. Create the Database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS churn_analysis;
USE churn_analysis;

-- 2. Drop existing tables if they exist (for clean re-runs)
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customers;

-- 3. Create CUSTOMERS table (Demographics)
CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    senior_citizen TINYINT, -- 0 or 1
    partner VARCHAR(5), -- Yes or No
    dependents VARCHAR(5) -- Yes or No
);

-- 4. Create ACCOUNTS table (Billing & Contract)
CREATE TABLE accounts (
    customer_id VARCHAR(20) PRIMARY KEY,
    tenure INT,
    contract VARCHAR(30),
    paperless_billing VARCHAR(5),
    payment_method VARCHAR(50),
    monthly_charges DECIMAL(10, 2),
    total_charges DECIMAL(10, 2),
    churn VARCHAR(5), -- Yes or No
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- 5. Create SERVICES table (Subscriptions)
CREATE TABLE services (
    customer_id VARCHAR(20) PRIMARY KEY,
    phone_service VARCHAR(5),
    multiple_lines VARCHAR(20),
    internet_service VARCHAR(20),
    online_security VARCHAR(20),
    online_backup VARCHAR(20),
    device_protection VARCHAR(20),
    tech_support VARCHAR(20),
    streaming_tv VARCHAR(20),
    streaming_movies VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- 6. Verification Queries
SELECT '✅ Customers table created!' AS Status;
SELECT '✅ Accounts table created!' AS Status;
SELECT '✅ Services table created!' AS Status; 
