# Sales Trend Analysis Using SQL Aggregations (Task 9)

## Objective
Analyze time-based sales trends using SQL aggregation on the `online_sales` table to identify peak revenue months, order volume patterns, and overall monthly performance.

## Dataset
- Source file: `online_retail.csv`
- Raw table: `online_retail_raw`
- Analysis table: `online_sales`

`online_sales` schema:
- `order_id` (from `InvoiceNo`)
- `order_date` (from `InvoiceDate`)
- `amount` = `Quantity * UnitPrice`
- `product_id` (from `StockCode`)

Negative quantities and zero/negative prices were filtered out before analysis.

## SQL Steps
1. Created `online_retail_raw` and imported the CSV data.
2. Built `online_sales` with computed `amount` and cleaned records.
3. Wrote aggregation queries to:
   - Compute monthly revenue and distinct order counts.
   - Calculate average revenue per order.
   - Filter results for a specific year.
   - Identify top 5 revenue-generating months.

## Key Insights
- Identified **peak sales months** based on total revenue.
- Observed variations in **order volume vs. revenue** (some months have high revenue with fewer but larger orders).
- Derived **average revenue per order** to understand customer spend behavior over time.

> Replace this section with your actual findings once you see the numbers, e.g.  
> “November and December show the highest revenue, indicating strong holiday-season demand.”

## Files in this Repository
- `sales_trend_analysis.sql` – full SQL script (table creation + queries)
- `online_retail.csv` – raw dataset (if allowed to upload)
- `results_monthly_trends.csv` – exported query results
- `README.md` – this documentation
