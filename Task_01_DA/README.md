# Task_01_DA
This is my first task of my Unpaid internship. I have completed it with my full efforts. Hope it is good.

# Skillytixs Internship – Task 1  
## **Data Cleaning & Preprocessing**  
**Dataset:** Medical Appointment No Shows  
**Tools Used:** Python, Pandas  

---

## **Objective**
The goal of this task is to clean and preprocess the raw dataset by handling:
- Missing values  
- Duplicate records  
- Inconsistent formatting  
- Incorrect data types  
- Unstandardized text fields  
- Date formatting issues  

This prepares the dataset for further analysis and modeling.

---

## **Dataset Used**
**File:** `KaggleV2-May-2016.csv`  
This dataset contains information about medical appointments in Brazil and whether a patient showed up or not.

---

## 🔧 **Steps Performed**

### **1️. Loaded and Inspected the Dataset**
- Read the raw CSV into pandas  
- Viewed sample rows, column details, missing values, and data types  
- Checked dataset shape and structure  

---

### **2️. Handled Duplicate Records**
- Identified duplicates using `df.duplicated().sum()`  
- Removed duplicates with `df.drop_duplicates()`  

---

### **3️. Cleaned & Standardized Column Names**
Renamed all columns to:
- lowercase  
- snake_case format  
- removed spaces and hyphens  

Example:  
`ScheduledDay` → `scheduledday`  
`AppointmentDay` → `appointmentday`  
`No-show` → `no_show`

---

### **4️. Converted Columns to Proper Data Types**
- Converted `scheduledday` and `appointmentday` to datetime  
- Converted `age` to integer  
- Ensured categorical fields have consistent formats  

---

### **5️. Standardized Text Fields**
- `gender` converted to uppercase (`M`, `F`)  
- `neighbourhood` formatted to title case  
- Converted `no_show` from `"Yes"/"No"` → `1/0`  

---

