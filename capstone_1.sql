--Platform used:mode.com
--Table used:tutorial.flights 
--Date:27th may 2025

--Q1: List all flights with a departure delay greater than 30 mintutes ?
select *                                                                             --selecting multile columns
from tutorial.flights 
where departure_delay >30;                                                           --departure delay is more than 30 mintues

--Q2: count the number of flights per destination city.sort the result by highest flight count first ?
select destination_city,count(*) as flight_count
from tutorial.flights
group by destination_city
order by flight_count desc;

--Q3: Find the flights that arrived early (arrival delay <0) ?
select *
from tutorial.flights
where arrival_delay <0;

--Q4: calculate the average flight distance ?
select avg(distance) as average_flight_distance
from tutorial.flights;

--Q5: List the top 5 origin airports by flght count ?
select origin_airport,count(*) as flight_count
from tutorial.flights
group by origin_airport
order by flight_count desc  limit 5;  

--Q6: Find flights with air traffic control delays ?
select *
from tutorial.flights 
where air_traffic_delay>0;

--Q7: Calculate the total actual flight time for all flights ?
select sum(actual_flight_time) as total_flight_time
from tutorial.flights;

--Q8: List flights with a distance less than 500 miles ?
select *
from tutorial.flights 
where distance<500;

--Q9: Find the flight with the longest actual flight time ?
select * 
from tutorial.flights 
where actual_flight_time = (select max(actual_flight_time) from tutorial.flights);

--Q10: Count flights by destination state ?
select destination_state,count(*) as flight_count
from tutorial.flights
group by destination_state;

--Q11: List flights where the actual flight time differs from the scheduled flight time by more than 10 minutes ?
select * 
from tutorial.flights 
where 
     abs(actual_flight_time-scheduled_flight_time)>10;

--Q12: Find flights with no delays (both departure and arrival delays are 0 or negatie) ?
select * 
from tutorial.flights 
where arrival_delay<=0 and departure_delay <=0;

--Q13: Calculate the average arrival delay per origin airport ?
select origin_airport,avg(arrival_delay) as avg_arrival_delay
from tutorial.flights
group by origin_airport;

--Q14: List flights with a carrier delay greater than 0 ?
select * 
from tutorial.flights 
where carrier_delay>0;

--Q15 Find the shortest scheduled flight time ?
select min(scheduled_flight_time) as shortest_scheduled_flight_time
from tutorial.flights ;

--Q16 List flights with a positive arrival delay ?
select *
from tutorial.flights 
where arrival_delay>0;

--Q17 Count flights by origin state ? 
select origin_state,count(*) as flight_count
from tutorial.flights 
group by 1;

--Q18: Find flights with a distance graeter tha 2000miles ?
select *
from tutorial.flights 
where distance>2000;

--Q19: Calculate the maximum arrival delay ?
select max(arrival_delay) as max_arrival_delay
from tutorial.flights;

--Q20: List flights with no cancellation ?
select * 
from tutorial.flights 
where was_cancelled=false;

--Q21: Calculate the average air time per flight ?
select flight_number,avg(air_time) as avg_air_time
from tutorial.flights
group by 1;



