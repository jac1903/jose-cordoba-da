-- Use your database
USE ecommerce_analysis;

-- Step 1: Calculate RFM metrics
WITH customer_rfm AS (
    SELECT 
        o.customer_id,
        -- Recency: Days since last purchase
        DATEDIFF(CURDATE(), MAX(o.order_purchase_timestamp)) AS recency,
        -- Frequency: Total number of orders
        COUNT(DISTINCT o.order_id) AS frequency,
        -- Monetary: Total money spent
        SUM(oi.price + oi.freight_value) AS monetary
    FROM olist_orders_dataset o
    LEFT JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
    WHERE o.order_status != 'canceled'
    GROUP BY o.customer_id
),

-- Step 2: Score customers 1-4
rfm_scores AS (
    SELECT 
        customer_id,
        NTILE(4) OVER (ORDER BY recency DESC) AS recency_score,
        NTILE(4) OVER (ORDER BY frequency ASC) AS frequency_score,
        NTILE(4) OVER (ORDER BY monetary ASC) AS monetary_score
    FROM customer_rfm
),

-- Step 3: Assign segments
segment_data AS (
    SELECT 
        customer_id,
        recency_score,
        frequency_score,
        monetary_score,
        CASE 
            WHEN recency_score >= 3 AND frequency_score >= 3 AND monetary_score >= 3 THEN 'Champions'
            WHEN recency_score >= 2 AND frequency_score >= 3 AND monetary_score >= 2 THEN 'Loyal'
            WHEN recency_score >= 3 AND frequency_score >= 2 AND monetary_score >= 3 THEN 'Potential'
            WHEN recency_score <= 2 AND frequency_score >= 2 AND monetary_score >= 2 THEN 'At-Risk'
            ELSE 'Churned'
        END AS customer_segment
    FROM rfm_scores
)

-- Step 4: Final Summary
SELECT 
    customer_segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(recency_score), 2) AS avg_recency,
    ROUND(AVG(frequency_score), 2) AS avg_frequency,
    ROUND(AVG(monetary_score), 2) AS avg_monetary
FROM segment_data
JOIN customer_rfm ON segment_data.customer_id = customer_rfm.customer_id
GROUP BY customer_segment
ORDER BY customer_count DESC;