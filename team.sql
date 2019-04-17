drop database if exists Team;
create database Team character set utf8 collate utf8_general_ci;
use Team;

/* c:\xampp\mysql\bin\mysql -ukbaro -pkbaro --default_character_set=utf8 < c:\team.sql */

create table team(
	id int primary key auto_increment not null,
	title varchar(255),
	manager int,
	ground varchar(255),
	ground_capacity varchar(255),
	since varchar(255),
	logo varchar (255),
	city varchar(255)
);

create table player(
	id int primary key auto_increment not null,
	name varchar(255),
	surname varchar(255),
	nationality varchar(255),
	positions int,
	salary DECIMAL(18,2),
	photo varchar (255),
    team int
);

create table trophy(
	id int primary key auto_increment not null,
	trophy_name varchar (255),
	photo varchar (255)
);

create table team_trophy(
  id        int primary key auto_increment not null,
	year_won int,
	team      int,
	trophy    int,
	times_won int
);

create table manager(
	id     int primary key auto_increment not null,
	name    varchar(255),
	surname varchar(255)
);

create table referee(
  id int primary key auto_increment not null,
  referee_name varchar (255)
);

create table positions(
	id   int primary key auto_increment not null,
	position_name  varchar(255)
);


create table fixtures(
  id int primary key auto_increment not null,
  f_date int,
  f_time int,
  home_team int,
  home_goals int,
  away_team int,
  away_goals int,
  referee int,
  player int
);

create table fixtures_player(
  id int primary key auto_increment not null,
  fixtures int,
  team int,
  player int
);

create table goalscorer(
  id int primary key auto_increment not null,
  fixtures int,
  player int,
  team int
);


alter table player add foreign key (team) references team(id);
alter table player add foreign key (positions) references positions(id);
alter table team add foreign key (manager) references manager(id);
alter table team_trophy add foreign key (trophy) references trophy(id);
alter table team_trophy add foreign key (team) references team(id);
alter table fixtures add foreign key (home_team) references team(id);
alter table fixtures add foreign key (away_team) references team(id);
alter table fixtures add foreign key (referee) references referee(id);
alter table fixtures_player add foreign key (fixtures) references fixtures(id);
alter table fixtures_player add foreign key (team) references team(id);
alter table fixtures_player add foreign key (player) references player(id);
alter table goalscorer add foreign key (fixtures) references fixtures(id);
alter table goalscorer add foreign key (player) references player(id);
alter table goalscorer add foreign key (team) references team(id);



/*operator insert*/

create table operator(
	id int not null primary key auto_increment,
	name varchar(255) not null,
	surname varchar(255) not null,
	role enum ('admin' , 'user') default 'user',
	email varchar(255) not null,
	password char(60) not null
);

insert into operator(id,name,surname,role,email,password) values
(null,'Kristijan','Baro','admin','baro.kristijan@gmail.com','$2y$10$ZHXft4hWvvgl8HIzHc4FEemQKLr0ZAj4DX3r0kBTi4e.e67woaoQS')
;

/*position insert */

insert into positions(id,position_name) values
(null,'Goalkeeper'),
(null,'Left Back'),
(null,'Center Back'),
(null,'Right Back'),
(null,'Defensive Midfielder'),
(null,'Left Midfielder'),
(null,'Center Midfielder'),
(null,'Right Midfielder'),
(null,'Left Forward'),
(null,'Striker'),
(null,'Right Forward')
;

/*manager insert */

insert into manager(id,name,surname) values
(null,'Unai','Emery'),
(null,'Edduie','Howe'),
(null,'Chris','Hughton'),
(null,'Sean','Dyche'),
(null,'Neil','Warnock'),
(null,'Maurizio','Sarri'),
(null,'Roy','Hodgson'),
(null,'Marco','Silva'),
(null,'Scott','Parker'),
(null,'Jan','Siewert'),
(null,'Brendan','Rodgers'),
(null,'Jurgen','Klopp'),
(null,'Pep','Guardiola'),
(null,'Ole Gunnar','Solskjaer'),
(null,'Rafael','Benitez'),
(null,'Ralph','Hasenhuttl'),
(null,'Mauricio','Pochettino'),
(null,'Javi','Gracia'),
(null,'Manuel','Pellegrini'),
(null,'Nuno','Espirito Santo')
;

/*trophy insert*/

