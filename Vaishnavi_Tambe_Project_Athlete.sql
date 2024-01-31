# NAME :- VAISHNAVI TAMBE 

use weekdays;

select * from athlete;

-- Q1. Show how many medal counts present for entire data :

select count(*), Medal 
from athlete 
where (medal IS NULL OR medal <> 'NoMedal') 
group by  Medal;

-- Q2. Show count of unique Sports that are present in olympics :

select * from athlete;
select distinct count(*),Sport 
from athlete 
group by Sport;

-- Q3. Show how many different medals won by Team India in data :

select distinct count(medal),Team as medal_won 
from athlete
 where team = 'India';

-- Q4. Show event wise medals won by india show from highest to lowest medals won in order :

select count(medal),event,team as medal_won 
from athlete 
where team = 'India'
group by event, medal,team 
order by medal desc;

-- Q5. Show event and yearwise medals won by india in order of year :

select count(medal),event,year,team as year_wise
 from athlete
 where team = 'india' 
 group by event, year, medal, team
 order by year;

-- Q6. Show the country with maximum medals won gold, silver, bronze :
select 
sum(case when medal = 'Gold' then 1 else 0 end) as 'GOLD',
sum(case when medal = 'silver' then 1 else 0 end) as 'SILVER',
sum(case when medal = 'Bronze' then 1 else 0 end) as 'BRONZE',
count(*),Team as total_medals
from athlete
where (medal IS NULL OR medal <> 'NoMedal')
group by Team 
order by count(*) desc;

-- Q7. Show the top 10 countries with respect to gold medals :

select * from athlete 
where medal = 'Gold' 
order by team desc
 limit 10;

-- Q8. Show in which year did United States won most medals :

SELECT year, SUM(CASE WHEN team = 'United States' THEN 1 ELSE 0 END) AS total_medals
FROM athlete
where (medal IS NULL OR medal <> 'NoMedal')
GROUP BY year,team
ORDER BY total_medals DESC
limit 1;

-- Q9. In which sports United States has most medals :

select team, sport, count(medal) as medal_won 
from athlete 
where team = 'United States' and (medal IS NULL OR medal <> 'NoMedal')
group by sport,medal 
order by count(*) desc 
limit 1;

-- Q10. Find top 3 players who have won most medals along with their sports and country :

select Name, Team, Sport, count(*) as total_medals 
from athlete 
where (medal IS NULL OR medal <> 'NoMedal')
group by name,team,sport
order by total_medals desc
limit 3;

-- Q11. Find player with most gold medals in cycling along with his country :

select Name, Team, Sport, max(medal) as gold_medal
from athlete
where medal = 'gold' and sport = 'cycling' 
group by Name,Team,Sport
order by gold_medal desc
limit 1;

-- Q12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his/her country :

select Name, Team, Sport, Sex, Year,
    sum(Case when medal = 'Gold' and Sport like 'Basketball' then 1 else 0 end) as gold_medals,
    sum(Case when medal = 'Silver' and Sport = 'Basketball' then 1 else 0 end) as silver_medals,
    sum(Case when medal = 'Bronze' and Sport = 'Basketball' then 1 else 0 end) as bronze_medals,
    count(*) AS total_medals
from athlete
where Sport like '%basketball' and (medal IS NULL OR medal <> 'NoMedal')
group by Team, Sport, Sex, Name, Year
order by total_medals desc
limit 1;

-- Q13. Find out the count of different medals of the top basketball player :
select Name, Team, Sport, Sex, Year,
    sum(Case when medal = 'Gold' and Sport like 'Basketball' then 1 else 0 end) as gold_medals,
    sum(Case when medal = 'Silver' and Sport = 'Basketball' then 1 else 0 end) as silver_medals,
    sum(Case when medal = 'Bronze' and Sport = 'Basketball' then 1 else 0 end) as bronze_medals,
    count(*) AS total_medals
from athlete
where Sport like '%basketball' and (medal IS NULL OR medal <> 'NoMedal')
group by Team, Sport, Sex, Name, Year
order by total_medals desc
limit 1;

-- Q14. Find out medals won by male, female each year . Export this data and plot graph in excel :

select Name, Year, Team, Sex, Sport,
 sum(case when medal = 'gold' and sex = 'F' then 1 else 0 end) as gold_medal,
 sum(case when medal = 'silver' and sex = 'F' then 1 else 0 end) as silver_medal,
 sum(case when medal = 'bronze' and sex = 'F' then 1 else 0 end) as bronze_medal
 from athlete
 where sex like '%F' and (medal is not null <> 'NoMedal')
 group by Name, Year, Team, Sex, Sport
 union
 
 select Name, Year, Team, Sex, Sport,
 sum(case when medal = 'gold' and sex = 'M' then 1 else 0 end) as gold_medal,
 sum(case when medal = 'silver' and sex = 'M' then 1 else 0 end) as silver_medal,
 sum(case when medal = 'bronze' and sex = 'M' then 1 else 0 end) as bronze_medal
 from athlete
 where sex like '%M' and (medal is not null <> 'NoMedal')
 group by Name, Year, Team, Sex, Sport
 order by year,sex;
 

