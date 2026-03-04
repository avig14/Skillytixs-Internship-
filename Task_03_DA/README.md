# Task_03_DA
Task 03 – Walmart Sales Data Analysis (Skillytixs Internship). Includes SQL setup, data cleaning, EDA, visualizations, insights PDF, and Jupyter notebook. Analyzes sales trends, holiday impact, correlations, and store performance.
# Walmart Sales — Key Insights (Task 03)

**Records analyzed:** 6435

**Total sales:** 6,737,218,987.11

## Top 10 Stores by Total Sales

- Store 20: 301,397,792.46
- Store 4: 299,543,953.38
- Store 14: 288,999,911.34
- Store 13: 286,517,703.80
- Store 2: 275,382,440.98
- Store 10: 271,617,713.89
- Store 27: 253,855,916.88
- Store 6: 223,756,130.64
- Store 1: 222,402,808.85
- Store 39: 207,445,542.47

## Average Weekly Sales (Top stores)

- Store 20: 2,107,676.87
- Store 4: 2,094,712.96
- Store 14: 2,020,978.40
- Store 13: 2,003,620.31
- Store 2: 1,925,751.34
- Store 10: 1,899,424.57
- Store 27: 1,775,216.20
- Store 6: 1,564,728.19
- Store 1: 1,555,264.40
- Store 39: 1,450,668.13

## Holiday Impact (mean weekly sales)

|   Holiday_Flag |        mean |   count |
|---------------:|------------:|--------:|
|              0 | 1.04126e+06 |    5985 |
|              1 | 1.12289e+06 |     450 |

## Sales by Year

- 2010: 2,288,886,120.41
- 2011: 2,448,200,007.35
- 2012: 2,000,132,859.35


## Correlations (Weekly_Sales vs other variables)

|              |   Weekly_Sales |   Temperature |   Fuel_Price |        CPI |   Unemployment |
|:-------------|---------------:|--------------:|-------------:|-----------:|---------------:|
| Weekly_Sales |     1          |     -0.06381  |   0.00946379 | -0.0726342 |     -0.106176  |
| Temperature  |    -0.06381    |      1        |   0.144982   |  0.176888  |      0.101158  |
| Fuel_Price   |     0.00946379 |      0.144982 |   1          | -0.170642  |     -0.0346837 |
| CPI          |    -0.0726342  |      0.176888 |  -0.170642   |  1         |     -0.30202   |
| Unemployment |    -0.106176   |      0.101158 |  -0.0346837  | -0.30202   |      1         |

## Outliers (sample up to 10 rows)

|      |   Store | Date                |   Weekly_Sales |   Holiday_Flag |   Temperature |   Fuel_Price |     CPI |   Unemployment |   year | month               |
|-----:|--------:|:--------------------|---------------:|---------------:|--------------:|-------------:|--------:|---------------:|-------:|:--------------------|
|  189 |       2 | 2010-12-24 00:00:00 |    3.43601e+06 |              0 |         49.97 |        2.886 | 211.065 |          8.163 |   2010 | 2010-12-01 00:00:00 |
|  241 |       2 | 2011-12-23 00:00:00 |    3.22437e+06 |              0 |         46.66 |        3.112 | 219     |          7.441 |   2011 | 2011-12-01 00:00:00 |
|  471 |       4 | 2010-11-26 00:00:00 |    2.78947e+06 |              1 |         48.08 |        2.752 | 126.669 |          7.127 |   2010 | 2010-11-01 00:00:00 |
|  475 |       4 | 2010-12-24 00:00:00 |    3.52671e+06 |              0 |         43.21 |        2.887 | 126.984 |          7.127 |   2010 | 2010-12-01 00:00:00 |
|  523 |       4 | 2011-11-25 00:00:00 |    3.0047e+06  |              1 |         47.96 |        3.225 | 129.836 |          5.143 |   2011 | 2011-11-01 00:00:00 |
|  526 |       4 | 2011-12-16 00:00:00 |    2.7714e+06  |              0 |         36.44 |        3.149 | 129.898 |          5.143 |   2011 | 2011-12-01 00:00:00 |
|  527 |       4 | 2011-12-23 00:00:00 |    3.67639e+06 |              0 |         35.92 |        3.103 | 129.985 |          5.143 |   2011 | 2011-12-01 00:00:00 |
| 1329 |      10 | 2010-11-26 00:00:00 |    2.93995e+06 |              1 |         55.33 |        3.162 | 126.669 |          9.003 |   2010 | 2010-11-01 00:00:00 |
| 1332 |      10 | 2010-12-17 00:00:00 |    2.81165e+06 |              0 |         59.15 |        3.125 | 126.879 |          9.003 |   2010 | 2010-12-01 00:00:00 |
| 1333 |      10 | 2010-12-24 00:00:00 |    3.74906e+06 |              0 |         57.06 |        3.236 | 126.984 |          9.003 |   2010 | 2010-12-01 00:00:00 |

## Recommendations

- Investigate high-performing stores for replicable strategies.
- Examine months with peaks for seasonal drivers and promotions.
- Check correlation results: variables with strong correlation to Weekly_Sales may be useful features for forecasting.
- Consider time-series forecasting models after further cleaning.
