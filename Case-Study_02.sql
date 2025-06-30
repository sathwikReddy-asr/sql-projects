--Platform used:Mode.com
--Table used:tutorial.kag_conversion_data
--Date:15-06-2025

--Q1: Write a query to count the total number of records in the tutorial.kag_conversion_data dataset ?
select count(*) as total_records
from tutorial.kag_conversion_data;

--Q2: Write a query to count the distinct number of fb_campaign_id ?
select count(distinct(fb_campaign_id)) as count_of_unique_fb_campaign_id
from tutorial.kag_conversion_data;

--Q3: Write a query to find the maximum spent, average interest, minimum impressions for ad_id ?
select max(spent) as maximum_spent,avg(interest) as average_interest,min(impressions) as minimum_impression
from tutorial.kag_conversion_data;

--Q4: Write a query to create an additional column spent per impressions(spent/impressions) ?
select * ,spent/impressions as spent_per_impressions
from tutorial.kag_conversion_data;

--Q5: Write a query to count the ad_campaign for each age group ?
select age,count(distinct(fb_campaign_id)) as count_of_ad_campaign
from tutorial.kag_conversion_data 
group by 1;
--Q6: Write a query to calculate the average spent on ads for each gender category ?
select gender,avg(spent) as average_spent_on_ads
from tutorial.kag_conversion_data 
group by 1;

--Q7: Write a query to find the total approved conversion per xyz campaign id. Arrange the total conversion in descending order ?
select total_conversion,xyz_campaign_id,sum(approved_conversion) as total_approved_conversion
from tutorial.kag_conversion_data
group by 1,2
order by 1 desc;

--Q8: Write a query to show the fb_campaign_id and total interest per fb_campaign_id. Only show the campaign which has more than 300 interests ?
select fb_campaign_id,sum(interest) as total_interest 
from tutorial.kag_conversion_data 
group by 1
having sum(interest)>300;

--Q9: Write a query to find the age and gender segment with maximum impression to interest ratio. Return three columns - age, gender, impression_to_interest ?
select age,gender,sum(impressions)/sum(interest) as impression_to_interest
from tutorial.kag_conversion_data 
group by 1,2;

--Q10: Write a query to find the top 2 xyz_campaign_id and gender segment with the maximum total_unapproved_conversion ?
select xyz_campaign_id,gender,approved_conversion,count(*) as total_unapproved_conversion
from tutorial.kag_conversion_data 
where approved_conversion=0
group by 1,2,3
order by total_unapproved_conversion desc
limit 2;
