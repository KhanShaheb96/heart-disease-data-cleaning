# Heart Disease Data Cleaning and Preprocessing (R Project)

## 📄 Project Overview

This project focuses on **data cleaning, preprocessing, and preparation** for a **Heart Disease Prediction dataset** using **R programming**.

The dataset was modified from the original UCI Heart Disease dataset to explore real-world data challenges like missing values, outliers, invalid values, imbalanced classes, and the need for normalization.

---

## 🛠 Techniques Applied

- **Handling Missing Values**  
  ➔ Replaced missing numerical values with mean and discrete values with mode.

- **Outlier Detection and Removal**  
  ➔ Used **Boxplots** and **IQR method** to detect and clean outliers in the `cholesterol (chol)` column.

- **Data Type Conversion**  
  ➔ Converted categorical text values into **numeric labels** (e.g., `restecg`, `num`).

- **Normalization**  
  ➔ Applied **Min-Max Scaling** to `trestbps` (Resting Blood Pressure) for feature standardization.

- **Duplicate Removal**  
  ➔ Removed duplicate records and duplicate IDs.

- **Invalid Data Correction**  
  ➔ Replaced invalid values (`<= 0`) in `trestbps` and `thalch` with the mean of valid entries.

- **Data Filtering**  
  ➔ Selected patients with **cholesterol > 200** for targeted analysis.

- **Handling Imbalanced Dataset**  
  ➔ Manually oversampled the minority class (`Has Disease`) using `dplyr` to achieve balanced classes.

- **Train/Test Split**  
  ➔ Randomly split data into **70% training** and **30% testing** sets.

- **Descriptive Statistics**  
  ➔ Calculated **mean, median, mode** for selected attributes.

- **Spread Measures**  
  ➔ Measured **range, IQR, variance, and standard deviation** to understand data variability.

---

## 📚 Dataset Information

- **Dataset:** Heart Disease UCI (Modified)
- **Total Observations:** 216
- **Total Attributes:** 16
- **Target Variable:** `num`  
  ➔ 0 = No Disease  
  ➔ 1 = Has Disease

---

## Technologies Used

- **R Programming Language**
- **RStudio IDE**
- **dplyr** package for data manipulation

---

## Files Included

- `heart_disease_uci - modified.csv` — Dataset file
- `data_cleaning_script.R` — R script for all preprocessing tasks
- `Midterm_Project_Report_Group10.docx` — Project report with screenshots and explanations

---

## Project Goals

- Understand and handle real-world messy data  
- Prepare data cleanly for machine learning  
- Practice full-cycle data preprocessing steps  
- Strengthen R programming and data science workflow

---




