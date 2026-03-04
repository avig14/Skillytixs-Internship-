# Walmart Sales – Visualizing Sales Trends and Customer Behavior

This project is part of the **Data Analytics Internship – Task 7: Visualizing Sales Trends and Customer Behavior**.

Using the Walmart weekly sales dataset, we:

- Cleaned and prepared the data (parsed dates, added time features like year/month/week, sorted by store and date)
- Analysed overall sales trends over time
- Compared performance across stores
- Compared **holiday vs non‑holiday** weeks
- Explored **seasonality** (monthly patterns)
- Checked correlations between weekly sales and macro variables (temperature, fuel price, CPI, unemployment)
- Built interactive and static visualizations to tell a clear business story

## Files in this repository

- `Walmart.csv` – Raw dataset (as provided)
- `Walmart_cleaned.csv` – Cleaned and enriched dataset (parsed dates, added Year/Month/Week/Is_Holiday)
- `Walmart_sales_eda.ipynb` – Jupyter notebook with full EDA & visualizations
- `README.md` – This file, explaining the project structure and insights

## Key Questions Answered

1. **How do total weekly sales trend over time?**
2. **Which stores generate the highest average weekly sales?**
3. **Do holiday weeks perform significantly better than non‑holiday weeks?**
4. **Are there clear seasonal peaks (by month and year)?**
5. **How do external drivers like temperature, fuel price, CPI and unemployment relate to sales?**

## How to run

1. Clone this repository.
2. Install required Python libraries:

   ```bash
   pip install pandas numpy matplotlib seaborn plotly
   ```

3. Open the notebook in Jupyter / VS Code and run all cells:

   ```bash
   jupyter notebook Walmart_sales_eda.ipynb
   ```

## Potential Dashboard Ideas

If you build a BI dashboard (Power BI / Tableau / Plotly Dash), consider including:

- KPI cards: Total sales, average weekly sales, best store
- Line chart: Weekly / monthly sales trend over time
- Bar chart: Average weekly sales by store
- Bar / box plot: Holiday vs non‑holiday sales comparison
- Heatmap: Correlation between sales and macro variables
- Filters / slicers: Store, year, holiday flag

These visuals together will clearly communicate **sales trends and customer behavior drivers** for Walmart.
