-- Explanatory Data Analysis 
# 3 -- TOP 10 COUNTRY that hit the most by layoffs 
# 4 -- total laidoffs by YEAR 
# 5 -- rolling total per month (from 2020 - 2023) 
# 6 -- TOP 5 Total laid offs of by company by year (with ranking)

# 1 
# My analysis: Amazon,a big company is top 1 with the most layoffs from 2020-2023, followed by Google and Meta.
# Travel and Delivery company slips in top 10 as UBER and Booking.com includes in top 10
select company, sum(total_laid_off) total
from layoffs_staging2
group by company
order by 2 desc
limit 10
;

# 2 
# My analysis: Consumer, Retail, and Transportation is the top 4 industries affected due to the fact --
             -- that this is from 2020-2023 which means that this industry is directly hit by the pandemic
-- also, healthcare, food, and real-estate is included in top 10 by having an indirect hit due to the closing of restaurants, --
             -- some clinics, and real estate services.
select industry, sum(total_laid_off) total
from layoffs_staging2
group by industry
order by 2 desc
limit 10
;

# 3 -- TOP 10 COUNTRY that hit the most by layoffs 
# my analysis, the country that hit the most layoffs from 2020-2023 is USA with 250k layoffs in a 3 year span.
 -- This is followed by India with almost 36k which i think is natural due to the fact that india has the biggest workforce in the world
# Brazil is also on top 10 due to the fact that Brazil is also the top country being outsorced by big companies.
select country, sum(total_laid_off) total
from layoffs_staging2
group by country
order by 2 desc
limit 10
;

# 4 
# despite the pandemic, it is unexpected thata 2022 and 2023 got the highest laidoffs from 2020-2023
# this suggest that it is not just the pandemic is the reason why they got laidoff, but there is another reason too that we don't know
select substring(`date`, 1, 4) `year`, sum(total_laid_off)
from layoffs_staging2
where  substring(`date`, 1, 4) is not null
group by `year`
order by 1
;

# 5 -- rolling total per month (from 2020 - 2023)
# my analysis: this query is a total and rolling total by from 03-2020 up to 03-2023
with CTE_monthly_total as
(
select substring(`date`,1,7) `month`, sum(total_laid_off) total
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1
)
select *, sum(total) over(order by `month`) as rolling_total
from CTE_monthly_total
;

# 6 -- TOP 5 Total laid offs of by company by year (with ranking)
# my analysis: this shows the top 5 company who has the highest layoffs from 2020-2023
#      -- Uber got the top layoffs in 2020, Bytedance is the top on 2021, while META owned by Zuckerberg is the top layoffs in 2022
		-- and Google got the top layoffs in the first 3 months of 2023
with CTE as
(
select company, year(`date`) years, sum(total_laid_off) total
from layoffs_staging2
where year(`date`) is not null
group by company, years
order by years, total desc
), CTE2 as
(
select *, dense_rank() over(partition by years order by total desc) as ranking
from CTE
)
select *
from CTE2
where ranking <= 5
;
