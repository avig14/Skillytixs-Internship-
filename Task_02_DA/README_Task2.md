# Task 2 – Titanic Dataset EDA (Skillytixs Internship)

## Files included
- `tested.csv` — Original dataset uploaded by user (Titanic train data)
- `titanic_train_cleaned.csv` — Cleaned dataset produced by preprocessing steps
- `Titanic_EDA_Notebook.ipynb` — Notebook (provided separately) with full EDA code
- `Titanic_EDA_Report.pdf` — EDA report (provided separately)

## Objective
Perform Exploratory Data Analysis (EDA) to uncover patterns and business insights from the Titanic dataset. This cleaned file is prepared for analysis and modeling.

## Cleaning steps performed (summary)
1. Removed duplicate rows.
2. Standardized column names to lowercase snake_case.
3. Converted numeric columns (`age`, `fare`, `passengerid`) to numeric types where possible.
4. Handled missing values:
   - `embarked`: filled missing values with 'Unknown'.
   - `age`: imputed missing ages using median age grouped by `pclass` and `sex` where available; fallback to overall median.
5. Created a new column `age_imputed` (original `age` preserved) to use in EDA/modeling.
6. Extracted `title` from `name` to help in categorical analysis (Mr, Mrs, Miss, etc.).
7. Trimmed whitespace from `name` and standardized `sex` values.
8. Saved the cleaned dataset as `titanic_train_cleaned.csv`.

## How to use the cleaned dataset
- Load it in pandas:
```python
import pandas as pd
df = pd.read_csv('titanic_train_cleaned.csv')
```
- Use `age_imputed` for analyses that require a complete age value.
- The `title` column is useful for grouping by social title (e.g., 'Mrs', 'Mr', 'Miss').

## Notes & Recommendations
- `cabin` still contains many missing values; consider feature engineering (e.g., extracting cabin letter) if needed.
- `fare` is skewed; consider log transform for modeling.
- Always check for any remaining missing values before training models.

## Quick stats (before cleaning)
- Original shape: (418, 12)
- Columns: ['PassengerId', 'Survived', 'Pclass', 'Name', 'Sex', 'Age', 'SibSp', 'Parch', 'Ticket', 'Fare', 'Cabin', 'Embarked']
- Missing values before cleaning: {'PassengerId': 0, 'Survived': 0, 'Pclass': 0, 'Name': 0, 'Sex': 0, 'Age': 86, 'SibSp': 0, 'Parch': 0, 'Ticket': 0, 'Fare': 1, 'Cabin': 327, 'Embarked': 0}
- Duplicate rows removed: 0

---

Prepared for Skillytixs Data Analytics Internship — Task 2
