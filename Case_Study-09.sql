--Platform used:Mode.com
--Tables used:tutorial.patient_list
--Date:22-07-2025

--Q1: Add two additional column in the dataset: 
--● ‘Age_category’ ○ old_age: >60 ○ mid_age: 30-60 ○ young: < 30 
--● Bmi: 703*weight (lbs) /height (inches)^2    ?
select *,(703*(weight_lbs)/power(height_inches,2)) as Bmi,
  case when age >60 then 'old_age'
       when age between 30 and 60 then 'mid_age'
       when age <30 then 'young'
      else 'no_age'
end as Age_category
from tutorial.patient_list;

--Q2: Find the physician last_name who treats maximum mid_age patients ?
with abc as(
select *,
 case when age >60 then 'old_age'
       when age between 30 and 60 then 'mid_age'
       when age <30 then 'young'
      else 'no_age'
end as Age_category
from tutorial.patient_list
)
select physician_last_name,count(*) as maximum_mid_age_patients from abc
where Age_category ='mid_age'
group by physician_last_name
order by  maximum_mid_age_patients desc
limit 1;

--Q3: Write a query to return the following for each category: 
-- ● Average age 
-- ● Max height 
-- ● Min weight 
-- ● Number of patients ?
select avg(age) as average_age,max(height_inches) as maximum_height,min(weight_lbs) as minimum_weight,count(*) as number_of_patients
from tutorial.patient_list;

--Q4: List all the records where bmi is less than average bmi. Solve using CTE ?
with bmi as (
select *,
703*(weight_lbs)/power(height_inches,2) as bmi
from tutorial.patient_list
),
avg_bmi as (
select 
avg(bmi) as average_bmi
from bmi 
)
select *
from bmi
where bmi<(select (average_bmi)from avg_bmi) ;
