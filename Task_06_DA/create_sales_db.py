import sqlite3

db_path = "sales_data.db"   # this will create the file in the same folder

conn = sqlite3.connect(db_path)
cur = conn.cursor()

cur.execute("DROP TABLE IF EXISTS sales;")
cur.execute("""
CREATE TABLE sales (
    product TEXT,
    quantity INTEGER,
    price REAL
);
""")

sample_data = [
    ("Milk", 10, 30),
    ("Bread", 5, 20),
    ("Eggs", 12, 12),
    ("Butter", 4, 50),
    ("Cheese", 6, 40),
]

cur.executemany("INSERT INTO sales VALUES (?, ?, ?);", sample_data)
conn.commit()
conn.close()

print("Created sales_data.db with sample sales table.")