insert into trophy (id,trophy_name,photo) values
(null,'Republic League','/zavrsni/public/img/league.png'),
(null,'Republic Cup','/zavrsni/public/img/cup.png'),
(null,'Republic SuperCup','/zavrsni/public/img/supercup.jpg')
;

/*referee insert*/

INSERT INTO referee (referee_name) VALUES ('Driscoll Stevens');
INSERT INTO referee (referee_name) VALUES ('Tanek Gay');
INSERT INTO referee (referee_name) VALUES ('Vaughan Reynolds');
INSERT INTO referee (referee_name) VALUES ('Luke Taylor');
INSERT INTO referee (referee_name) VALUES ('Kareem Bender');
INSERT INTO referee (referee_name) VALUES ('Quinn Bridges');
INSERT INTO referee (referee_name) VALUES ('Coby Morrow');
INSERT INTO referee (referee_name) VALUES ('Robert Strickland');
INSERT INTO referee (referee_name) VALUES ('Lars Reyes');
INSERT INTO referee (referee_name) VALUES ('Igor Stanley');
INSERT INTO referee (referee_name) VALUES ('Grant Ware');
INSERT INTO referee (referee_name) VALUES ('Gareth Ramsey');
INSERT INTO referee (referee_name) VALUES ('Kane Potter');
INSERT INTO referee (referee_name) VALUES ('Daniel Payne');
INSERT INTO referee (referee_name) VALUES ('Herman Randolph');
INSERT INTO referee (referee_name) VALUES ('Seth Bradford');
INSERT INTO referee (referee_name) VALUES ('Barclay Freeman');
INSERT INTO referee (referee_name) VALUES ('Myles Valenzuela');
INSERT INTO referee (referee_name) VALUES ('Salvador Rich');
INSERT INTO referee (referee_name) VALUES ('Kuame Terry');
INSERT INTO referee (referee_name) VALUES ('Erasmus Lambert');
INSERT INTO referee (referee_name) VALUES ('Roth Barron');
INSERT INTO referee (referee_name) VALUES ('Drake Boyle');
INSERT INTO referee (referee_name) VALUES ('Patrick Dixon');
INSERT INTO referee (referee_name) VALUES ('Timon Rhodes');
INSERT INTO referee (referee_name) VALUES ('Paul Cooley');
INSERT INTO referee (referee_name) VALUES ('Rashad Freeman');
INSERT INTO referee (referee_name) VALUES ('Davis Colon');
INSERT INTO referee (referee_name) VALUES ('Lev Rios');
INSERT INTO referee (referee_name) VALUES ('Warren Peterson');
INSERT INTO referee (referee_name) VALUES ('John Spencer');

/*team insert*/

insert into team (id,title,manager,ground,ground_capacity,since,logo,city) values
(null,'Arsenal',1,'Emirates Stadium',40000,1904,'/zavrsni/public/img/arsenal.png','London'),

(null,'AFC Bournemouth',2,'Vitality Stadium',25000,1914,'/zavrsni/public/img/bournemouth.png','Bournemouth'),

(null,'Brighton and Hove Albion',3,'Amex Stadium',30000,1920,'/zavrsni/public/img/brighton.png','Brighton'),

(null,'Burnley',4,'Turf Moor',35000,1900,'/zavrsni/public/img/burnley.png','Burnley'),

(null,'Cardiff City',5,'Cardiff City Stadium',15000,1915,'/zavrsni/public/img/cardiff.png','Cardiff'),

(null,'Chelsea',6,'Stamford Bridge',50000,1905,'/zavrsni/public/img/chelsea.png','London'),

(null,'Crystal Palace',7,'Selhurst Park',25000,1925,'/zavrsni/public/img/palace.png','London'),

(null,'Everton',8,'Goodison Park',45000,1902,'/zavrsni/public/img/everton.png','Liverpool'),

(null,'Fulham',9,'Craven Cottage',20000,1925,'/zavrsni/public/img/fulham.png','London'),

(null,'Huddersfield Town',10,'John Smiths Stadium',18000,1930,'/zavrsni/public/img/hudder.png','Huddersfield'),

(null,'Leicester City',11,'King Power Stadium',32000,1943,'/zavrsni/public/img/leicester.png','Leicester'),

(null,'Liverpool',12,'Anfield',50000,1904,'/zavrsni/public/img/liverpool.png','Liverpool'),

