/* Due to some reasons the data could not be imported fully.
So whatever values we are looking at and the results we have are based on the 
data that were imported, which consists of 564 rows.
The data range is from the date of '2022-12-06', '2023-03-06'
*/ 

/*
First Solution: As for the solution for the missing imported data we found that 
the data needs to be cleaned first before importing it to the MYSQL workbench 
directly.
We have not applied this steps so far, as we are still dealing with the excel process
and how to proceed in excel to cleanse the raw data.alter
I beleive we can also write a python script to cleanse these data but it might require
some more complicated scripting as the values in the cloumns are complicated.

Second solution: We can have a mysql script to transfer data one by one,
but so far the problem seems to be that we can't use it as we are having some issues
on how to apply changes through it.
And also it is not 100% gurantted that those data transfered through those script will be 
imported sucessfully. 
*/

-- My sql exploratory data analysis.

-- select * from layoffs_staging2

/* Getting the max percentage laid off data sets */
-- select max(percentage_laid_off) from layoffs_staging2
-- select * from layoffs_staging2 where percentage_laid_off >= 1 and total_laid_off is not null
-- select * from layoffs_staging2 where percentage_laid_off >= 1 order by total_laid_off desc
-- >The max percentage laid off is 100% and it belongs to company 'Britishvolt','EMX Digital','Openpay'


/* Getting the max total laid off */
-- select * from layoffs_staging2 where percentage_laid_off >= 1 and total_laid_off >= 12000
-- Since we dont see any values or rows with such values or conditions that has been met so we stick with the total_laid_off.
-- select * from layoffs_staging2 where percentage_laid_off is not null and total_laid_off >= 12000
-- > So overall google has the highest lay off. 
-- >'Google', 'SF Bay Area', 'Consumer', '12000', '0.06', '2023-01-20', 'Post-IPO', 'United States', '26'

/*looking at both the max(total_laid_off), and  max(percentage_laid_off)*/
-- select max(total_laid_off), max(percentage_laid_off) from layoffs_staging2
-- > 12000 and 1%

/*looking at both the min(total_laid_off),and  min(percentage_laid_off)*/
-- select min(total_laid_off), min(percentage_laid_off) from layoffs_staging2
-- > 8 and 0.02%

/*looking at the min total laid off */
-- select * from layoffs_staging2 where total_laid_off <= 8 and percentage_laid_off is not null
-- >looking at the result the company 'Kinde' as laid off the lowest.

/*looking at the min percentage laid off */
-- select * from layoffs_staging2 where percentage_laid_off <= 0.02 and total_laid_off is not null
-- > 'C2FO', 'Kansas City', 'Finance', '20', '0.02', '2022-12-09', 'Series H', 'United States', '537'

-- The max funds raised by the company is Wework.
-- select max(funds_raised_millions) from layoffs_staging2
-- select * from layoffs_staging2 where funds_raised_millions >= 22200
/*'WeWork', 'New York City', 'Real Estate', '300', NULL, '2023-01-19', 'Post-IPO', 'United States', '22200' */

-- select company, sum(total_laid_off) from layoffs_staging2 group by company order by 2 desc;

-- > looking into the date range.
-- select MIN(`date`), MAX(`date`) from layoffs_staging2
-- select * from layoffs_staging2 where date = '2022-12-06'

/*Looking at the data we are going to find the total laid off values 
based on the indutry,company,location,country,date. */

/*
select industry,sum(total_laid_off) from layoffs_staging2
where industry is not null and total_laid_off is not null
group by industry
order by 2 desc
-- Result 'Other', '28767' with the highest layoff based on industry.
*/

/*
select industry,sum(total_laid_off) from layoffs_staging2
where industry is not null and total_laid_off is not null
group by industry
order by 2 
-- Result 'Manufacturing', '20' with the lowest layoff based on industry.
*/

/*
select company,sum(total_laid_off) from layoffs_staging2
where company is not null and total_laid_off is not null
group by company
order by 2 desc
-- Result 'Google', '12000' with the highest layoff based on company.

*/

/*
select company,sum(total_laid_off) from layoffs_staging2
where company is not null and total_laid_off is not null
group by company
order by 2 
-- Result 'Kinde', '8' with the Lowest layoff based on company.
*/

