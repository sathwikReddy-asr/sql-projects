--Platform used:Mode.com
--Tables used:tutorial.patient_list
--Date:22-07-2025

--Q1: Add two additional column in the dataset: 
--● ‘Age_category’ ○ old_age: >60 ○ mid_age: 30-60 ○ young: < 30 
--● Bmi: 703*weight (lbs) /height (inches)^2    ?
select *,(703*(weight_lbs)/power(height_inches,2)) as Bmi,                                          --selecting all records from table and creating a new column as bmi
  case when age >60 then 'old_age'
       when age between 30 and 60 then 'mid_age'                                                    --by using case when statement creating a new column as age_category
       when age <30 then 'young'
      else 'no_age'
end as Age_category
from tutorial.patient_list;

--Q2: Find the physician last_name who treats maximum mid_age patients ?
with abc as(                                                                               --using common table expression we are storing the data in temperary table 
select *,                                                                                  --selecting all from table
 case when age >60 then 'old_age'
       when age between 30 and 60 then 'mid_age'                                           --using case when statement,creating a new column
       when age <30 then 'young'
      else 'no_age'
end as Age_category
from tutorial.patient_list
)
select physician_last_name,count(*) as maximum_mid_age_patients from abc                 --selecting a column and counting all records from cte
where Age_category ='mid_age'                                                            --giving condition that age category is equal to mid age
group by physician_last_name                                                             --grouping the data by physician last name
order by  maximum_mid_age_patients desc                                                  --ordering the output in descending order
limit 1;                                                                                 --limiting the output to 1

--Q3: Write a query to return the following for each category: 
-- ● Average age 
-- ● Max height 
-- ● Min weight 
-- ● Number of patients ?
select avg(age) as average_age,max(height_inches) as maximum_height,min(weight_lbs) as minimum_weight,count(*) as number_of_patients    --selecting the average age,max height,min weight and count of patients and giving alias names
from tutorial.patient_list;

--Q4: List all the records where bmi is less than average bmi. Solve using CTE ?
with bmi as (                                                                                     --using cte to find the bmi
select *,
703*(weight_lbs)/power(height_inches,2) as bmi
from tutorial.patient_list
),
avg_bmi as (
select                                                                                            --using bmi to find average bmi
avg(bmi) as average_bmi
from bmi 
)
select *                                                                                          --select everything from table
from bmi
where bmi<(select (average_bmi)from avg_bmi) ;                                                    --giving condition that bmi is less than average bmi to get records 
