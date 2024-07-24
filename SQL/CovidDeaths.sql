-- select * from PortfolioProject.coviddeaths
/*
with duplicate_cte As
(select *,
row_number()Over(Partition by iso_code,continent,date,total_cases,new_cases) As row_num
from PortfolioProject.coviddeaths)
*/
-- select * from PortfolioProject.coviddeaths where(
select iso_code,continent,max(total_cases) as Max_cases from PortfolioProject.coviddeaths group by iso_code,continent
-- select * from PortfolioProject.coviddeaths