/*
select location,sum(total_laid_off) from layoffs_staging2
where location is not null and total_laid_off is not null
group by location
order by 2 desc
-- Result 'SF Bay Area', '45623' with the highest layoff based on location.
*/

/*
select location,sum(total_laid_off) from layoffs_staging2
where location is not null and total_laid_off is not null
group by location
order by 2 
-- Result 'Kansas City', '20' with the Lowest layoff based on location.
*/

/*
select country,sum(total_laid_off) from layoffs_staging2
where country is not null and total_laid_off is not null
group by country
order by 2 desc
-- Result 'United States', '94985' with the highest layoff based on country.
*/

/*
select country,sum(total_laid_off) from layoffs_staging2
where country is not null and total_laid_off is not null
group by country
order by 2 
-- Result 'Ireland', '27' with the Lowest layoff based on country.
*/

/*
select date,sum(total_laid_off) from layoffs_staging2
where date is not null and total_laid_off is not null
group by date
order by 2 desc
-- Result '2023-01-04', '16171' with the highest layoff based on date.
*/

/*
select date,sum(total_laid_off) from layoffs_staging2
where date is not null and total_laid_off is not null
group by date
order by 2 
-- Result '2022-12-19', '18' with the lowest layoff based on date.
*/

/* Company with the highest funds raised */

/*
select company, sum(funds_raised_millions) from layoffs_staging2 
where company is not null and funds_raised_millions is not null
group by company
order by 2 desc
-- The highest funds raised is by 'Twitter', '25800'
*/

/*
select company, sum(funds_raised_millions) from layoffs_staging2 
where company is not null and funds_raised_millions is not null
group by company
order by 2 
-- The lowest funds raised is by 'Edifecs', '1' and 'Edifecs', '1'
*/

/*
-- The highest number of companies in a location is 'Albany', '480'
select location,row_number() over (order by location desc) as val from layoffs_staging2
order by 2 desc
*/

/*
-- The lowest number of companies in a location is 'Wilmington', '1'
select location,row_number() over (order by location desc) as val from layoffs_staging2
order by 2 
*/

-- The Total Employees, total_laid_off divided by percentage_laid_off
/*
ALTER TABLE layoffs_staging2
ADD Total_Employee int;
*/

-- select * from layoffs_staging2
/*
insert into layoffs_staging2(Total_Employee)
values(1000000)
*/

/*
select Firstname, lastname, Jobtitle, salary,
case
	when jobtitle = 'salesman' Then salary + (salary * .10)
    when jobtitle = 'accountant' Then salary + (salary * .5)
    when jobtitle = 'HR' Then salary + (salary * .000001)
    Else Salary + (salary * .03)
end as SalaryAfterRaise
from EmployeeDemography join EmployeeSalary
on EmployeeDemography.EmpolyeeID = EmployeeSalary.EmployeeID
*/

/*
select Total_Employee,
case
	when total_laid_off is null or percentage_laid_off is null Then Total_Employee = 0
	else Total_Employee = 0
end as totalemp
from layoffs_staging2
*/

-- select * from layoffs_staging2

-- select total_laid_off,percentage_laid_off,total_laid_off / percentage_laid_off as total from layoffs_staging2

/* Getting the total employee of companies whose both percentage_laid_off and Total_laid_off is not null. */
/*
with Total_Employee_cte As
(select *,total_laid_off / percentage_laid_off as total_employee from layoffs_staging2
where percentage_laid_off is not null and total_laid_off is not null
)
-- select * from total_employee_cte
select company,sum(total_employee) from total_employee_cte group by company order by 2
*/
-- > from the above results the 'Amazon', '400000' has highest employee.
-- > 'Kinde', '28.57142857142857' has the lowest employee.

/* rolling total layoff */
/*
select substring(`date`,1,7) as `Month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc
*/

/*
with rolling_cte as
(select substring(`date`,1,7) as `Month`, sum(total_laid_off) as total_off
from layoffs_staging2
group by `month`
order by 1 asc)
select `month`,total_off, sum(total_off) over (order by `month`) as rolling_total
from rolling_cte
*/

/*
select year(`date`),sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc
*/

/*
select stage,sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc

select stage,sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc
*/
WITH Company_Year AS 
(
  SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging2
  GROUP BY company, YEAR(date)
)
, Company_Year_Rank AS (
  SELECT company, years, total_laid_off, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM Company_Year
)
SELECT company, years, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 3
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;
