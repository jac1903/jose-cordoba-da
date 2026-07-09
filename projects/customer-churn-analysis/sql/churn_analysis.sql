-- =====================================================
-- Customer Churn Analysis - SQL Queries
-- Project: Customer Churn Prediction & Analysis
-- Author: Jose Cordoba
-- Date: July 2026
-- Database: churn_analysis
-- =====================================================

USE churn_analysis;

-- =====================================================
-- 1. OVERALL CHURN RATE
-- =====================================================
-- Business Question: What percentage of customers are leaving?
SELECT 
    churn,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accounts), 2) AS percentage
FROM accounts
GROUP BY churn;

-- =====================================================
-- 2. CHURN BY CONTRACT TYPE
-- =====================================================
-- Business Question: How does contract length affect churn?
-- Insight: Month-to-month contracts usually have the highest churn.
SELECT 
    a.contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM accounts a
GROUP BY a.contract
ORDER BY churn_rate DESC;

-- =====================================================
-- 3. CHURN BY TENURE GROUP
-- =====================================================
-- Business Question: Are newer customers more likely to churn?
-- Insight: Customers with < 12 months tenure are usually high-risk.
SELECT 
    CASE 
        WHEN a.tenure BETWEEN 0 AND 12 THEN '0-12 months (New)'
        WHEN a.tenure BETWEEN 13 AND 24 THEN '13-24 months'
        WHEN a.tenure BETWEEN 25 AND 48 THEN '25-48 months'
        WHEN a.tenure > 48 THEN '48+ months (Loyal)'
        ELSE 'Unknown'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM accounts a
GROUP BY tenure_group
ORDER BY churn_rate DESC;

-- =====================================================
-- 4. CHURN BY INTERNET SERVICE TYPE
-- =====================================================
-- Business Question: Does Internet service type impact churn?
SELECT 
    s.internet_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM services s
JOIN accounts a ON s.customer_id = a.customer_id
GROUP BY s.internet_service
ORDER BY churn_rate DESC;

-- =====================================================
-- 5. CHURN BY PAYMENT METHOD
-- =====================================================
-- Business Question: Which payment methods correlate with higher churn?
-- Insight: Electronic check often has higher churn.
SELECT 
    a.payment_method,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM accounts a
GROUP BY a.payment_method
ORDER BY churn_rate DESC;

-- =====================================================
-- 6. AVERAGE MONTHLY CHARGES: CHURNED vs RETAINED
-- =====================================================
-- Business Question: Do churned customers pay more or less?
SELECT 
    a.churn,
    ROUND(AVG(a.monthly_charges), 2) AS avg_monthly_charges,
    ROUND(AVG(a.total_charges), 2) AS avg_total_charges,
    ROUND(AVG(a.tenure), 2) AS avg_tenure_months
FROM accounts a
GROUP BY a.churn;

-- =====================================================
-- 7. CHURN BY SENIOR CITIZEN STATUS
-- =====================================================
-- Business Question: Are senior citizens more likely to churn?
SELECT 
    c.senior_citizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.senior_citizen
ORDER BY churn_rate DESC;

-- =====================================================
-- 8. TOP 5 REASONS FOR CHURN (SERVICE COMPARISON)
-- =====================================================
-- Business Question: Which missing services are most correlated with churn?
-- Insight: Lack of Online Security or Tech Support often drives churn.
SELECT 
    s.online_security,
    s.tech_support,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN a.churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM services s
JOIN accounts a ON s.customer_id = a.customer_id
GROUP BY s.online_security, s.tech_support
HAVING COUNT(*) > 10
ORDER BY churn_rate DESC
LIMIT 10;

-- =====================================================
-- 9. COMPREHENSIVE CUSTOMER VIEW (For Dashboard/Modeling)
-- =====================================================
-- Business Question: Create a full customer profile for analysis.
-- This combines demographics, account info, and services into one view.
CREATE OR REPLACE VIEW customer_full_profile AS
SELECT 
    c.customer_id,
    c.gender,
    c.senior_citizen,
    c.partner,
    c.dependents,
    a.tenure,
    a.contract,
    a.paperless_billing,
    a.payment_method,
    a.monthly_charges,
    a.total_charges,
    a.churn,
    s.phone_service,
    s.multiple_lines,
    s.internet_service,
    s.online_security,
    s.online_backup,
    s.device_protection,
    s.tech_support,
    s.streaming_tv,
    s.streaming_movies
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN services s ON c.customer_id = s.customer_id;

-- Verify the view exists
SELECT COUNT(*) AS view_rows FROM customer_full_profile;

-- =====================================================
-- 10. QUICK SUMMARY DASHBOARD QUERY
-- =====================================================
-- Business Question: Executive summary of churn KPIs.
SELECT 
    (SELECT COUNT(*) FROM accounts) AS total_customers,
    (SELECT COUNT(*) FROM accounts WHERE churn = 'Yes') AS total_churned,
    (SELECT ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM accounts), 2) 
     FROM accounts WHERE churn = 'Yes') AS churn_rate_percent,
    (SELECT ROUND(AVG(tenure), 2) FROM accounts) AS avg_tenure_months,
    (SELECT ROUND(AVG(monthly_charges), 2) FROM accounts) AS avg_monthly_charges;

-- =====================================================
-- Final: Show the summary
-- =====================================================
SELECT '✅ SQL Analysis Complete!' AS Status;