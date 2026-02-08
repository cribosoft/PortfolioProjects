# Nashville Housing - Data Cleaning in SQL

## 📌 Project Overview
This project focuses on the **Data Cleaning** phase of the data analysis process. Using a dataset containing housing information from Nashville, TN, I performed various SQL queries to transform raw, "dirty" data into a clean, structured format ready for analysis.

Data cleaning is often the most time-consuming part of a data scientist's job, and this project demonstrates my ability to handle inconsistencies, null values, and poorly formatted strings using **T-SQL**.

## 🛠️ Tools & Technologies
* **Language:** SQL (Transact-SQL)
* **Environment:** Microsoft SQL Server Management Studio (SSMS)
* **Key Concepts:** Joins, CTEs, Window Functions (ROW_NUMBER), String Manipulation, CASE Statements.

## 🧹 Data Cleaning Steps
Here is a breakdown of the transformations applied to the dataset:

### 1. Standardize Date Format
Converted the `SaleDate` column from a `DateTime` format (which included unnecessary timestamps) to a standardized `Date` format.

### 2. Populate Property Address Data
Identified rows where the `PropertyAddress` was null. By using a **Self-Join** on `ParcelID`, I populated the missing addresses with existing data from duplicate Parcel IDs.

### 3. Breaking out Address into Individual Columns
The address data was stored as a single string (Address, City, State). I used `SUBSTRING`, `CHARINDEX`, and `PARSENAME` to split these into three distinct columns:
* **Address**
* **City**
* **State**

### 4. Uniformizing "Sold as Vacant" Field
The `SoldAsVacant` column contained inconsistent entries: "Y", "N", "Yes", and "No". I used a `CASE` statement to standardize all entries to "Yes" and "No".

### 5. Remove Duplicates
Used **CTEs** and the `ROW_NUMBER()` window function to identify and remove duplicate records based on unique combinations of ParcelID, Address, SalePrice, and SaleDate.

### 6. Delete Unused Columns
Cleaned up the final table by removing columns that were redundant or no longer needed after the splitting/transformation process (e.g., the original raw Address columns).

## 🚀 How to Use
1.  Download the `Nashville Housing Data for Data Cleaning.xlsx` file.
2.  Import the data into your SQL Server instance.
3.  Run the SQL script provided in this repository (`Nashville_Data_Cleaning_Queries.sql`) in sequence.

## 📈 Conclusion
By the end of this project, the dataset was reduced from a fragmented state to a clean, reliable source of information. This process ensures that any subsequent visualization or statistical analysis is built on a solid, accurate foundation.

---
**Author:** [Cribosoft]
**Project Category:** Data Engineering / Data Analytics
