import pandas as pd

# 1. Load the raw data
df = pd.read_csv('../data/telco_churn_raw.csv')

# 2. Clean the TotalCharges column (replace empty strings with 0)
df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce').fillna(0)

# 3. Create the 3 tables
customers = df[['customerID', 'gender', 'SeniorCitizen', 'Partner', 'Dependents']]
customers.columns = ['customer_id', 'gender', 'senior_citizen', 'partner', 'dependents']

accounts = df[['customerID', 'tenure', 'Contract', 'PaperlessBilling', 'PaymentMethod', 
               'MonthlyCharges', 'TotalCharges', 'Churn']]
accounts.columns = ['customer_id', 'tenure', 'contract', 'paperless_billing', 
                    'payment_method', 'monthly_charges', 'total_charges', 'churn']

services = df[['customerID', 'PhoneService', 'MultipleLines', 'InternetService', 
               'OnlineSecurity', 'OnlineBackup', 'DeviceProtection', 'TechSupport', 
               'StreamingTV', 'StreamingMovies']]
services.columns = ['customer_id', 'phone_service', 'multiple_lines', 'internet_service', 
                    'online_security', 'online_backup', 'device_protection', 'tech_support', 
                    'streaming_tv', 'streaming_movies']

# 4. Save to CSV files
customers.to_csv('../data/customers.csv', index=False)
accounts.to_csv('../data/accounts.csv', index=False)
services.to_csv('../data/services.csv', index=False)

print("✅ Data split successfully into 3 files!")
print(f"Customers: {len(customers)} rows")
print(f"Accounts: {len(accounts)} rows")
print(f"Services: {len(services)} rows")