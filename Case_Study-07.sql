--Platform used:Mode.com
--Tables used:tutorial.us_housing_units  and  tutorial.us_housing_units_completed
--Date:16-07-2025

--Q1: Write a query to join the tables tutorial.us_housing_units and tutorial.us_housing_units_completed. Return all the records ?
select a.*,b.*
from tutorial.us_housing_units as a
join tutorial.us_housing_units_completed as b
on a.year=b.year;

--Q2: Write a query to return year, month, month_name and difference between the units and units completed for west from 2000 onwards ?
select a.year,a.month,a.month_name,a.west,b.west,(a.west-b.west) as difference 
from tutorial.us_housing_units as a
join tutorial.us_housing_units_completed as b
on a.year=b.year 
where a.west>=2000;
