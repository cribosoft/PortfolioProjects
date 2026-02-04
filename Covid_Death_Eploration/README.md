 1. COVID‑19 Data Exploration (SQL)
https://img.shields.io/badge/Project-Active-brightgreen
https://img.shields.io/badge/SQL-Data%20Exploration-blue
https://img.shields.io/badge/Portfolio-Data%20Analytics-purple
Explorare avansată a datelor COVID‑19 folosind SQL: analize de mortalitate, infectare, vaccinare și evoluții globale. Proiectul demonstrează abilități solide de interogare, agregare, funcții de fereastră și pregătirea datelor pentru vizualizări BI.

2. Highlights
- Complete analysis of COVID-19 datasets (cases, deaths, vaccinations)
- Advanced SQL functions: Window functions, CTEs, temporary tables, views
- Insights on infection rates, mortality and vaccination progress
- Ready for integration into Power BI / Tableau

3. What questions do we answer in this project?
This SQL script answers essential questions about the COVID-19 pandemic:
- How quickly did the virus spread in different countries
- What were the mortality rates and how did they vary between continents
- What percentage of the population was infected
- How has vaccination evolved over time
- What are the major differences between regions
Everything is structured to be easily reused in BI analyses.

4. Project structure
'''Covid_Death_data_exploration.sql
│
├── 01. Raw data exploration
├── 02. Case & death analyses
├── 03. Population-based infection rates
├── 04. Country and continent aggregations
├── 05. Global analyses
├── 06. Join with vaccinations
├── 07. CTE for cumulative vaccinations
├── 08. Temporary table for additional calculations
└── 09. Final view for BI visualizations'''



5.  Examples of analyses
     -  Mortality rate
'''SELECT location, dates,
       total_cases,
       total_deaths,
       (total_deaths / total_cases) * 100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location = 'Romania'
ORDER BY 1, 2;
'''

   -  Percentage of the population infected
'''SELECT location, population,
       MAX(total_cases) AS HighestInfectionCount,
       MAX((total_cases / population) * 100) AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC;'''


  -  Cumulative vaccinations (window function)
```SUM(new_vaccinations) OVER (
    PARTITION BY location
    ORDER BY date
) AS RollingPeopleVaccinated
```


6. Technologies & concepts used
- SQL Server
- Joins (inner, left)
- Window Functions
- CTEs
- Temporary tables
- BI views
- Aggregations & type conversions


7.  Insights extracted
- Countries with the highest infection rates per population
- Major differences between continents in terms of mortality
- Evolution of vaccination over time for each country
- Percentage of vaccinated population calculated cumulatively

8.  Future Directions
- Power BI Dashboard connected to the final view
- Additional analyses: pandemic waves, regional comparisons
- Query performance optimization
- SQL script for table creation (schema definition)

!!!    Contributions
Feedback, suggestions or improvements are welcome.
This project is part of my Data Analytics portfolio.
