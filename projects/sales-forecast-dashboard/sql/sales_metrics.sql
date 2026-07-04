-- =====================================================
-- Sales Performance Analysis - SQL Queries
-- Project: Sales Performance & Forecasting Dashboard
-- Author: Jose Cordoba
-- Date: July 2026
-- Database: sales_analysis
-- =====================================================

-- 1. Use the database
USE sales_analysis;

-- 2. Preview the data structure
SELECT * FROM sales LIMIT 10;

-- 3. Overall Sales Summary
SELECT 
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(AVG(Sales), 2) AS avg_order_value,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_percent
FROM sales;

-- 4. Sales by Region (KPI)
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(AVG(Sales), 2) AS avg_sales,
    COUNT(*) AS order_count,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin
FROM sales
GROUP BY Region
ORDER BY total_sales DESC;

-- 5. Monthly Sales Trend (for forecasting)
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS month,
    ROUND(SUM(Sales), 2) AS monthly_sales,
    COUNT(*) AS order_count
FROM sales
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY month;

-- 6. Year-over-Year Growth
SELECT 
    YEAR(OrderDate) AS year,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Sales) - LAG(SUM(Sales)) OVER (ORDER BY YEAR(OrderDate)), 2) AS growth_amount,
    ROUND((SUM(Sales) - LAG(SUM(Sales)) OVER (ORDER BY YEAR(OrderDate))) / LAG(SUM(Sales)) OVER (ORDER BY YEAR(OrderDate)) * 100, 2) AS growth_percent
FROM sales
GROUP BY YEAR(OrderDate)
ORDER BY year;

-- 7. Top 10 Products by Sales
SELECT 
    ProductName,
    Category,
    SubCategory,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS units_sold
FROM sales
GROUP BY ProductName, Category, SubCategory
ORDER BY total_sales DESC
LIMIT 10;

-- 8. Category Performance
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(AVG(Sales), 2) AS avg_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin
FROM sales
GROUP BY Category
ORDER BY total_sales DESC;

-- 9. Customer Segment Analysis
SELECT 
    Segment,
    COUNT(DISTINCT CustomerID) AS customer_count,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(AVG(Sales), 2) AS avg_spend,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin
FROM sales
GROUP BY Segment
ORDER BY total_sales DESC;

-- 10. Quarterly Sales by Region
SELECT 
    Region,
    CONCAT(YEAR(OrderDate), '-Q', QUARTER(OrderDate)) AS quarter,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Region, YEAR(OrderDate), QUARTER(OrderDate)
ORDER BY Region, YEAR(OrderDate), QUARTER(OrderDate);

-- 11. Month-over-Month Growth Rate
WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(OrderDate, '%Y-%m-01') AS month_start,
        ROUND(SUM(Sales), 2) AS total_sales
    FROM sales
    GROUP BY DATE_FORMAT(OrderDate, '%Y-%m-01')
)
SELECT 
    month_start,
    total_sales,
    ROUND(100 * (total_sales - LAG(total_sales) OVER (ORDER BY month_start)) / LAG(total_sales) OVER (ORDER BY month_start), 2) AS mom_growth_percent
FROM monthly_sales
ORDER BY month_start;

-- 12. Regional Profit vs Sales Comparison
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin,
    CASE 
        WHEN ROUND(SUM(Profit) / SUM(Sales) * 100, 2) > 15 THEN 'High Performance'
        WHEN ROUND(SUM(Profit) / SUM(Sales) * 100, 2) > 10 THEN 'Medium Performance'
        ELSE 'Low Performance'
    END AS performance_tier
FROM sales
GROUP BY Region
ORDER BY profit_margin DESC;

-- 13. Sales Summary by Segment & Category
SELECT 
    Segment,
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(AVG(Discount), 2) AS avg_discount
FROM sales
GROUP BY Segment, Category
ORDER BY Segment, total_sales DESC;

-- 14. Quick Dashboard Query (Top KPIs for Tableau/Power BI)
SELECT 
    'Total Sales' AS metric,
    ROUND(SUM(Sales), 2) AS value
FROM sales
UNION ALL
SELECT 
    'Total Profit',
    ROUND(SUM(Profit), 2)
FROM sales
UNION ALL
SELECT 
    'Profit Margin %',
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)
FROM sales
UNION ALL
SELECT 
    'Total Orders',
    COUNT(*)
FROM sales
UNION ALL
SELECT 
    'Avg Order Value',
    ROUND(AVG(Sales), 2)
FROM sales; 