(null,'Manchester City',13,'Etihad Stadium',60000,2000,'/zavrsni/public/img/city.png','Manchester'),

(null,'Manchester United',14,'Old Trafford',75000,1900,'/zavrsni/public/img/united.png','Manchester'),

(null,'Newcastle United',15,'St.James Park',35000,1950,'/zavrsni/public/img/newcastle.png','Newcastle upon Tyne'),

(null,'Southampton',16,'St. Marys Stadium',20000,1960,'/zavrsni/public/img/soton.png','Southampton'),

(null,'Tottenham Hotspur',17,'Tottenham Hotspur Stadium',85000,1900,'/zavrsni/public/img/spurs.png','London'),

(null,'Watford',18,'Vicarage Road',22000,1940,'/zavrsni/public/img/watford.png','Watford'),

(null,'West Ham United',19,'London Stadium',40500,1920,'/zavrsni/public/img/westham.png','London'),

(null,'Wolverhampton Wanderers',20,'Molineux Stadium',40000,1970,'/zavrsni/public/img/wolfs.png','Wolverhampton')
;

/* team_trophy insert */

insert into team_trophy(id,year_won,team,trophy,times_won)values
(null ,1995 ,2,1,20),
(null,1996 , 2,1,15),
(null,1997 , 2,1,15),
(null,1998 , 2,2,15),
(null,1999 , 2,2,15),
(null,2000 ,1,2,7),
(null,2017,6,3,6),
(null,2018,2,2,17),
(null,2017,3,2,6),
(null,2018,4,2,17),
(null,2001 ,5,2,7),
(null ,2015 ,1,3,20),
(null,2016 , 2,3,15),
(null,2019 ,5,3,7);


/*fixtures insert */

INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -42), 1500, 1, null, 2, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -42), 1500, 3, null, 4, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -42), 1500, 5, null, 6, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -42), 1500, 7, null, 8, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -42), 1500, 9, null, 10, null, 25);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -42), 1500, 11, null, 12, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -42), 1500, 13, null, 14, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -42), 1500, 15, null, 16, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -42), 1600, 17, null, 18, null, 8);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -42), 1600, 19, null, 20, null, 1);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -35), 1500, 16, null, 11, null, 2);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -35), 1500, 4, null, 5, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -35), 1500, 2, null, 19, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -35), 1500, 6, null, 1, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -35), 1500, 14, null, 15, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -35), 1500, 12, null, 7, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -35), 1500, 8, null, 17, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -35), 1600, 18, null, 9, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -35), 1600, 10, null, 3, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -35), 1600, 20, null, 13, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -28), 1500, 16, null, 14, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -28), 1500, 3, null, 9, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -28), 1500, 6, null, 4, null, 25);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -28), 1500, 5, null, 1, null, 26);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -28), 1500, 12, null, 15, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -28), 1500, 11, null, 2, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -28), 1500, 13, null, 18, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -28), 1500, 10, null, 17, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -28), 1600, 20, null, 7, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -28), 1600, 19, null, 8, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -21), 1500, 1, null, 12, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -21), 1500, 4, null, 10, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -21), 1500, 2, null, 3, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -21), 1500, 14, null, 19, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -21), 1500, 7, null, 16, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -21), 1500, 9, null, 13, null, 8);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -21), 1500, 8, null, 11, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -21), 1500, 15, null, 5, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -21), 1600, 18, null, 20, null, 16);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -21), 1600, 17, null, 6, null, 24);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -14), 1500, 16, null, 1, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -14), 1500, 3, null, 18, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -14), 1500, 6, null, 2, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -14), 1500, 5, null, 9, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -14), 1500, 12, null, 4, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -14), 1500, 11, null, 14, null, 13);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -14), 1500, 13, null, 15, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -14), 1500, 10, null, 8, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -14), 1600, 20, null, 17, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -14), 1600, 19, null, 7, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -7), 1500, 1, null, 20, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -7), 1500, 4, null, 16, null, 18);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -7), 1500, 2, null, 5, null, 2);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -7), 1500, 14, null, 12, null, 8);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -7), 1500, 7, null, 6, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -7), 1500, 9, null, 19, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -7), 1500, 8, null, 13, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -7), 1500, 15, null, 11, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -7), 1600, 18, null, 10, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), -7), 1600, 17, null, 3, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 0), 1500, 16, null, 12, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 0), 1500, 4, null, 1, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 0), 1500, 14, null, 2, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 0), 1500, 5, null, 3, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 0), 1500, 7, null, 17, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 0), 1500, 9, null, 6, null, 10);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 0), 1500, 18, null, 15, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 0), 1500, 10, null, 11, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 0), 1600, 20, null, 8, null, 1);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 0), 1600, 19, null, 13, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 7), 1500, 1, null, 14, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 7), 1500, 3, null, 19, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 7), 1500, 2, null, 4, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 7), 1500, 6, null, 16, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 7), 1500, 12, null, 20, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 7), 1500, 11, null, 5, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 7), 1500, 13, null, 7, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 7), 1500, 8, null, 18, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 7), 1600, 15, null, 10, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 7), 1600, 17, null, 9, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 14), 1500, 3, null, 6, null, 8);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 14), 1500, 7, null, 14, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 14), 1500, 9, null, 4, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 14), 1500, 13, null, 16, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 14), 1500, 8, null, 15, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 14), 1500, 18, null, 1, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 14), 1500, 10, null, 5, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 14), 1500, 20, null, 11, null, 25);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 14), 1600, 17, null, 2, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 14), 1600, 19, null, 12, null, 16);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 21), 1500, 1, null, 3, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 21), 1500, 16, null, 20, null, 16);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 21), 1500, 4, null, 13, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 21), 1500, 2, null, 18, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 21), 1500, 6, null, 10, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 21), 1500, 14, null, 8, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 21), 1500, 5, null, 17, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 21), 1500, 12, null, 9, null, 10);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 21), 1600, 11, null, 7, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 21), 1600, 15, null, 19, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 28), 1500, 3, null, 14, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 28), 1500, 7, null, 4, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 28), 1500, 9, null, 2, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 28), 1500, 13, null, 12, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 28), 1500, 8, null, 5, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 28), 1500, 18, null, 6, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 28), 1500, 10, null, 1, null, 10);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 28), 1500, 20, null, 15, null, 18);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 28), 1600, 17, null, 11, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 28), 1600, 19, null, 16, null, 16);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 35), 1500, 1, null, 9, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 35), 1500, 16, null, 8, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 35), 1500, 4, null, 17, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 35), 1500, 2, null, 7, null, 2);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 35), 1500, 6, null, 19, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 35), 1500, 14, null, 20, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 35), 1500, 5, null, 18, null, 13);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 35), 1500, 12, null, 10, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 35), 1600, 11, null, 13, null, 8);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 35), 1600, 15, null, 3, null, 1);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 42), 1500, 3, null, 16, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 42), 1500, 7, null, 15, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 42), 1500, 9, null, 14, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 42), 1500, 13, null, 5, null, 8);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 42), 1500, 8, null, 12, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 42), 1500, 18, null, 4, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 42), 1500, 10, null, 2, null, 13);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 42), 1500, 20, null, 6, null, 2);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 42), 1600, 17, null, 1, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 42), 1600, 19, null, 11, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 49), 1500, 1, null, 8, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 49), 1500, 3, null, 11, null, 1);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 49), 1500, 2, null, 16, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 49), 1500, 5, null, 7, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 49), 1500, 9, null, 15, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 49), 1500, 10, null, 13, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 49), 1500, 17, null, 19, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 49), 1500, 4, null, 20, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 49), 1600, 6, null, 14, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 49), 1600, 18, null, 12, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 56), 1500, 16, null, 5, null, 16);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 56), 1500, 14, null, 17, null, 18);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 56), 1500, 7, null, 18, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 56), 1500, 12, null, 6, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 56), 1500, 11, null, 4, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 56), 1500, 13, null, 3, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 56), 1500, 8, null, 9, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 56), 1500, 15, null, 1, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 56), 1600, 20, null, 2, null, 25);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 56), 1600, 19, null, 10, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 63), 1500, 1, null, 11, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 63), 1500, 3, null, 8, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 63), 1500, 4, null, 14, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 63), 1500, 2, null, 15, null, 13);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 63), 1500, 6, null, 13, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 63), 1500, 5, null, 12, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 63), 1500, 9, null, 7, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 63), 1500, 18, null, 19, null, 24);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 63), 1600, 10, null, 20, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 63), 1600, 17, null, 16, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 70), 1500, 16, null, 9, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 70), 1500, 14, null, 10, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 70), 1500, 7, null, 1, null, 26);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 70), 1500, 12, null, 2, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 70), 1500, 11, null, 18, null, 1);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 70), 1500, 13, null, 17, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 70), 1500, 8, null, 6, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 70), 1500, 15, null, 4, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 70), 1600, 20, null, 3, null, 24);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 70), 1600, 19, null, 5, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 77), 1500, 1, null, 13, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 77), 1500, 3, null, 7, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 77), 1500, 4, null, 19, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 77), 1500, 2, null, 8, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 77), 1500, 6, null, 15, null, 26);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 77), 1500, 5, null, 20, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 77), 1500, 9, null, 11, null, 16);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 77), 1500, 18, null, 14, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 77), 1600, 10, null, 16, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 77), 1600, 17, null, 12, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 84), 1500, 16, null, 18, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 84), 1500, 14, null, 5, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 84), 1500, 7, null, 10, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 84), 1500, 12, null, 3, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 84), 1500, 11, null, 6, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 84), 1500, 13, null, 2, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 84), 1500, 8, null, 4, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 84), 1500, 15, null, 17, null, 8);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 84), 1600, 20, null, 9, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 84), 1600, 19, null, 1, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 91), 1500, 16, null, 2, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 91), 1500, 14, null, 6, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 91), 1500, 7, null, 5, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 91), 1500, 12, null, 18, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 91), 1500, 11, null, 3, null, 1);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 91), 1500, 13, null, 10, null, 10);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 91), 1500, 8, null, 1, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 91), 1500, 15, null, 9, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 91), 1600, 20, null, 4, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 91), 1600, 19, null, 17, null, 26);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 98), 1500, 1, null, 15, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 98), 1500, 3, null, 13, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 98), 1500, 4, null, 11, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 98), 1500, 2, null, 20, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 98), 1500, 6, null, 12, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 98), 1500, 5, null, 16, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 98), 1500, 9, null, 8, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 98), 1500, 18, null, 7, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 98), 1600, 10, null, 19, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 98), 1600, 17, null, 14, null, 1);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 105), 1500, 16, null, 7, null, 2);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 105), 1500, 3, null, 2, null, 25);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 105), 1500, 6, null, 17, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 105), 1500, 5, null, 15, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 105), 1500, 12, null, 1, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 105), 1500, 11, null, 8, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 105), 1500, 13, null, 9, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 105), 1600, 10, null, 4, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 105), 1600, 20, null, 18, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 105), 1600, 19, null, 14, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 112), 1500, 1, null, 16, null, 13);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 112), 1500, 4, null, 12, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 112), 1500, 2, null, 6, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 112), 1500, 14, null, 11, null, 8);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 112), 1500, 7, null, 19, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 112), 1500, 9, null, 5, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 112), 1500, 8, null, 10, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 112), 1600, 15, null, 13, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 112), 1600, 18, null, 3, null, 25);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 112), 1600, 17, null, 20, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 119), 1500, 16, null, 4, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 119), 1500, 3, null, 17, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 119), 1500, 6, null, 7, null, 2);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 119), 1500, 5, null, 2, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 119), 1500, 12, null, 14, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 119), 1500, 11, null, 15, null, 26);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 119), 1500, 13, null, 8, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 119), 1500, 10, null, 18, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 119), 1600, 20, null, 1, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 119), 1600, 19, null, 9, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 126), 1500, 1, null, 5, null, 18);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 126), 1500, 2, null, 11, null, 13);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 126), 1500, 14, null, 16, null, 1);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 126), 1500, 7, null, 20, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 126), 1500, 9, null, 3, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 126), 1500, 8, null, 19, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 126), 1500, 17,  null,10, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 126), 1600, 4, null, 6, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 126), 1600, 15, null, 12, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 126), 1600, 18, null, 13, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 133), 1500, 16, null, 15, null, 25);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 133), 1500, 4, null, 3, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 133), 1500, 2, null, 1, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 133), 1500, 6, null, 5, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 133), 1500, 14, null, 13, null, 24);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 133), 1500, 12, null, 11, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 133), 1500, 8, null, 7, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 133), 1500, 18, null, 17, null, 16);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 133), 1600, 10, null, 9, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 133), 1600, 20, null, 19, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 140), 1500, 1, null, 6, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 140), 1500, 3, null, 10, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 140), 1500, 5, null, 4, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 140), 1500, 7, null, 12, null, 25);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 140), 1500, 9, null, 18, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 140), 1500, 11, null, 16, null, 26);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 140), 1500, 13, null, 20, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 140), 1500, 15, null, 14, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 140), 1600, 17, null, 8, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 140), 1600, 19, null, 2, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 147), 1500, 16, null, 17, null, 16);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 147), 1500, 14, null, 18, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 147), 1500, 7, null, 3, null, 24);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 147), 1500, 13, null, 1, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 147), 1500, 8, null, 2, null, 18);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 147), 1500, 19, null, 4, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 147), 1500, 12, null, 5, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 147), 1500, 11, null, 9, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 147), 1600, 15, null, 6, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 147), 1600, 20, null, 10, null, 2);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 154), 1500, 1, null, 19, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 154), 1500, 3, null, 12, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 154), 1500, 4, null, 8, null, 18);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 154), 1500, 2, null, 13, null, 16);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 154), 1500, 6, null, 11, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 154), 1500, 5, null, 14, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 154), 1500, 9, null, 20, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 154), 1600, 18, null, 16, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 154), 1600, 10, null, 7, null, 2);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 154), 1600, 17, null, 15, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 161), 1500, 16, null, 10, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 161), 1500, 14, null, 4, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 161), 1500, 7, null, 9, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 161), 1500, 12, null, 17, null, 8);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 161), 1500, 11, null, 1, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 161), 1500, 13, null, 6, null, 26);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 161), 1500, 8, null, 3, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 161), 1500, 15, null, 2, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 161), 1600, 20, null, 5, null, 24);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 161), 1600, 19, null, 18, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 168), 1500, 1, null, 7, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 168), 1500, 3, null, 20, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 168), 1500, 4, null, 15, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 168), 1500, 2, null, 12, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 168), 1500, 6, null, 8, null, 25);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 168), 1500, 5, null, 19, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 168), 1500, 9, null, 16, null, 13);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 168), 1600, 18, null, 11, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 168), 1600, 10, null, 14, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 168), 1600, 17, null, 13, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 175), 1500, 3, null, 1, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 175), 1500, 7, null, 11, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 175), 1500, 9, null, 12, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 175), 1500, 13, null, 4, null, 10);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 175), 1500, 8, null, 14, null, 18);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 175), 1500, 18, null, 2, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 175), 1500, 10, null, 6, null, 26);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 175), 1500, 20, null, 16, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 175), 1600, 17, null, 5, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 175), 1600, 19, null, 15, null, 24);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 182), 1500, 1, null, 18, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 182), 1500, 16, null, 13, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 182), 1500, 4, null, 9, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 182), 1500, 2, null, 17, null, 18);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 182), 1500, 6, null, 3, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 182), 1500, 14, null, 7, null, 11);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 182), 1500, 5, null, 10, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 182), 1500, 12, null, 19, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 182), 1600, 11, null, 20, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 182), 1600, 15, null, 8, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 189), 1500, 1, null, 4, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 189), 1500, 3, null, 5, null, 25);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 189), 1500, 2, null, 14, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 189), 1500, 6, null, 9, null, 7);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 189), 1500, 12, null, 16, null, 16);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 189), 1500, 11, null, 10, null, 24);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 189), 1500, 13, null, 19, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 189), 1500, 8, null, 20, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 189), 1600, 15, null, 18, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 189), 1600, 17, null, 7, null, 13);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 196), 1500, 16, null, 6, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 196), 1500, 4, null, 2, null, 4);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 196), 1500, 14, null, 1, null, 13);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 196), 1500, 5, null, 11, null, 19);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 196), 1500, 7, null, 13, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 196), 1500, 9, null, 17, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 196), 1500, 18, null, 8, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 196), 1500, 10, null, 15, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 196), 1600, 20, null, 12, null, 30);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 196), 1600, 19, null, 3, null, 26);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 203), 1500, 1, null, 10, null, 21);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 203), 1500, 16, null, 19, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 203), 1500, 4, null, 7, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 203), 1500, 2, null, 9, null, 22);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 203), 1500, 6, null, 18, null, 16);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 203), 1500, 14, null, 3, null, 27);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 203), 1500, 5, null, 8, null, 1);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 203), 1500, 12, null, 13, null, 6);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 203), 1600, 11, null, 17, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 203), 1600, 15, null, 20, null, 29);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 210), 1500, 3, null, 15, null, 26);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 210), 1500, 7, null, 2, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 210), 1500, 9, null, 1, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 210), 1500, 13, null, 11, null, 17);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 210), 1500, 8, null, 16, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 210), 1500, 18, null, 5, null, 12);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 210), 1500, 10, null, 12, null, 20);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 210), 1500, 20, null, 14, null, 1);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 210), 1600, 17, null, 4, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 210), 1600, 19, null, 6, null, 10);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 217), 1500, 1, null, 17, null, 3);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 217), 1500, 16, null, 3, null, 15);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 217), 1500, 4, null, 18, null, 14);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 217), 1500, 2, null, 10, null, 9);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 217), 1500, 6, null, 20, null, 13);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 217), 1500, 14, null, 9, null, 5);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 217), 1500, 5, null, 13, null, 28);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 217), 1600, 12, null, 8, null, 23);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 217), 1600, 11, null, 19, null, 2);
INSERT INTO fixtures (f_date, f_time, home_team, home_goals, away_team, away_goals, referee) VALUES (ADDDATE(CURDATE(), 217), 1600, 15, null, 7, null, 30);





