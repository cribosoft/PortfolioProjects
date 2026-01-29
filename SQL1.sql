
Select *
From PortfolioProject ..CovidDeaths
Order by 3,4


Select *
From PortfolioProject ..CovidVaccinations
Order by 3,4

--Select the data that i will be use

Select location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject ..CovidDeaths
Order by 1,2


-- Observe Total_cases vs total_deaths
-- shows the predisposition to death if you contact the coronavirus

Select location, date, total_cases, total_deaths,  (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject ..CovidDeaths
where location like	'%romania%'
Order by 1,2

-- Looking at the total_cases vs Populations
-- find out the percentage of infected population

Select location, date, population, total_cases,  (total_cases/population)*100 as DeathPercentage
From PortfolioProject ..CovidDeaths
where location like	'%romania%'
Order by 1,2



-- Countries with highest infection rate compare to population

Select location, population, max(total_cases) as highestInfectionCount,  max(total_cases/population)*100 as PercentPopulationInfected
From PortfolioProject ..CovidDeaths
group by location, population
order by PercentPopulationInfected desc

-- Countries with highest death count compare to population

Select location, max(cast(total_deaths as int)) as TotalCountDeath
From PortfolioProject ..CovidDeaths
group by location
order by TotalCountDeath desc

-- Continent with highest death count 

Select location, max(cast(total_deaths as int)) as TotalCountDeath
From PortfolioProject ..CovidDeaths
where continent is null
group by location
order by TotalCountDeath desc

Select continent, max(cast(total_deaths as int)) as TotalCountDeath
From PortfolioProject ..CovidDeaths
where continent is not null
group by continent
order by TotalCountDeath desc


--Global numbers

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/Sum(new_cases)*100  as DeathPercentage
From PortfolioProject ..CovidDeaths
where continent is not null
--Group by date
Order by 1,2



--             PART2                --

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert (int, vac.new_vaccinations))
over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
from PortfolioProject ..CovidDeaths  dea
join PortfolioProject ..CovidVaccinations  vac
on dea.location = vac.location
and dea.date = vac.date

where dea.continent is not null
order by 2,3



--                         use CT

with PopvsVac (Continent, location, Date, Population, New_Vaccinations, RollingPeopleVacccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert (int, vac.new_vaccinations))
over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
from PortfolioProject ..CovidDeaths  dea
join PortfolioProject ..CovidVaccinations  vac
on dea.location = vac.location
and dea.date = vac.date

where dea.continent is not null
--order by 2,3
)

Select *, (RollingPeopleVacccinated/Population)*100
from PopvsVac


 
--                    TEMP Table

Drop table if exists  #PercentpopulationVaccinated
Create Table #PercentpopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVacccinated numeric
)




Insert into #PercentpopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(convert (int, vac.new_vaccinations))
over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
from PortfolioProject ..CovidDeaths  dea
join PortfolioProject ..CovidVaccinations  vac
on dea.location = vac.location
and dea.date = vac.date

where dea.continent is not null
--order by 2,3

Select *, (RollingPeopleVacccinated/Population)*100
from #PercentpopulationVaccinated


--                Creating View to store data for later visualizations
go
Create View   PercentpopulationVaccinated as
Select 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    sum(try_convert (int, vac.new_vaccinations))
      over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
from PortfolioProject ..CovidDeaths  dea
join PortfolioProject ..CovidVaccinations  vac
    on dea.location = vac.location
    and dea.date = vac.date

where dea.continent is not null
--order by 2,3
go

select * 
from PercentpopulationVaccinated