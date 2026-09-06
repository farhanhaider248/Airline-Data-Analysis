create database airline;
use airline;
select * from df;
-- Q1. Total passengers
select count(id) as total_passangers from df;

-- Q2. Total unique IDs
select count(distinct id) as total_unique_passanger from df;

-- Q3. Gender distribution
select gender, count(*) as passangers from df group by gender;

-- Q4. Customer type distribution
select `customer type`, count(*) as passangers from df group by `customer type`;

-- Q5. Class distribution
select class, count(*) as class_passangers from df group by class;

-- Q6. Travel type distribution
select `type of travel`,count(*) as passangers from df group by `type of travel`;

-- Q7. Satisfaction distribution
select satisfaction,count(*) as passangers from df group by satisfaction;

-- Q8. Average age
select avg(age) as avg_age from df;

-- Q9. Minimum age
select min(age) as min_age from df;

-- Q10. Maximum age
select max(age) as max_age from df;

-- Q11. Average flight distance
select avg(`flight distance`) from df;

-- Q12. Maximum flight distance
select max(`flight distance`) from df;

-- Q13. Minimum flight distance
select min(`flight distance`) from df;

-- Q14. Average distance by class
select class,avg(`flight distance`) as avg_flight_distance from df group by class;

-- Q15. Average distance by travel type
select `type of travel`,avg(`flight distance`) as avg_flight_distance from df group by `type of travel`;

-- Q16. Average departure delay
select avg(`departure delay in minutes`) as avg_departure from df;

-- Q17. Average arrival delay
select avg(`arrival delay in minutes`) as avg_arrival_delay from df;

-- Q18. Maximum departure delay
select max(`departure delay in minutes`) as max_departure_delay from df;

-- Q19. Maximum arrival delay
select max(`arrival delay in minutes`) as max_arrival_delay from df;

-- Q20. Passengers with departure delay
select count(*) as passangers from df where `departure delay in minutes` > 0;

-- Q21. Passengers with arrival delay
select count(*) as passangers from df where `arrival delay in minutes` > 0;

-- Q22. Passengers delayed more than 30 minutes
select count(*) as passangers from df where `departure delay in minutes` > 30;

-- Q23. Average delay by class
select class, avg(`departure delay in minutes`) as avg_delay from df group by class;

-- Q24. Average delay by satisfaction
select satisfaction, avg(`departure delay in minutes`) as avg_delay from df group by satisfaction;

-- Q25. Satisfaction by gender
select satisfaction,gender,count(*) as passangers from df group by satisfaction,gender;

-- Q26. Satisfaction by class
select satisfaction,class ,count(*) as passangers from df group by satisfaction,class;

-- Q27. Satisfaction by travel type
select satisfaction,`type of travel`,count(*) as passangers from df group by satisfaction,`type of travel`;

-- Q28. Satisfaction by customer type
select satisfaction,`customer type`,count(*) as passangers from df group by satisfaction,`customer type`;

-- Q29. Number of satisfied passengers
select count(*) as passangers from df where satisfaction = 'satisfied';

-- Q30. Number of dissatisfied passengers
select count(*) as passangers from df where satisfaction = 'neutral or dissatisfied';

-- Q31. Average WiFi rating
select avg(`inflight wifi service`) as avg_wifi_rating from df ;

-- Q32. Average food rating
select avg(`food and drink`) as avg_food_rating from df;

-- Q33. Average seat comfort
select avg(`seat comfort`) as avg_seat_comfort from df;

-- Q37. Service ratings by satisfaction
select satisfaction,AVG(`Inflight wifi service`) AS wifi,
       AVG(`Food and drink`) AS food,
       AVG(`Seat comfort`) AS seat_comfort,
       AVG(`Online boarding`) AS boarding,
       AVG(Cleanliness) AS cleanliness
from df group by satisfaction;

-- Q38. Class with highest satisfied passengers
select class,count(*) as satisfied_passengers from df where satisfaction = 'satisfied' group by class
order by satisfied_passengers desc limit 1;

-- Q39. Travel type with highest satisfaction
select `type of travel`,sum(satisfaction ='satisfied') as highest_satisfaction from df group by
`type of travel` order by highest_satisfaction desc limit 1;

-- Q40. Average age by satisfaction
select satisfaction,avg(age) as avg_age from df group by satisfaction;

-- Q41. Passengers age > 50
select * from df where age > 50;

-- Q42. Average service score
select avg(`service score`) from df;

-- Q43. Average service score by satisfaction
select satisfaction,avg(`service score`) from df group by satisfaction ;

-- Q44. Top 10 longest flights
select id,class,`flight distance`,satisfaction from df order by `flight distance` desc limit 10;

-- Q45. Top 10 highest departure delays
select * from df order by `departure delay in minutes` desc limit 10;

