--Platform used:Mode.com
--Table used:tutorial.crunchbase_companies 
--Date:07-06-2025

--Q1: Find the list of unique country codes in the data ?
select distinct (country_code) as unique_country_code
from tutorial.crunchbase_companies;

--Q2: Find the list of all the companies funded on or after 2009 ?
select *
from tutorial.crunchbase_companies 
where founded_year>=2009;

--Q3 : Find the list of all the companies founded before 2015 and have received funding of at least 1 Mn USD or after 2009 ?
select *
from tutorial.crunchbase_companies 
where founded_year<2015 and (funding_total_usd >=1000000 or founded_year >2009);

--Q4:	Find the list of all the companies that has funding between 3 to 6 rounds ?
select * 
from tutorial.crunchbase_companies 
where funding_rounds between 3 and 6;

--Q5 : Find the list of all the companies founded in India(IN), the USA(USA), and the Great Britain(GBR) ?
select * 
from tutorial.crunchbase_companies 
where country_code in ('IND','USA','GBR');

--Q6: Find the list of all the companies which are either acquired or operating ?
select * 
from tutorial.crunchbase_companies 
where status='operating' or status= 'acquired';

select * 
from tutorial.crunchbase_companies 
where status in ('operating','acquired');

--Q7: Find the list of all the companies starting with the letter S ?
select * 
from tutorial.crunchbase_companies 
where name like 'S%';

--Q8: Find the list of all the companies founded in the city containing word ‘Park’ ?
select * 
from tutorial.crunchbase_companies 
where city like '%Park%';

--Q9: Find the list of all the companies which are operated outside the USA(USA), Australia(AUS), and Argentina(ARG) ?
select *  
from tutorial.crunchbase_companies 
where country_code not in ('USA','AUS','ARG');

--Q10: Find the list of all the companies founded after 2015 or have received funding of at least 1 Mn USD ?
select * 
from tutorial.crunchbase_companies 
where founded_year<2015 and funding_total_usd >=1000000;

--Q11: Find the list of unique country codes in the data excluding the null values ?
select distinct (country_code) as unique_country_code
from tutorial.crunchbase_companies
where country_code is not null and country_code<>'';
