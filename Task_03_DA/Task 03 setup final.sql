-- Walmart Sales: FINAL MySQL Setup Script (Task 3)
-- This script creates the database, table, and loads the Walmart Sales CSV.

SET GLOBAL local_infile = 1;

CREATE DATABASE IF NOT EXISTS skillytixs_task3;
USE skillytixs_task3;

DROP TABLE IF EXISTS walmart_sales;

CREATE TABLE walmart_sales (
    store INT,
    dept INT,
    date DATE,
    weekly_sales DECIMAL(12,2),
    is_holiday BOOLEAN,
    type VARCHAR(10),
    size INT
);

LOAD DATA LOCAL INFILE "C:/Users/Avi Gupta/Downloads/Walmart_Sales.csv"
INTO TABLE walmart_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(store, dept, @date_str, weekly_sales, is_holiday, type, size)
SET date = STR_TO_DATE(@date_str, '%Y-%m-%d');
