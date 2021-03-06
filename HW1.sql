-- Farthest Flight
SELECT f.flight
,f.dest
,max(f.distance)
FROM flights f
GROUP BY 1,2
order by 3 desc
limit 1;

-- Number of Engines and Most Seats
select count(distinct p.engines)
from planes p;

select p.model,
p.engines,
max(seats)
from planes p
group by 1,2;

-- Total Flights
select count(f.flight)
from flights f;

-- Total FLights by Airline
select f.carrier,
count(f.flight) as flights
from flights f
group by 1;

-- Total FLights by Airline Desc
select f.carrier,
count(f.flight) as flights
from flights f
group by 1
order by 2 desc;

-- Top 5  Airlines by Num of Flights Desc
select f.carrier,
count(f.flight) as flights
from flights f
group by 1
order by 2 desc
limit 5;

-- Top 5  FLights 1000 Miles or More by Airline Desc
select f.carrier,
count(f.flight) as flights
from flights f
where f.distance >= 1000
group by 1
order by 2 desc
limit 5;

-- Get the Farthest Flight by Carrier in July
select f.carrier,
max(f.distance) as distance
from flights f
where f.month = '7'
group by 1;