-- Q46. Average satisfaction-related ratings by class
select class, avg(`food and drink`) as food,
       AVG(`Seat comfort`) AS seat,
       AVG(`Online boarding`) AS boarding,
       AVG(Cleanliness) AS cleanliness
from df group by class;

-- Q47. Business vs Personal travel passengers
select `type of travel`,count(*) as passangers from df group by `type of travel`;

-- Q48. Loyal vs disloyal customers
select `customer type`, count(*) as total_customers from df group by `customer type`;

-- Q49. Loyal customers satisfaction
select satisfaction,count(`customer type` = 'loyal customer') as total_loyal_customers from df group by satisfaction;

-- Q50. Disloyal customers satisfaction
select satisfaction,`customer type`, count(*) as passangers
from df where `customer type` ='disloyal customer' group by satisfaction,`customer type`;

-- Q51. Satisfaction percentage by class
select class, round(sum(satisfaction = 'satisfied') * 100/count(*),2)
as satisfied_rate from df group by class order by satisfied_rate desc;

-- Q52. Satisfaction percentage by travel type
select `type of travel`,round(sum(satisfaction ='satisfied') * 100/count(*),2)
as satisfied_rate from df group by `type of travel` order by satisfied_rate desc;

-- Q53. Satisfaction percentage by gender
select gender,round(sum(satisfaction = 'satisfied') *100/count(*),2)
as satisfied_rate from df group by gender order by satisfied_rate desc;

-- Q54. Satisfaction rate by customer type
select `customer type`,round(sum(satisfaction = 'satisfied') *100/count(*),2)
as satisfied_rate from df group by `customer type` order by satisfied_rate desc;

-- Q55. Highest-rated service
select
    AVG(`Inflight wifi service`) AS wifi,
    AVG(`Food and drink`) AS food,
    AVG(`Online boarding`) AS boarding,
    AVG(`Seat comfort`) AS seat,
    AVG(Cleanliness) AS cleanliness
from df ;
select count(*) from df where gender ='female';

-- Find the minimum and maximum Age in the dataset.
select min(age) as min_age,max(age) as max_age from df ;

-- Find the average FlightDistance across all passengers.
select avg(`flight distance`) from df;

-- Find the average FlightDistance per Class using GROUP BY.
select class ,avg(`flight distance`) as avg_flight_distance from df group by class order by avg_flight_distance;

-- Find the number of satisfied vs dissatisfied passengers using GROUP BY Satisfaction.
select satisfaction,count(*) as passangers from df group by satisfaction;

-- Find the percentage of passengers who are Loyal Customer vs disloyal Customer.
select `customer type`, count(*) * 100 / (select count(*) from df) as percentage from df group by `customer type`;

-- Filter passengers who are in Business class AND have Satisfaction = 'satisfied'.
select * from df where class = 'business' and satisfaction= 'satisfied';

-- Filter passengers who are in Eco class OR Eco Plus class using IN.
select * from df where class in ('eco','eco plus');

-- Find passengers whose Age is between 20 and 40 using BETWEEN.
select * from df where age between 20 and 40;

-- Find passengers whose CustomerType contains "disloyal" using LIKE.
select * from df where `customer type` like '%disloyal%';

-- Use CASE WHEN to create an AgeGroup column (Child/Teen/Adult/Senior).
select id,age,case when age <= 12 then 'child'
when age <= 19 then 'teen'
when age <= 60 then 'adult'
else 'senior' end as age_group from df ;

-- Find the top 10 passengers with highest DepartureDelay.
select * from df order by `departure delay in minutes` desc limit 10;

-- Find the average InflightWifiService rating grouped by Gender.
select gender, avg(`inflight wifi service`) as avg_wifi from df group by gender;

-- Find the count of passengers grouped by TypeOfTravel and Class together.
select class,`type of travel` ,count(*) as passangers from df group by class,`type of travel`;

-- Use HAVING to find classes where average FlightDistance is greater than 1000.
select class,avg(`flight distance`) AS avg_distance from df group by class having avg(`flight distance`) > 1000;

-- Find passengers with DepartureDelay = 0 AND ArrivalDelay = 0 (no delay at all).
select * from df where `departure delay in minutes` = 0 and `arrival delay in minutes` = 0;

-- Calculate TotalDelay (DepartureDelay + ArrivalDelay) as a derived column in your SELECT.
select id,`departure delay in minutes`,`arrival delay in minutes`,
(`departure delay in minutes`+ `arrival delay in minutes`) as total_delay from df;

-- Find the number of passengers with TotalDelay greater than 60 minutes.
select count(*) from df where (`departure delay in minutes`+ `arrival delay in minutes`) > 60;

-- Rank passengers by FlightDistance within each Class using RANK() or ROW_NUMBER()
select id,class,`flight distance`, rank() over(partition by class order by `flight distance` desc) as rank_class
from df;

-- . Find the second-highest FlightDistance value in the table.
select max(`flight distance`) as second_highest from df where `flight distance` <(select max(`flight distance`) 
from df);

