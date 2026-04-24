# Exploratory-Data-Analysis-Layoffs-Dataset-MySQL-
This project explores a cleaned layoffs dataset to find patterns and trends in tech company layoffs from 2020 to 2023.

## Dataset
- Source: Alex The Analyst
- Topic: Tech company layoffs data (cleaned version from my Data Cleaning Project)

## Questions I Explored
1. Which companies had the most layoffs?
- Amazon led with the highest total layoffs, followed by Google and Meta. Travel and delivery companies like Uber and Booking.com also appeared in the top 10.
2. Which industries were hit hardest?
- Consumer, Retail, and Transportation were the top affected industries — likely due to the direct impact of the pandemic. Healthcare, Food, and Real Estate also made the top 10 from indirect effects like restaurant and clinic closures.
3. Which countries had the most layoffs?
- The US had by far the most with over 250,000 layoffs across the period. India came in second, which makes sense given its large workforce. Brazil also appeared in the top 10 as a major outsourcing destination.
4. How did layoffs trend by year?
- Surprisingly, 2022 and 2023 had higher layoffs than 2020 and 2021, suggesting the pandemic wasn't the only driver — there were likely other economic factors at play.
5. Rolling monthly total (2020–2023)
- Used a CTE with a window function to calculate a running total of layoffs month by month across the full period.
6. Top 5 companies by layoffs per year
- Used two CTEs with DENSE_RANK() to rank companies within each year by total layoffs and pull the top 5 per year.
Uber got the top layoffs in 2020, Bytedance is the top on 2021, while META owned by Zuckerberg is the top layoffs in 2022
while Google got the top layoffs in the first 3 months of 2023

## Tools Used
MySQL



