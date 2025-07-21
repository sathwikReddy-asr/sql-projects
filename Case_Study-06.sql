--Platform used:Mode.com
--Tables used:tutorial.yammer_users  and  tutorial.yammer_experiments and   tutorial.yammer_events and   tutorial.yammer_emails
--Date:10-07-2025

--Q1: Find the number of users per language type ?
select language,count(*) as total_users                                                           --selecting column from the table and counting all the records in table and giving alias name
from tutorial.yammer_users
group by 1;                                                                                       --grouping the data by language

--Q2: Write a query to find how many users are part of experiments ?
select b.experiment,count(*) as total_users                                                        --selecting a column from b table and counting all records and giving alias name
from tutorial.yammer_users as a                                                                    --giving alias name as a for table 1
join tutorial.yammer_experiments as b                                                              --joining the table 2 and giving alias name as b
on a.user_id=b.user_id                                                                             --giving the same column from two tables and performing join
group by 1;                                                                                        --grouping the data by experiment

--Q3: Find the number of users in experiment per language category ?
select b.experiment,a.language,count(*) as total_users                                               --selecting the multiple columns from two tables and counting the records and giving alias name
from tutorial.yammer_users as a                                                                      --giving alias name for table 1 as a
join tutorial.yammer_experiments as b                                                                --giving alias name for table 2 as b and performing join
on a.user_id=b.user_id                                                                               --giving the same column from the two tables
group by 1,2;                                                                                        --grouping the data by experiment and language

--Q4: Write a query to find how many users have received at least one email ? 
select count(distinct(a.user_id)) as total_users_recieved_one_mail                                    --selecting the count of unique user id's and giving alias name
from tutorial.yammer_users as a                                                                       --giving alias name for table 1 as a
join tutorial.yammer_emails as b                                                                      --giving alias name for table 2 as b  and performing the join
on a.user_id=b.user_id;                                                                               --giving the same column's from the two tables

--Q5: Write a query to find how many users per company id have received at least one email ?
select a.company_id,count(distinct(a.user_id)) as recieved_atleast_one_email                          --selecting column and counting the unique user id's and giving alias name
from tutorial.yammer_users as a                                                                       --givung alias name for table 1 as a
join tutorial.yammer_emails as b                                                                      --giving alias name for table 2 as b and performing join
on a.user_id=b.user_id                                                                                --giving the same columns from two tables
group by 1;                                                                                           --grouping the data by company_id

--Q6: Write a query to find how many users have received at least one event ?
select count(distinct(a.user_id)) as recieved_atleast_one_event                                       --selecting the count of unique user_id and giving alias name
from tutorial.yammer_users as a                                                                       --giving alias name for table 1 as a
join tutorial.yammer_events as b                                                                      --giving alias name for table 2 as b and performing the join
on a.user_id=b.user_id;                                                                               --giving the same columns in two tables

--Q7: Write a query to find how many distinct users per state have at least one event ?
select a.state,count(distinct(a.user_id)) as have_atleast_one_event                                   --selecting column and counting the unique user_id's and giving alias name
from tutorial.yammer_users as a                                                                       --giving alias name for table 1 as a
join tutorial.yammer_events as b                                                                      --giving alias name for table 2 as b and performing join
on a.user_id=b.user_id                                                                                --giving same column's in two tables
group by 1;                                                                                           --grouping the data by state
