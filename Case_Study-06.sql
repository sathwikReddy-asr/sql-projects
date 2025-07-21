--Platform used:Mode.com
--Tables used:tutorial.yammer_users  and  tutorial.yammer_experiments and   tutorial.yammer_events and   tutorial.yammer_emails
--Date:10-07-2025

--Q1: Find the number of users per language type ?
select language,count(*) as total_users                                                           --selecting column from the table and counting all the records in table
from tutorial.yammer_users
group by 1;

--Q2: Write a query to find how many users are part of experiments ?
select b.experiment,count(*) as total_users
from tutorial.yammer_users as a
join tutorial.yammer_experiments as b
on a.user_id=b.user_id 
group by 1;

--Q3: Find the number of users in experiment per language category ?
select b.experiment,a.language,count(*) as total_users
from tutorial.yammer_users as a
join tutorial.yammer_experiments as b
on a.user_id=b.user_id 
group by 1,2;

--Q4: Write a query to find how many users have received at least one email ? 
select count(distinct(a.user_id)) as total_users_recieved_one_mail
from tutorial.yammer_users as a
join tutorial.yammer_emails as b
on a.user_id=b.user_id;

--Q5: Write a query to find how many users per company id have received at least one email ?
select a.company_id,count(distinct(a.user_id)) as recieved_atleast_one_email
from tutorial.yammer_users as a
join tutorial.yammer_emails as b
on a.user_id=b.user_id
group by 1;

--Q6: Write a query to find how many users have received at least one event ?
select count(distinct(a.user_id)) as recieved_atleast_one_event
from tutorial.yammer_users as a
join tutorial.yammer_events as b
on a.user_id=b.user_id;

--Q7: Write a query to find how many distinct users per state have at least one event ?
select a.state,count(distinct(a.user_id)) as have_atleast_one_event
from tutorial.yammer_users as a
join tutorial.yammer_events as b
on a.user_id=b.user_id
group by 1;
