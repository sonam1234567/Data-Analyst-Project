-- data cleaning 
/* The table PortfolioProject.layoffs consists of the raw data */
-- select * from PortfolioProject.layoffs

-- duplicate raw data creation so we wont touch the real raw data.
-- Process for removing the duplicate data from the table.
/* First we need to create a similar copy of the PortfolioProject.layoffs which is the raw
data.
-- Creating a duplicate of the raw data so that the raw data is not affected at all.
*/
-- create table layoffs_staging like PortfolioProject.layoffs
-- Inserting all the values of the layoffs to staging layoffs.
-- insert layoffs_staging select * from PortfolioProject.layoffs

/*Now that we have the raw data suplicated inside the layoffs_staging we are good to process
and clean data */

-- 1. Remove duplicates
-- If we have a unique column it would make it easier.
-- To remove the duplicate we created a row_num which identifies number of duplicate column. Then we create another table where we can insert
-- the row num values and delete the duplicate values.
-- The row_number() assign a sequential ranking to each new record.
-- This row_number and partition by are used for larger data sets.
/*
select *, 
row_number() over(partition by 
company,industry,total_laid_off,percentage_laid_off,'date') as row_num
from layoffs_staging;
*/

-- Checking which has the duplicate values. 
/*
with duplicate_cte as
(
select *, 
row_number() over(partition by 
company,location,industry,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num
from layoffs_staging
)
select * from duplicate_cte where row_num > 1
*/

-- create table layoffs_staging2 like layoffs_staging
-- SELECT * FROM demo.layoffs_staging2;

-- Adding a column to the table.
-- alter table layoffs_staging2 add row_num int

/*
insert into layoffs_staging2
select *, 
row_number() over(partition by 
company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num
from layoffs_staging
*/

/*Rechecking if the results are correct */
-- select * from layoffs_staging where company = 'Oyster'

-- select * from layoffs_staging2 where company = 'Oyster'
-- delete from layoffs_staging2 where row_num > 1

/* After doing this we have removed all the duplicate row from the table and put the result
into the layoffs_staging2.
*/
-- select * from layoffs_staging2


-- 2.Standardize the data.
-- Removing the spaces from the column.
-- select trim(company) from layoffs_staging2
/*
update layoffs_staging2
set company = trim(company)
*/
-- select company from layoffs_staging2
-- select distinct industry from layoffs_staging2 order by 1
-- select distinct location from layoffs_staging2 order by 1
-- select distinct country from layoffs_staging2 order by 1
/*
update layoffs_staging2
set country = 'United States'
where country like 'United States%'
*/

-- we can use str to date to update this field
/*
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');
*/
-- now we can convert the data type properly
/*
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;
*/
-- alter table layoffs_staging2 modify column `date` date
-- select * from layoffs_staging2 where row_num > 1




-- 3.Null vlaues or blank vlaues

-- select * from layoffs_staging2 where total_laid_off is null and percentage_laid_off is null;
-- select * from layoffs_staging2 where industry is null or industry = '';
-- select * from layoffs_staging2 where industry is null or industry = ''

-- for blank values first convert them to null and then convert them to desired values.
/*
update layoffs_staging2
set industry = null
where industry = ''
*/

/*
update layoffs_staging2
set industry = 'travel'
where industry is null
*/

-- select * from layoffs_staging2 where industry is null or industry = ' '




-- 4. Remove ANY columns
-- select * from layoffs_staging2 where total_laid_off is null and percentage_laid_off is null
-- delete from layoffs_staging2 where total_laid_off is null and percentage_laid_off is null
-- select * from layoffs_staging2;
/*
alter table layoffs_staging2
drop column row_num;
*/