-- sales_trend_analysis_task9.sql
-- Task 9: Sales Trend Analysis Using Aggregations
-- Dialect: MySQL 8.x (adjust date functions if using PostgreSQL/SQLite)

------------------------------------------------------------
-- 1. (Optional) Create and use a dedicated database
------------------------------------------------------------
-- CREATE DATABASE IF NOT EXISTS online_sales_db;
-- USE online_sales_db;

------------------------------------------------------------
-- 2. Raw table matching online_retail.csv
------------------------------------------------------------
DROP TABLE IF EXISTS online_retail_raw;

CREATE TABLE online_retail_raw (
    InvoiceNo    VARCHAR(20),
    StockCode    VARCHAR(50),
    Description  TEXT,
    Quantity     INT,
    InvoiceDate  DATETIME,
    UnitPrice    DECIMAL(10, 4),
    CustomerID   VARCHAR(20),
    Country      VARCHAR(50)
);

-- NOTE: Import your CSV into online_retail_raw using your SQL client / GUI.
-- Example (this will vary by environment and file path):
-- LOAD DATA INFILE '/path/to/online_retail.csv'
-- INTO TABLE online_retail_raw
-- FIELDS TERMINATED BY ','
-- OPTIONALLY ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES
-- (InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country);

------------------------------------------------------------
-- 3. Cleaned analysis table: online_sales
------------------------------------------------------------
DROP TABLE IF EXISTS online_sales;

CREATE TABLE online_sales AS
SELECT
    InvoiceNo                                      AS order_id,
    InvoiceDate                                    AS order_date,
    (Quantity * UnitPrice)                         AS amount,
    StockCode                                      AS product_id
FROM online_retail_raw
WHERE Quantity > 0
  AND UnitPrice > 0
  AND InvoiceNo IS NOT NULL
  AND StockCode IS NOT NULL
  AND InvoiceNo NOT LIKE 'C%';   -- Exclude cancelled invoices (start with 'C')

-- Add indexes to speed up time-based aggregations
ALTER TABLE online_sales
    ADD INDEX idx_online_sales_order_date (order_date),
    ADD INDEX idx_online_sales_order_id (order_id);

------------------------------------------------------------
-- 4. Monthly revenue & order volume (all years)
--    Using EXTRACT(YEAR FROM ...) and EXTRACT(MONTH FROM ...)
------------------------------------------------------------
-- Deliverable 1: Monthly revenue, order count, avg revenue per order

SELECT
    EXTRACT(YEAR  FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount)                    AS total_revenue,
    COUNT(DISTINCT order_id)       AS order_count,
    SUM(amount) / COUNT(DISTINCT order_id) AS avg_revenue_per_order
FROM online_sales
GROUP BY
    EXTRACT(YEAR  FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year,
    month;

------------------------------------------------------------
-- 5. Monthly aggregation formatted as YYYY-MM
------------------------------------------------------------
-- Deliverable 2: Same metrics with a year_month column

SELECT
    DATE_FORMAT(order_date, '%Y-%m')              AS year_month,
    SUM(amount)                                   AS total_revenue,
    COUNT(DISTINCT order_id)                      AS order_count,
    SUM(amount) / COUNT(DISTINCT order_id)        AS avg_revenue_per_order
FROM online_sales
GROUP BY year_month
ORDER BY year_month;

------------------------------------------------------------
-- 6. Filter for a specific year (e.g. 2011)
------------------------------------------------------------
-- Deliverable 3: Monthly metrics for a selected year only
-- Change 2011 to your desired year (e.g. 2023)

SELECT
    DATE_FORMAT(order_date, '%Y-%m')              AS year_month,
    SUM(amount)                                   AS total_revenue,
    COUNT(DISTINCT order_id)                      AS order_count,
    SUM(amount) / COUNT(DISTINCT order_id)        AS avg_revenue_per_order
FROM online_sales
WHERE YEAR(order_date) = 2011                     -- <== change this year as needed
GROUP BY year_month
ORDER BY year_month;

------------------------------------------------------------
-- 7. Top 5 revenue-generating months (all time)
------------------------------------------------------------
-- Deliverable 4: Identify peak months by total revenue

WITH monthly AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS year_month,
        SUM(amount)                      AS total_revenue,
        COUNT(DISTINCT order_id)         AS order_count,
        SUM(amount) / COUNT(DISTINCT order_id) AS avg_revenue_per_order
    FROM online_sales
    GROUP BY year_month
)
SELECT
    year_month,
    total_revenue,
    order_count,
    avg_revenue_per_order
FROM monthly
ORDER BY total_revenue DESC
LIMIT 5;

------------------------------------------------------------
-- 8. Example: Using WHERE vs HAVING in the same query
------------------------------------------------------------
-- This snippet demonstrates:
-- - WHERE for row-level filter (date range)
-- - HAVING for group-level filter (aggregated revenue)

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_count
FROM online_sales
WHERE order_date >= '2011-01-01'                 -- row-level filter
GROUP BY year, month
HAVING SUM(amount) > 100000;                     -- group-level filter on aggregate

------------------------------------------------------------
-- End of file
------------------------------------------------------------
