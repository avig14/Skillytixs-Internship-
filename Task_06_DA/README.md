Task 06 – SQLite + Python Sales Analysis

This project demonstrates how to connect Python with an SQLite database, extract sales information using SQL queries, convert it into a pandas DataFrame, and visualize results using matplotlib.

Objective

Analyze product sales to compute:

Total quantity sold

Total revenue generated

Visual revenue comparison with a bar chart

Tools Used
Tool	Purpose
SQLite	Local lightweight database
Python (sqlite3, pandas, matplotlib)	Data extraction, processing and visualization
Jupyter Notebook	Development environment
Dataset

Small internal SQLite DB file: sales_data.db
Table: sales
Columns: product, quantity, price

Steps Performed

Created / connected to SQLite database

Inserted example sales records

Executed SQL queries to summarize total quantity and revenue

Loaded results into pandas

Created bar chart for revenue comparison

Output

Summary table of quantity & revenue by product

Bar chart visualizing total revenue per product

Repository Contains
📄 Task06_Sales_SQL_Python.ipynb
📁 sales_data.db
📄 README.md
