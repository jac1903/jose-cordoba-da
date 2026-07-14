# SQL Folder

This folder contains SQL scripts for database setup and churn analysis.

---

## 📁 SQL Files

| File | Description |
|------|-------------|
| `create_tables.sql` | Database schema for `churn_analysis` (customers, accounts, services) |
| `churn_analysis.sql` | Analysis queries: churn rate, contract, tenure, internet, payment, and more |

---

## 🗄️ Database Schema

**Database**: `churn_analysis`

| Table | Columns | Description |
|-------|---------|-------------|
| `customers` | customer_id, gender, senior_citizen, partner, dependents | Customer demographics |
| `accounts` | customer_id, tenure, contract, payment_method, monthly_charges, total_charges, churn | Account and billing info |
| `services` | customer_id, phone_service, internet_service, online_security, tech_support, ... | Services subscribed |

---

## 📊 Analysis Queries (churn_analysis.sql)

| Query | Purpose |
|-------|---------|
| #1 | Overall Churn Rate |
| #2 | Churn by Contract Type |
| #3 | Churn by Tenure Group |
| #4 | Churn by Internet Service |
| #5 | Churn by Payment Method |
| #6 | Avg Charges: Churned vs Retained |
| #7 | Churn by Senior Citizen |
| #8 | Top Churn Drivers (Services) |
| #9 | Create `customer_full_profile` view |
| #10 | Executive Summary KPI Dashboard |

---

## 🚀 How to Run

1. **Create the Database**:
   - Open MySQL Workbench.
   - Run `create_tables.sql` to build the schema.

2. **Import Data**:
   - Import `customers.csv` → `customers`
   - Import `accounts.csv` → `accounts`
   - Import `services.csv` → `services`
   *(In that order to respect foreign keys!)*

3. **Run Analysis**:
   - Execute `churn_analysis.sql` to generate insights.

---

*Last Updated: July 2026* | **Author**: Jose Cordoba