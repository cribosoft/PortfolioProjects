# COVID-19 Data Exploration Project

## Overview
This project involves a comprehensive exploration of global COVID-19 data, focusing on infection rates, mortality statistics, and vaccination progress across different countries and continents. The goal was to transform raw data into actionable insights using advanced SQL techniques.

## Dataset
The data used in this project is sourced from [Our World in Data](https://ourworldindata.org/covid-deaths). It includes two main datasets:
* **CovidDeaths**: Contains data related to cases, deaths, and population.
* **CovidVaccinations**: Contains data related to testing and vaccination rollout.

## Key Questions Answered
* What is the likelihood of dying if you contract COVID-19 in a specific country?
* What percentage of the population has been infected over time?
* Which countries and continents have the highest death counts per population?
* How does the vaccination rollout progress daily for each country?

## SQL Skills Demonstrated
To extract meaningful insights, I utilized several advanced SQL features:
* **Joins:** Merging death and vaccination tables to correlate infection and immunization data.
* **CTEs (Common Table Expressions):** Improving readability and performing multi-step calculations on partitioned data.
* **Window Functions:** Using `OVER(PARTITION BY...)` to calculate rolling totals of vaccinations.
* **Aggregate Functions:** Utilizing `MAX`, `SUM`, and `AVG` for global and regional summaries.
* **Data Type Casting:** Converting and formatting data (e.g., `CAST` and `CONVERT`) for accurate mathematical operations.
* **Views:** Creating permanent views to store data for later visualization in tools like Tableau or Power BI.

## Project Structure
The script follows a logical flow:
1.  **Initial Exploration:** Selecting basic columns to understand the data structure.
2.  **Death Percentage Analysis:** Comparing total cases vs. total deaths.
3.  **Infection Rate Analysis:** Calculating the percentage of the population infected.
4.  **Global & Regional Rankings:** Breaking down statistics by Continent and Income Level.
5.  **Vaccination Progress:** Integrating the second dataset to track the percentage of the population vaccinated.

## Visualization
The results of these queries were designed to be exported to **Tableau** or **Power BI** for interactive dashboarding.

---

### How to Use
1.  Ensure you have a SQL Server environment (e.g., MS SQL Server Management Studio).
2.  Import the datasets as flat files into your database.
3.  Run the `Covid_Death_data_exploration.sql` script to generate the analysis.
