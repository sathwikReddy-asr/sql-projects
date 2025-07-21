--Platform used:Mode.com
--Tables used:tutorial.us_housing_units  and  tutorial.us_housing_units_completed
--Date:13-07-2025

--Q1: Write a query to join the tables tutorial.us_housing_units and tutorial.us_housing_units_completed. Return all the records ?
select a.*,b.*                                                                                       --selecting all records from both tables
from tutorial.us_housing_units as a                                                                  --giving alias name for table 1 as a
join tutorial.us_housing_units_completed as b                                                        --giving alias name for table 2 as b and performing join
on a.year=b.year;                                                                                    --giving same columns from two tables

--Q2: Write a query to return year, month, month_name and difference between the units and units completed for west from 2000 onwards ?
select a.year,a.month,a.month_name,a.west,b.west,(a.west-b.west) as difference                        --selecting multiple columns from boththe tables and making subtraction and giving alias name
from tutorial.us_housing_units as a                                                                   --giving alias name for table 1 as a 
join tutorial.us_housing_units_completed as b                                                         --giving alias name for table 2 as b and performing the join
on a.year=b.year                                                                                      --giving same columns from two tables
where a.west>=2000;                                                                                   --giving condition for units copleted for west from 2000 onwards
