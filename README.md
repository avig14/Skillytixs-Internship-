# Skillytixs Data Analytics Internship

A 10-task Data Analytics Internship covering the full analytics lifecycle: data cleaning, EDA, SQL, machine learning, interactive dashboards, and web scraping.

Each task lives in its own repository, linked here as a **git submodule**.

---

## Repository Structure

| Folder | Task | Topic |
|--------|------|-------|
| [Task_01_DA](https://github.com/avig14/Task_01_DA) | Task 01 — 14 Nov | Data Cleaning (Medical Appointments) |
| [Task_02_DA](https://github.com/avig14/Task_02_DA) | Task 02 — 17 Nov | Exploratory Data Analysis (Titanic) |
| [Task_03_DA](https://github.com/avig14/Task_03_DA) | Task 03 — 18 Nov | SQL Analysis (Walmart Sales – MySQL) |
| [Task_04_DA](https://github.com/avig14/Task_04_DA) | Task 04 — 19 Nov | ML Classification (Telco Churn) |
| [Task_05_DA](https://github.com/avig14/Task_05_DA) | Task 05 — 20 Nov | Interactive Dashboard (Supermarket Sales) |
| [Task_06_DA](https://github.com/avig14/Task_06_DA) | Task 06 — 21 Nov | SQLite + Python Integration |
| [Task_07_DA](https://github.com/avig14/Task_07_DA) | Task 07 — 24 Nov | Advanced Visualization (Walmart Sales) |
| [Task_08_DA](https://github.com/avig14/Task_08_DA) | Task 08 — 25 Nov | Feature Engineering + ML Regression (House Prices) |
| [Task_09_DA](https://github.com/avig14/Task_09_DA) | Task 09 — 26 Nov | SQL Aggregations (Online Retail) |
| [Task_10_DA](https://github.com/avig14/Task_010_DA) | Task 10 — 27 Nov | Web Scraping (Job Market Analysis) |

---

## Task Summaries

### Task 01 — Data Cleaning (14 Nov)
**Dataset:** Medical Appointments (`KaggleV2-May-2016.csv`, ~110k rows)
- Removed duplicates, standardized column names to `snake_case`
- Parsed date columns as proper datetime objects
- Encoded `no-show`: `"Yes" → 1`, `"No" → 0`; fixed negative ages

**Skills:** `pandas`, data type conversion, string normalization, binary encoding

---

### Task 02 — Exploratory Data Analysis (17 Nov)
**Dataset:** Titanic (418 rows)
- Univariate & bivariate analysis, correlation heatmap
- Imputed missing ages using median grouped by `pclass` and `sex`
- **Key Finding:** Females and 1st-class passengers had the highest survival rates

**Skills:** `pandas`, `matplotlib`, `seaborn`, EDA, missing value imputation

---

### Task 03 — SQL Analysis (18 Nov)
**Dataset:** Walmart Sales (6,435 rows, 45 stores)
- MySQL database setup with `LOAD DATA LOCAL INFILE`
- Aggregate queries: top stores, holiday impact, year-wise breakdown
- **Key Finding:** Store 20 top performer ($301M); holiday weeks ~8% higher sales

**Skills:** MySQL, DDL/DML, `GROUP BY`, aggregate functions, date functions

---

### Task 04 — ML Classification / Churn Prediction (19 Nov)
**Dataset:** Telco Customer Churn (~7k rows)
- Full ML pipeline: cleaning → encoding → scaling → train/test split
- Models: Logistic Regression + Random Forest; evaluated with AUC-ROC

**Skills:** `scikit-learn`, classification, model evaluation, `joblib`

---

### Task 05 — Interactive Dashboard (20 Nov)
**Dataset:** Supermarket Sales
- Standalone browser dashboard (`task_05.html`) — no server needed
- KPI cards + charts using Chart.js; in-browser CSV parsing via PapaParse

**Skills:** HTML, CSS, JavaScript, Chart.js, PapaParse, dashboard design

---

### Task 06 — SQLite + Python Integration (21 Nov)
- Created `sales_data.db` using Python's `sqlite3` library inside a notebook
- Queried with `GROUP BY` → pandas DataFrame → matplotlib bar chart

**Skills:** `sqlite3`, `pandas`, `matplotlib`, SQL in Python

---

### Task 07 — Advanced Visualization (24 Nov)
**Dataset:** Walmart Weekly Sales (45 stores, 2010–2012)
- Interactive Plotly charts + static Seaborn charts
- Sales trend, store comparison, holiday analysis, seasonality, correlation heatmap

**Skills:** `plotly`, `seaborn`, `matplotlib`, time-series visualization

---

### Task 08 — Feature Engineering + Kaggle Regression (25 Nov)
**Dataset:** House Prices — Advanced Regression Techniques (Kaggle)
- Combined train+test preprocessing, log1p skewness correction, one-hot encoding
- RandomForestRegressor (400 trees, 5-fold CV); output: `submission.csv`

**Skills:** `scikit-learn`, feature engineering, `KFold` CV, Kaggle workflow

---

### Task 09 — SQL Aggregations / Sales Trend Analysis (26 Nov)
**Dataset:** Online Retail (UK e-commerce, 2010–2011)
- Cleaned table, indexed columns, monthly revenue CTE, top-5 months
- Demonstrated `WHERE` vs `HAVING`

**Skills:** MySQL, CTEs, `DATE_FORMAT`, `EXTRACT`, `GROUP BY`, `HAVING`, indexing

---

### Task 10 — Web Scraping / Job Market Analysis (27 Nov)
**Source:** TimesJobs.com ("Data Analyst" listings)
- Scraped with `requests` + `BeautifulSoup`; mock data fallback
- Top 5 locations and top 5 in-demand skills via `Counter`

**Skills:** `requests`, `BeautifulSoup`, `pandas`, `seaborn`, web scraping

---

## Tech Stack

| Category | Tools / Libraries |
|----------|-------------------|
| Language | Python , SQL |
| Data Manipulation | pandas, numpy |
| Visualization | matplotlib, seaborn, plotly, Chart.js |
| Machine Learning | scikit-learn (RandomForest, LogisticRegression, StandardScaler, KFold) |
| Databases | MySQL, SQLite |
| Web / Dashboard | HTML, CSS, JavaScript, PapaParse |
| Web Scraping | requests, BeautifulSoup |
| Environment | Anaconda, Jupyter Notebook, VS Code |

---

## Cloning with Submodules

```bash
git clone --recurse-submodules https://github.com/avig14/Skillytixs-Internship-.git
```

*Completed as part of the Skillytixs Data Analytics Internship — November 2025*