/*player insert*/

/*team 1*/
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Romelu','Lukaku','Belgium',1,45000.00,null,1),

(null,'Marcus','Rashford','Endland',1,25000.00,null,1),

(null,'Ander','Herrera','Spain',2,30000.00,null,1),

(null,'Paul','Pogba','France',2,65000.00,null,1),

(null,'Victor','Lindelof','Sweden',3,32000.00,null,1),

(null,'Luke','Shaw','England',3,20000.00,null,1),

(null,'David','de Gea','Spain',4,55000.00,null,1);


/*team 2*/
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Gonzalo','Higuain','Argentina',1,75000.00,null,2),

(null,'Olivier','Giroud','France',1,35000.00,null,2),

(null,'Eden','Hazard','Belgium',1,105000.00,null,2),

(null,'Mateo','Kovačić','Croatia',2,45000.00,null,2),

(null,'David','Luiz','Brazil',3,65000.00,null,2),

(null,'Gary','Cahill','England',3,35000.00,null,2),

(null,'Kepa','Arrizabalaga','Spain',4,65000.00,null,2);

/*team 3*/
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Pierre','Emerick-Aubameyang','Gabon',1,65000.00,null,3),

(null,'Alexandre','Lacazette','France',1,57000.00,null,3),

(null,'Matteo','Guendouzi','France',2,15000.00,null,3),

