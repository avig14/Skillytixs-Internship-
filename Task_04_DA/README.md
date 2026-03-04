Telco Customer Churn Prediction — Task 04 (Data Analytics Internship)

This repository contains my solution for Task 04 of the Skillytixs Data Analytics Internship, where the goal is to predict customer churn in the telecom industry using machine learning.

🎯 Objective

Build a machine learning model that predicts whether a customer will churn (leave the company) based on their demographic, service usage, and account information.

📂 Files in this Repository
File	Description
Telco_Task4_Final_Notebook.ipynb	Full end-to-end ML workflow (EDA → preprocessing → modeling → evaluation → saving model).
telco_churn_cleaned.csv	Cleaned dataset after fixing missing values, formatting errors, and service labels.
telo_features_importance_top20 -> Listing Top 20 features.

🧠 Key Steps Performed
🔹 1. Exploratory Data Analysis (EDA)

Checked dataset shape, column types, and missing values

Visualized churn distribution (imbalanced dataset)

Identified important patterns: tenure, contract type, monthly charges

🔹 2. Data Cleaning

Removed leading/trailing spaces in string columns

Replaced "No internet service" / "No phone service" with "No"

Converted TotalCharges to numeric

Filled missing values with median

Saved cleaned dataset → telco_churn_cleaned.csv

🔹 3. Encoding

LabelEncoded binary columns → Yes/No, Male/Female

OneHotEncoded multi-class features → Contract, InternetService, PaymentMethod

Ensured all categorical variables are converted

Saved encoded dataset → telco_churn_model_ready.csv

🔹 4. Feature Scaling

Used StandardScaler on all numerical columns for better performance in:

Logistic Regression

RandomForest (optional but included)

Scaler saved with model for deployment.

🔹 5. Model Building

Trained two baseline models:

Logistic Regression

RandomForestClassifier

Evaluated using:

ROC-AUC Score

Confusion Matrix

Classification Report

ROC Curve Visualization

🔹 6. Feature Importance

Plotted top 30 features using:

model.feature_importances_


Key drivers of churn:

Contract type

Tenure

Monthly Charges

Internet Service
