# 📌 Project Overview

This project presents an end-to-end fraud detection and risk analytics solution built using MySQL, Python, and Power BI.

Using a synthetic dataset of 10,000 financial transactions, the project analyzes transaction behavior, identifies fraud patterns, trains machine learning models, and visualizes insights through interactive dashboards.

The dataset is fully synthetic, ensuring data privacy while simulating realistic fraud scenarios commonly seen in financial systems.

# 📂 Dataset Description

 **Source:** Synthetic Financial Fraud Dataset

 **Size:** 10,000 transactions

 
 **Features**

 transaction_id – Unique transaction identifier

 user_id – User performing the transaction

 amount – Transaction amount

transaction_type – POS, Online, ATM, QR

merchant_category – Merchant category

country – Transaction country

hour – Hour of transaction (0–23)

device_risk_score – Device-based risk indicator

ip_risk_score – IP-based risk indicator

is_fraud – Target variable (1 = Fraud, 0 = Legit)


**Simulated Fraud Patterns**

High-value transactions

Night-time activity

High-risk devices and IPs

Geographic anomalies

Rapid or suspicious transaction behavior

# 🛠 Tools & Technologies

🔹 **MySQL**

Schema creation & data storage

Data validation and cleaning

KPI calculations:

Total Transactions

Fraud Transactions

Fraud Ratio

Time-based analysis (hour, time ranges)

Geographic and merchant-level fraud analysis

🔹 **Python (EDA & Machine Learning)**

Libraries: Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn, XGBoost

Exploratory Data Analysis (EDA)

Feature engineering

Models trained:

Logistic Regression

Random Forest

Decision Tree

KNN

XGBoost (Best performer)

Model evaluation:

Confusion Matrix

Classification Report

ROC–AUC Curve

Feature importance analysis for explainability

🔹 **Power BI**

Interactive 2-page dashboard

KPI cards with conditional formatting

Fraud trends by:

Time

Country

Merchant category

Amount distribution (Fraud vs Legit)

Risk score distributions (Device & IP)

Feature influence visualization (Power BI equivalent of ML feature importance)

Matrix visuals for country-level fraud exposure

Slicers for dynamic filtering

# 📊 Key Insights

Fraud ratio is approximately 5%, but fraud transactions have disproportionately higher amounts

Device risk score and IP risk score are the strongest predictors of fraud

Fraudulent activity peaks during night and early morning hours

Certain countries and merchant categories exhibit higher fraud concentration

Rule-based risk flags align well with machine learning predictions


# 📈 Dashboard Structure

**Page 1 — Executive Fraud Overview**

KPIs: Total Transactions, Fraud Transactions, Fraud Ratio, Avg Fraud Amount

Hourly fraud trends

Feature influence (risk score dominance)

Fraud distribution by country (matrix)

Fraud rate by merchant category

**Page 2 — Transaction Behavior & Explainability**

Amount distribution (Fraud vs Legit)

Device & IP risk score distributions

Fraud by time range

Individual transaction risk assessment (rule-based)


# 🎯 Business Value

This project demonstrates how analytics and machine learning can:

Detect fraud patterns early

Prioritize high-risk transactions

Support risk-based monitoring strategies

Translate complex ML outputs into business-friendly dashboards

# 🚀 Skills Demonstrated

SQL • MySQL • Python • Pandas • Machine Learning • XGBoost

Power BI • DAX • Data Visualization • Fraud Analytics • Risk Analysis

