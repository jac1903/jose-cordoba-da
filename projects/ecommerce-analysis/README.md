\# 🛒 E-commerce Customer Behavior Analysis



\## 📌 Business Problem

An e-commerce company is experiencing a 25% annual customer churn rate. They need to understand their customers better to reduce churn and increase repeat purchases. The marketing team wants to know:

\- Who are our most valuable customers?

\- Which customers are at risk of leaving?

\- What products drive the most loyalty?



\## 🎯 Project Goal

Build a \*\*customer segmentation model\*\* (RFM Analysis) to classify customers into actionable groups and provide data-driven recommendations.



\## 📊 Dataset

\*\*Source\*\*: Brazilian E-commerce Dataset (Olist) - Public Kaggle dataset

\- \*\*Size\*\*: 100,000+ orders from 2016 to 2018

\- \*\*Tables\*\*: Customers, Orders, Products, Sellers, Payments, Reviews

\- \*\*Key Columns\*\*: Customer ID, Order Date, Order Value, Product Category, Review Score



\## 🛠️ Tools \& Technologies

| Tool | Purpose |

|------|---------|

| \*\*SQL (PostgreSQL)\*\* | Data extraction, cleaning, and RFM calculations |

| \*\*Python (Pandas, Matplotlib, Seaborn)\*\* | Exploratory Data Analysis (EDA) and visualization |

| \*\*Tableau Public\*\* | Interactive dashboard for stakeholder presentation |

| \*\*Excel\*\* | Quick validation and ad-hoc analysis |



\## 📂 Project Structure

ecommerce-analysis/

├── README.md # You are here

├── data/ # Raw and processed CSV files

├── sql/ # All SQL queries

│ └── customer\_segmentation.sql

├── notebooks/ # Jupyter notebooks for EDA

├── reports/ # Executive summary (PDF)

└── dashboards/ # Tableau workbook and screenshots





\## 🔍 Methodology



\### 1. Data Collection \& Cleaning (SQL)

\- Imported 9 CSV files into PostgreSQL database.

\- Handled missing values (e.g., null review scores filled with average).

\- Removed duplicate records and standardized date formats.



\### 2. RFM Analysis (Recency, Frequency, Monetary)

RFM is a marketing technique used to quantitatively rank customers based on:

\- \*\*Recency\*\*: How recently did the customer purchase? (Lower score = better)

\- \*\*Frequency\*\*: How often do they purchase? (Higher score = better)

\- \*\*Monetary\*\*: How much do they spend? (Higher score = better)



\*\*SQL Query Logic\*\*:

```sql

WITH rfm\_data AS (

&#x20;   SELECT 

&#x20;       customer\_id,

&#x20;       MAX(order\_date) AS last\_purchase\_date,

&#x20;       COUNT(order\_id) AS frequency,

&#x20;       SUM(price) AS monetary

&#x20;   FROM orders

&#x20;   GROUP BY customer\_id

)

\-- Customers are scored from 1-5 on each metric and segmented into:

\-- Champions, Loyal, Potential, At-Risk, and Churned

