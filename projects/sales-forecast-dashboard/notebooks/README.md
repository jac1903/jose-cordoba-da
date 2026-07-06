# Analysis Notebooks

This folder contains Jupyter notebooks used for the Sales Performance & Forecasting Dashboard project.

---

## 📊 Notebooks Overview

| Notebook | Description | Purpose |
|----------|-------------|---------|
| `01_eda_sales_data.ipynb` | Exploratory Data Analysis (EDA) | Analyze sales data, identify trends, and create visualizations |
| `02_sales_forecast.ipynb` | Sales Forecasting (Prophet) | Predict future sales using Facebook Prophet |

---

## 📓 Notebook Details

### 01_eda_sales_data.ipynb

**Purpose**: Explore and visualize sales data to understand business performance.

**Key Features**:
- ✅ Data loading from MySQL (with CSV fallback)
- ✅ Automatic column name standardization
- ✅ Sales by Region, Category, and Customer Segment
- ✅ Monthly sales trend analysis
- ✅ Year-over-Year (YoY) trend analysis
- ✅ Top 10 products by sales
- ✅ 7+ visualizations (bar charts, line charts, pie charts, boxplots)

**Key Insights**:
- Sales declined significantly from 2017 onward
- West region generates the highest sales
- Technology category has the highest sales
- November shows seasonal sales peaks

**Outputs**:
- Charts saved to: `../visualizations/screenshots/`
- Cleaned data exported to: `../data/cleaned_sales_data.csv`

---

### 02_sales_forecast.ipynb

**Purpose**: Forecast future sales using Facebook Prophet to support business planning.

**Key Features**:
- ✅ Monthly sales aggregation (reduces noise)
- ✅ Facebook Prophet model with additive seasonality
- ✅ 3-month forecast horizon (more reliable)
- ✅ Forecast visualization with trend and seasonality
- ✅ Automatic zero-floor (prevents negative sales)
- ✅ Business insights based on forecast results

**Key Insights**:
- **Total Forecasted Sales (3 months)**: $305.48
- **Average Monthly Sales**: $101.83
- **Peak Month**: November 2018 ($127.70)
- **Lowest Month**: January 2019 ($75.67)
- **Trend**: Slight downward trend into 2019

**⚠️ Important Caveats**:
1. **Limited Data**: Only 2015-2018 (~3 years) — insufficient for robust yearly seasonality detection.
2. **Declining Historical Trend**: Sales data shows significant decline from 2017 onward.
3. **Short Forecast Horizon**: Limited to 3 months for reliability.
4. **External Factors**: Does not account for marketing, economic conditions, or competition.

**Outputs**:
- Forecast plot saved to: `../visualizations/screenshots/forecast_plot.png`
- Forecast components saved to: `../visualizations/screenshots/forecast_components.png`
- Forecast data exported to: `../data/sales_forecast_3month.csv`

---

## 🚀 How to Run the Notebooks

### Prerequisites
- Python 3.8+
- Jupyter Notebook or Jupyter Lab
- Libraries: `pandas`, `matplotlib`, `seaborn`, `numpy`, `prophet`, `sqlalchemy`, `pymysql`

### Steps

1. **Start Jupyter Notebook**:
   ```bash
   jupyter notebook

