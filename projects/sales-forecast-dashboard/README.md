# \# 📊 Sales Performance \& Forecasting Dashboard

# 

# \## 🎯 Business Problem

# A retail company operates across 4 regions and needs to optimize inventory and marketing spend. Currently, they have no visibility into:

# \- Which products are driving sales?

# \- How is each region performing?

# \- What will sales look like next quarter?

# 

# \## 🏆 Project Goal

# Build a \*\*sales performance dashboard\*\* with forecasting capabilities to help management make data-driven decisions.

# 

# \## 📊 Dataset

# \*\*Source\*\*: Superstore Sales Dataset

# \- \*\*Size\*\*: 9,994 rows (2015-2018)

# \- \*\*Regions\*\*: North, South, East, West

# \- \*\*Categories\*\*: Furniture, Office Supplies, Technology

# \- \*\*Key Metrics\*\*: Sales, Profit, Quantity, Customer Segment

# 

# \## 📈 Key Metrics \& KPIs

# 

# | KPI | Definition | Why It Matters |

# |-----|-----------|---------------|

# | \*\*Total Sales\*\* | Monthly revenue | Tracks overall growth |

# | \*\*Sales by Region\*\* | Revenue per region | Identifies high/low performers |

# | \*\*Profit Margin\*\* | (Sales - Cost)/Sales | Measures efficiency |

# | \*\*Forecast Accuracy\*\* | Predicted vs actual | Validates forecasting model |

# 

# \## 🛠️ Tools Used

# 

# | Tool | Purpose |

# |------|---------|

# | \*\*MySQL\*\* | Data storage and aggregation |

# | \*\*Python (Pandas, Matplotlib, Seaborn)\*\* | EDA and visualization |

# | \*\*Tableau Public / Power BI\*\* | Interactive dashboard |

# | \*\*Prophet (Python)\*\* | Sales forecasting |

# 

# \## 📂 Project Structure

# 

# ```

# sales-forecast-dashboard/

# ├── README.md                    # You are here

# ├── data/                        # Raw and processed CSV files

# │   └── superstore\_sales.csv

# ├── sql/                         # SQL queries

# │   └── sales\_metrics.sql

# ├── notebooks/                   # Jupyter notebooks

# │   ├── 01\_eda\_sales\_data.ipynb

# │   └── 02\_sales\_forecast.ipynb

# ├── reports/                     # Executive summary

# │   └── executive\_summary.md

# └── visualizations/              # Charts and dashboards

# &#x20;   └── screenshots/

# ```

# 

# \## 🔍 Methodology

# 

# \### 1. Data Collection \& Cleaning

# \- Imported Superstore dataset into MySQL.

# \- Handled missing values and duplicates.

# \- Standardized date formats.

# 

# \### 2. Exploratory Data Analysis (EDA)

# \- Monthly sales trends by region.

# \- Top 10 products by revenue.

# \- Seasonality and year-over-year growth.

# 

# \### 3. Sales Forecasting

# \- Used Facebook Prophet for time series forecasting.

# \- Forecasted 6 months ahead.

# \- Validated with historical data.

# 

# \### 4. Dashboard Creation

# \- Built interactive dashboard in Tableau/Power BI.

# \- Added filters for region, category, and time period.

# 

# \## 📊 Dashboard Features

# 

# | Feature | Description |

# |---------|-------------|

# | \*\*Monthly Sales Trend\*\* | Line chart with forecast overlay |

# | \*\*Regional Performance\*\* | Map with color-coded sales |

# | \*\*Product Performance\*\* | Bar chart of top products |

# | \*\*KPI Cards\*\* | Key metrics at a glance |

# | \*\*Filters\*\* | Region, Category, Date range |

# 

# \## 💡 Key Insights (Expected)

# 

# 1\. \*\*West region\*\* outperforms others by 25% in Q4.

# 2\. \*\*Technology\*\* category has highest profit margin (22%).

# 3\. Sales peak in \*\*November\*\* (holiday season).

# 4\. \*\*Office Supplies\*\* is the most consistent category.

# 

# \## 🏆 Business Impact (Target)

# 

# \- \*\*10% increase\*\* in forecast accuracy.

# \- \*\*15% reduction\*\* in overstocked inventory.

# \- \*\*Regional managers\*\* now have data-driven targets.

# \- \*\*Improved marketing ROI\*\* through targeted campaigns.

# 

# \## 🚀 How to Run This Project

# 

# \### Prerequisites

# \- MySQL installed

# \- Python 3.8+ with Jupyter Notebook

# \- Tableau Public or Power BI (optional)

# 

# \### Steps

# 1\. Open MySQL Workbench.

# 2\. Import the dataset from `data/superstore\_sales.csv`.

# 3\. Run SQL scripts in the `sql/` folder.

# 4\. Open `notebooks/01\_eda\_sales\_data.ipynb` for EDA.

# 5\. Open `notebooks/02\_sales\_forecast.ipynb` for forecasting.

# 6\. Open Tableau/Power BI and connect to the database.

# 7\. Build the dashboard.

# 

# \## 📚 References

# \- \[Superstore Dataset on Kaggle](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting)

# \- \[Facebook Prophet Documentation](https://facebook.github.io/prophet/)

# 

# \---

# 

# \*Last Updated: July 2026\* | \*\*Author\*\*: Jose Cordoba

