SELECT * FROM matches;
SELECT * FROM players;
SELECT * FROM teams;

-- 1. What are the names of the players whose salary is greater than 100,000?
select player_name,salary from players
where salary > 100000;

-- 2. What is the team name of the player with player_id = 3?
select p.player_id,t.team_name from players p
join teams t
using (team_id)
where p.player_id=3;

-- 3. What is the total number of players in each team?
SELECT t.team_name,count(p.player_id) FROM players p
join teams t 
using(team_id)
group by t.team_name ;

-- 4. What is the team name and captain name of the team with team_id = 2?
SELECT  p.team_id,p.player_name as captain_name ,t.team_name FROM players p
join teams t 
using(team_id)
where p.player_id=2;

-- 5. What are the player names and their roles in the team with team_id = 1?
SELECT team_id,player_name,role FROM players
where team_id=1;

-- 6. What are the team names and the number of matches they have won?
SELECT  t.team_name,count(winner_id) match_won FROM matches m
join teams t 
on m.winner_id=t.team_id
group by t.team_name;
	
-- 7. What is the average salary of players in the teams with country 'USA'?
SELECT t.team_name,avg(salary) avg_salary FROM players p
join teams t
using(team_id)
where t.country="USA"
group by t.team_name;

-- 8. Which team won the most matches?
SELECT  t.team_name,count(winner_id) match_won FROM matches m
join teams t 
on m.winner_id=t.team_id
group by t.team_name
order by match_won desc limit 1;

-- 9. What are the team names and the number of players in each team whose salary is greater than 100,000?
SELECT t.team_name,count(p.player_id) total_team_member FROM players p
join teams t
using(team_id)
where p.salary>100000
group by t.team_name;

-- 10. What is the date and the score of the match with match_id = 3?
SELECT match_id,match_date,score_team1,score_team2 FROM matches
where match_id = 3;
