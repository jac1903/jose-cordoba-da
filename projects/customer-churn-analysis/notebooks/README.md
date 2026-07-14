# Notebooks Folder

This folder contains Jupyter notebooks used for the Customer Churn Analysis project.

---

## 📓 Notebooks Overview

| Notebook | Description | Purpose |
|----------|-------------|---------|
| `01_data_exploration.ipynb` | Exploratory Data Analysis (EDA) | Visualize churn patterns, distributions, and correlations |
| `02_churn_model.ipynb` | Machine Learning Model | Build Logistic Regression to predict churn |

---

## 📓 Notebook Details

### 01_data_exploration.ipynb

**Purpose**: Explore and visualize churn data to identify key patterns.

**Key Features**:
- ✅ Data loading from MySQL (`customer_full_profile` view)
- ✅ 9+ visualizations (churn distribution, contract, tenure, internet, payment, monthly charges, correlation heatmap)
- ✅ Key insights summary (highest risk groups)
- ✅ Charts automatically saved to `../visualizations/screenshots/`

**Key Insights**:
- Month-to-month contracts have the highest churn
- New customers (0-12 months) churn at 2x the rate
- Fiber optic customers and Electronic check users are high-risk

---

### 02_churn_model.ipynb

**Purpose**: Build and evaluate a Logistic Regression model to predict churn.

**Key Features**:
- ✅ One-hot encoding for categorical variables
- ✅ Train-test split (80/20) with stratification
- ✅ StandardScaler for feature scaling
- ✅ Logistic Regression with `class_weight='balanced'`
- ✅ Model evaluation: Accuracy, Precision, Recall, F1-Score
- ✅ Confusion Matrix and ROC Curve
- ✅ Feature importance (Top 10 factors driving churn)

**Model Performance**:
- **Accuracy**: ~80%
- **ROC-AUC**: 0.85 (Excellent)
- **Top Factors**: Tenure, Contract Type, Internet Service

---

## 🚀 How to Run

1. **Start Jupyter Notebook**:
   ```bash
   jupyter notebook

2. Run notebooks in order:

First: 01_data_exploration.ipynb

Second: 02_churn_model.ipynb

3. Update Password: Ensure the MySQL password in both notebooks matches your local setup.


*Last Updated: July 2026* | **Author**: Jose Cordoba