-- Use a subquery to find passengers whose Age is above the overall average age.
select id,class,`customer type`,age from df where age > (select avg(age) from df);

-- Find how many passengers rated SeatComfort a perfect 5.
select count(*) from df where `seat comfort` = 5;

-- Use COALESCE or ISNULL to replace NULL ArrivalDelay values with 0 in a SELECT.
select id,coalesce(`arrival delay in minutes`,0) as arrival_fixed from df;

-- Write a query using a CTE (WITH clause) to calculate satisfaction percentage per Class.
with class_summary as (
select class,sum(case when satisfaction = 'satisfied' then 1 else 0 end) as satisfied_cust,
count(*) as total_counts from df group by class )
select class,satisfied_cust *100/ total_counts as satisfaction_pct from class_summary;

-- Find, for each Class, the satisfaction rate (%) — passengers satisfied divided by total passengers in that class.
select class,sum(case when satisfaction ='satisfied' then 1 else 0 end) as satisfaction_rate from df group by class;

-- Use a window function (AVG() OVER (PARTITION BY Class)) to compare each passenger's FlightDistance to their class average.
with ranked as ( select id,class,(`departure delay in minutes`+ `arrival delay in minutes`) as totaldelay,
row_number() over(partition by class order by (`departure delay in minutes`+ `arrival delay in minutes`)desc) as rnk
from df)select * from ranked where rnk <=3;

-- Find passengers who rated InflightEntertainment = 5 but were still "neutral or dissatisfied" (a mismatch case).
select * from df where `inflight entertainment` = 5 and satisfaction like '%neutral%';

-- Create a summary table (using GROUP BY + multiple aggregates) showing count, 
-- avg age, avg flight distance, and satisfaction % per Class and Gender.
select class,gender,count(*) as total_passengers,
avg(age)as avg_age,
avg(`flight distance`) as avg_distance,
sum(case when satisfaction ='satisfied' then 1 else 0 end) * 100 /count(*) as satisfaction_pct
from df group by class,gender;

-- For each rating column (wifi, food, seat comfort, etc.), calculate the average rating among satisfied vs dissatisfied passengers.
select satisfaction, avg(`inflight wifi service`) as avg_wifi from df
group by satisfaction union all
select satisfaction,avg(`food and drink`) as avg_food
from df
group by satisfaction
union all
select satisfaction,avg(`seat comfort`) as avg_seat
from df group by satisfaction;

-- Bucket FlightDistance into Short/Medium/Long and show passenger count + satisfaction % per bucket.
select case when `flight distance` < 500 then 'short'
when `flight distance` <= 1500 then 'medium'
else 'long'
end as distancebucket,
count(*) as total_pessangers,
sum(case when satisfaction = 'satisfied' then 1 else 0 end) * 100/count(*) as satisfaction_pct
from df group by 
case when `flight distance` < 500 then 'short'
when `flight distance` <= 150 then 'medium'
else 'long'
end;

-- Identify duplicate id values (if any) using GROUP BY id HAVING COUNT(*) > 1.
select id from df group by id having count(*) > 1;

-- Rank Class by overall satisfaction % from highest to lowest.
select class, sum(case when satisfaction = 'satisfied' then 1 else 0 end)* 100 / count(*) as sat_pct
from df 
group by class order by sat_pct desc;

-- Create a view vw_satisfaction_summary that stores class-wise, gender-wise satisfaction percentage.
create view vw_satisfaction_summary as select class ,gender ,sum(case when satisfaction='satisfied' then 1 else 0 end) * 100/count(*)
as sat_pct from df group by class,gender ;
select * from vw_satisfaction_summary;

-- Use EXISTS to find passengers whose Class has an overall satisfaction rate above 50%
select distinct a.class from df a 
where exists (select 1 from df b where a.class = b.class group by b.class
having sum(case when satisfaction = 'satisfied' then 1 else 0 end) * 100/count(*) > 50 );


-- Write a stored procedure that accepts a Class name and returns satisfaction % for that class. (MySQL syntax)
delimiter // 
create procedure getsatisfaction_class(in class_name varchar(50))
begin
select class_name as class,
sum(case when satisfaction = 'satisfied' then 1 else 0 end) * 100/count(*) as sat_pct
from df
where class = class_name;
end // 
delimiter ;
call getsatisfaction_class('business');

-- Combine CTE + window functions + CASE to output: passenger id, Class,
 -- FlightDistance, class-average distance, and "Above/Below Average" flag.
 with class_avg as ( 
 select class,avg(`flight distance`) as avg_distance
 from df group by class)
 select a.id,a.class,a.`flight distance`, c.avg_distance,
 case when a.`flight distance` > c.avg_distance then 'above avg' else 'below avg' end as comparison
 from df a join class_avg c on a.class =c.class;
 
 
