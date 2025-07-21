--Platform used:Mode.com
--Tables used:tutorial.crunchbase_companies  and   tutorial.crunchbase_acquisitions  and  tutorial.crunchbase_investments_part1
--Date:18-07-2025

--Q1: Write a query that performs a left join between the tutorial.crunchbase_companies table and tutorial.crunchbase_acquisitions table. List the individual rows ?
select a.*,b.*                                                                                 --selecting all records from two tables
from tutorial.crunchbase_companies as a                                                        --giving alias name for table 1 as a
left join tutorial.crunchbase_acquisitions as b                                                --giving alias name for table 2 as b and performing left join
on a.id=b.id and a.permalink=b.company_permalink;                                              --giving the same columns from two tables

--Q2: Count the number of unique companies (don't double-count companies) and unique acquired companies ?
select count(distinct(b.company_permalink)) as unique_qcquired_companies,count(distinct(a.permalink)) as unique_companies        --selecting the count of unique companies and acquired companies and giving alias names
from tutorial.crunchbase_companies as a                                                                                          --giving alias name for table 1 as a
left join tutorial.crunchbase_acquisitions as b                                                                                  --giving alias name for table 2 as b and performing left join
on a.permalink=b.company_permalink;                                                                                              --giving the same columns form two tables

--Q3: Write a query to give a count of number of companies which never acquired any company ?
select count(*) as companies_never_acquired                                                     --selecting the count of all records and giving alias name
from tutorial.crunchbase_companies as a                                                         --giving alias name for table 1 as a
left join tutorial.crunchbase_acquisitions as b                                                 --giving alias name for table 2 as b and performing left join
on a.permalink=b.company_permalink                                                              --giving same columns from two tables
where b.company_permalink is null;                                                              --giving condition that companies which never acquired any company is null

--Q4: Count the number of unique companies (don't double-count companies) and unique acquired companies by state. Do not include results for which there is no state data, and order by the number of acquired companies from highest to lowest ?
select a.state_code,count(distinct(a.permalink)) as unique_companies,count(distinct(b.company_permalink)) as unique_acquired_companies          --selecting columns from table and count of unique companies and acquired companies and giving alias names
from tutorial.crunchbase_companies as a                                                                                                         --giving alias name for table 1 as a
left join tutorial.crunchbase_acquisitions as b                                                                                                 --giving alias name for table 2 as b and performing left join
on a.permalink=b.company_permalink                                                                                                              --giving the same columns from two tables
where b.acquirer_state_code is not null                                                                                                          --giving condition that there is no state data
group by 1                                                                                                                                       --grouping the result by sate_code
order by unique_acquired_companies desc;                                                                                                         --ordering the output by descending order

--Q5: Write a query that joins tutorial.crunchbase_companies and tutorial.crunchbase_investments_part1 using a FULL JOIN. Count up the number of rows that are present in one table and present in both the table ?
select sum(                                                                                                                   --selecting all rows present in both tables
case when a.permalink is not null and b.company_permalink is not null then 1 else 0 end) as rows_present_in_both_tables,
sum(case when a.permalink is not null and b.company_permalink is null then 1 else 0 end) as rows_in_companies,                --selecting rows present in table 1
sum(case when a.permalink is null and b.company_permalink is not null then 1 else 0 end) as rows_in_investments               --selecting rows present in table 2
from tutorial.crunchbase_companies as a                                                                                       --giving alias name for table 1 as a
full join tutorial.crunchbase_investments_part1 as b                                                                          --giving alias name for table 2 as b and performing full join
on a.permalink=b.company_permalink;                                                                                           --giving the same columns from both tables

--Q6: Write a query to find the records where a company received investment 5 year after founding year ?
select a.permalink,a.name,a.founded_year,d.funded_year                                                  --selecting multiple columns from two tables
from tutorial.crunchbase_companies as a                                                                 --giving alias name for table 1 as a
join tutorial.crunchbase_investments_part1 as d                                                         --giving alias name for table 2 as d and performing join
on a.permalink=d.company_permalink                                                                      --giving the same columns from two tables
where a.founded_year is not null and d.funded_year is not null and d.funded_year=a.founded_year+5;      --giving condition that founded_year and funded_year is not null and gap between them is 5 years
