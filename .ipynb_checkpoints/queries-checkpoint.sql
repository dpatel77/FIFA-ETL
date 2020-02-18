DROP TABLE if exists world_cup;
CREATE TABLE world_cup (
"Year" INT PRIMARY KEY
,"Country" VARCHAR  
,"Winner" VARCHAR  
,"Runners-Up" VARCHAR  
,"Third" VARCHAR  
,"Fourth" VARCHAR  
,"GoalsScored" INT  
,"QualifiedTeams" INT  
,"MatchesPlayed" INT  
,"Attendance" VARCHAR  
);




DROP TABLE if exists players;
CREATE TABLE players (
sofifa_id INT PRIMARY KEY not null
,player_url VARCHAR(2083)  not null
,short_name VARCHAR  not null
,long_name VARCHAR  not null
,age INT  not null
,dob DATE  not null
,height_cm INT  not null
,weight_kg INT  not null
,nationality VARCHAR  
,club VARCHAR  
,overall INT  
,potential INT  
,value_eur INT  
,wage_eur INT  
,player_positions VARCHAR  
,preferred_foot VARCHAR  
,international_reputation INT  
,weak_foot INT  
,skill_moves INT  
,work_rate VARCHAR  
,body_type VARCHAR  
,real_face BOOLEAN  
,release_clause_eur INT  
,player_tags VARCHAR  
,team_position VARCHAR  
,team_jersey_number INT  
,loaned_from VARCHAR  
,joined DATE  
,contract_valid_until INT  
,nation_position VARCHAR  
,nation_jersey_number INT  
,pace INT  
,shooting INT  
,passing INT  
,dribbling INT  
,defending INT  
,physic INT  
,gk_diving INT  
,gk_handling INT  
,gk_kicking INT  
,gk_reflexes INT  
,gk_speed INT  
,gk_positioning INT  
,player_traits VARCHAR  
,attacking_crossing INT  
,attacking_finishing INT  
,attacking_heading_accuracy INT  
,attacking_short_passing INT  
,attacking_volleys INT  
,skill_dribbling INT  
,skill_curve INT  
,skill_fk_accuracy INT  
,skill_long_passing INT  
,skill_ball_control INT  
,movement_acceleration INT  
,movement_sprint_speed INT  
,movement_agility INT  
,movement_reactions INT  
,movement_balance INT  
,power_shot_power INT  
,power_jumping INT  
,power_stamina INT  
,power_strength INT  
,power_long_shots INT  
,mentality_aggression INT  
,mentality_interceptions INT  
,mentality_positioning INT  
,mentality_vision INT  
,mentality_penalties INT  
,mentality_composure INT  
,defending_marking INT  
,defending_standing_tackle INT  
,defending_sliding_tackle INT  
,goalkeeping_diving INT  
,goalkeeping_handling INT  
,goalkeeping_kicking INT  
,goalkeeping_positioning INT  
,goalkeeping_reflexes INT  
,ls VARCHAR  
,st VARCHAR  
,rs VARCHAR  
,lw VARCHAR  
,lf VARCHAR  
,cf VARCHAR  
,rf VARCHAR  
,rw VARCHAR  
,lam VARCHAR  
,cam VARCHAR  
,ram VARCHAR  
,lm VARCHAR  
,lcm VARCHAR  
,cm VARCHAR  
,rcm VARCHAR  
,rm VARCHAR  
,lwb VARCHAR  
,ldm VARCHAR  
,cdm VARCHAR  
,rdm VARCHAR  
,rwb VARCHAR  
,lb VARCHAR  
,lcb VARCHAR  
,cb VARCHAR  
,rcb VARCHAR  
,rb VARCHAR  
);


select * from world_cup;
select * from players;

--To check each year only has one row, should only have 20 rows
select distinct A."Year" from world_cup as A;

--To check each player only has one row, there should be 18278
select distinct A.long_name, A.dob, count(*)
from players as A
Group by A.long_name,A.dob
order by 2 desc;

-- Joins tables
SELECT a.*, b.long_name
FROM world_cup as a
JOIN players as b
ON a."Country"  = b.nationality;

--Analytics 
--What is the ratio of players nationality and the number of times those countries have hosted the World Cup?

select *
from (
    select b.nationality, count(b.sofifa_id) as no_of_playersfromcountry
    from players as b
    group by b.nationality
    ) a
full outer join (
    select distinct a."Country", count(*) as no_times_host 
    from world_cup as a
    group by a."Country"
    ) b
on a.nationality = b."Country"
order by no_times_host asc
