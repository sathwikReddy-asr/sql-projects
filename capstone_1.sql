--Platform used:mode.com
--Table used:tutorial.flights 
--Date:27th may 2025

--Q1: List all flights with a departure delay greater than 30 mintutes ?
select acutal_departure_time,departure_delay,flight_number                           --selecting multile columns
from tutorial.flights 
where departure_delay >30;                                                           --departure delay is more than 30 mintues

--Q2: count the number of flights per destination city.sort the result by highest flight count first ?
select destination_city,count(*) as flight_count
from tutorial.flights
group by destination_city
order by flight_count desc;

--Q3: Find the flights that arrived early (arrival delay <0) ?
select arrival_delay,flight_number
from tutorial.flights
where arrival_delay <0;

--Q4: calculate the average flight distance ?
select avg(distance) as average_flight_distance
from tutorial.flights;


