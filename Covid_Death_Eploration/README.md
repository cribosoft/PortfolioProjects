📊 COVID‑19 Data Exploration (SQL)
https://img.shields.io/badge/Project-Active-brightgreen
https://img.shields.io/badge/SQL-Data%20Exploration-blue
https://img.shields.io/badge/Portfolio-Data%20Analytics-purple
Explorare avansată a datelor COVID‑19 folosind SQL: analize de mortalitate, infectare, vaccinare și evoluții globale. Proiectul demonstrează abilități solide de interogare, agregare, funcții de fereastră și pregătirea datelor pentru vizualizări BI.

🚀 Highlights
- Analiză completă a dataset‑urilor COVID‑19 (cazuri, decese, vaccinări)
- Funcții SQL avansate: window functions, CTE-uri, tabele temporare, view-uri
- Insight-uri despre rate de infectare, mortalitate și progresul vaccinării
- Pregătit pentru integrare în Power BI / Tableau

🧠 Ce rezolvă proiectul
Acest script SQL răspunde la întrebări esențiale despre pandemia COVID‑19:
- Cât de rapid s-a răspândit virusul în diferite țări
- Care au fost ratele de mortalitate și cum au variat între continente
- Ce procent din populație a fost infectat
- Cum a evoluat vaccinarea în timp
- Care sunt diferențele majore între regiuni
Totul este structurat pentru a fi ușor de reutilizat în analize BI.

🗂️ Structura proiectului
Covid_Death_data_exploration.sql
│
├── 01. Explorare date brute
├── 02. Analize cazuri & decese
├── 03. Rate de infectare raportate la populație
├── 04. Agregări pe țări și continente
├── 05. Analize globale
├── 06. Join cu vaccinări
├── 07. CTE pentru vaccinări cumulative
├── 08. Tabel temporar pentru calcule suplimentare
└── 09. View final pentru vizualizări BI



🔍 Exemple de analize
📌 Rata mortalității
SELECT location, date,
       total_cases,
       total_deaths,
       (total_deaths / total_cases) * 100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location = 'Romania'
ORDER BY 1, 2;


📌 Procentul populației infectate
SELECT location, population,
       MAX(total_cases) AS HighestInfectionCount,
       MAX((total_cases / population) * 100) AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC;


📌 Vaccinări cumulative (window function)
SUM(new_vaccinations) OVER (
    PARTITION BY location
    ORDER BY date
) AS RollingPeopleVaccinated



🛠️ Tehnologii & concepte folosite
- SQL Server
- Joins (inner, left)
- Window Functions
- CTE-uri
- Tabele temporare
- View-uri pentru BI
- Agregări & conversii de tip

📈 Insight-uri extrase
- Țările cu cele mai mari rate de infectare raportat la populație
- Diferențe majore între continente în ceea ce privește mortalitatea
- Evoluția vaccinării în timp pentru fiecare țară
- Procentul populației vaccinate calculat cumulativ

🎯 Direcții viitoare
- Dashboard Power BI conectat la view-ul final
- Analize suplimentare: valuri pandemice, comparații regionale
- Optimizarea performanței interogărilor
- Script SQL pentru crearea tabelelor (schema definition)

🤝 Contribuții
Feedback, sugestii sau îmbunătățiri sunt binevenite.
Acest proiect face parte din portofoliul meu de Data Analytics.