(null,'Denis','Suarez','Spain',2,32000.00,null,3),

(null,'Rob','Holding','England',3,22000.00,null,3),

(null,'Nacho','Monreal','Spain',3,35000.00,null,3),

(null,'Petr','Cech','Czech Republic',4,75000.00,null,3);

/* team 4 */
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Harry','Kane','England',1,78000.00,null,4),

(null,'Son','Heung-Min','South Korea',1,59000.00,null,4),

(null,'Christian','Eriksen','Denmark',2,120000.00,null,4),

(null,'Victor','Wanyama','Kenya',2,36000.00,null,4),

(null,'Davinson','Sanchez','Columbia',3,37000.00,null,4),

(null,'Jan','Vertongen','Belgium',3,68000.00,null,4),

(null,'Hugo','Lloris','France',4,89000.00,null,4);

/*team 5*/
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Mohamed','Salah','Egypt',1,198000.00,null,5),

(null,'Roberto','Firmino','Brazil',1,152000.00,null,5),

(null,'James','Milner','England',2,50000.00,null,5),

(null,'Naby','Keita','Guinea',2,77000.00,null,5),

(null,'Virgil','Van Dijk','Netherlands',3,137000.00,null,5),

(null,'Dejan','Lovren','Croatia',3,60000.00,null,5),

(null,'Alisson','Becker','Brazil',4,59000.00,null,5);

/*team 6*/
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Sergio','Aguero','Argentina',1,165000.00,null,6),

(null,'Gabriel','Jesus','Brazil',1,62000.00,null,6),

(null,'Leroy','Sane','Germany',1,70000.00,null,6),

(null,'Kevin','De Bruyne','Belgium',2,217000.00,null,6),

(null,'John','Stones','England',3,67000.00,null,6),

(null,'Kyle','Walker','England',3,77000.00,null,6),

(null,'Ederson','Moraes','Brazil',4,79000.00,null,6);











