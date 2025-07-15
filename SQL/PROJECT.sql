SELECT *
FROM layooffs;

#1 . Removing duplicates
#2.  Standardization of data
#3.  Null values or Bulk values
#4 . Removing unwanted columns or rows

create table layoffs_og
like layoffs;

select *
from layoffs_og;

insert layoffs_og
select *
from layoffs;

select *
from layoffs_og;

#we operate on the temp dataset we created

select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,country,stage
,'date',funds_raised_millions) as num
from layoffs_og;

with dup_cte as ( select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,country,stage
,date,funds_raised_millions) as num
from layoffs_og)

select *
from dup_cte
where num > 1 ;

#To check if the data is correct or not for duplicates
select *
from layoffs_og
where company = 'casper';


CREATE TABLE `layoffs_og2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_og2;

insert into layoffs_og2
select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,country,stage
,date,funds_raised_millions) as num
from layoffs_og;

select *
from layoffs_og2;

DELETE
from layoffs_og2
where num > 1;

select *
from layoffs_og2
where num > 1;
#This tells us that the given data has been erased 

select *
from layoffs_og2;

#Here we didnt have an extra column or identifier so we had to create a table which has the row number which we gave ,
# and then perform the delete operation

#Standaradization

select company,trim(company)
from layoffs_og2;

update layoffs_og2
set company = trim(company);

select distinct industry
from layoffs_og2
order by 1;

select *
from layoffs_og2
where industry like 'crypto%';

update layoffs_og2
set industry = 'Crypto'
where industry like 'crypto%';

select distinct country
from layoffs_og2
where country like 'United state%';

update layoffs_og2
set country = 'United States'
where country like 'United state%';

select distinct country
from layoffs_og2
order by 1;

#But here date is in text format so we need to convert it into date format

select `date`,
STR_TO_DATE(`date`,'%m/%d/%Y')
from layoffs_og2;

UPDATE layoffs_og2
set `date` = STR_TO_DATE(`date`,'%m/%d/%Y')
;

alter table layoffs_og2
modify column `date` date;

select *
from layoffs_og2
where total_laid_off is null
and percentage_laid_off is null;


select *
from layoffs_og2
where industry = '' 
or industry is null;


select l1.industry,l2.industry
from layoffs_og2 l1
join layoffs_og2 l2
on l1.company = l2.company
where (l1.industry is null or l1.industry like '')
and l2.industry is not null;

update layoffs_og2
set industry = null
where industry = '';

update layoffs_og2 l1
join layoffs_og2 l2
 on l1.company = l2.company
 set l1.industry = l2.industry
where l1.industry is null
and l2.industry is not null;

select industry 
from layoffs_og2
order by 1;

select *
from layoffs_og2
where company like 'B%Interactive';


select *
from layoffs_og2
where total_laid_off is null
and percentage_laid_off is null;

delete
from layoffs_og2
where total_laid_off is null
and percentage_laid_off is null;


alter table layoffs_og2
drop column num;

select *
from layoffs_og2;