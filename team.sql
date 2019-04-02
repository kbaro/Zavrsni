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
	trophy int,
	city varchar(255)
);

create table player(
	id int primary key auto_increment not null,
	name varchar(255),
	surname varchar(255),
	nationality varchar(255),
	positions int,
	salary DECIMAL(18,2),
    team int
);

create table trophy(
	id int primary key auto_increment not null,
	team int,
	league_name varchar(255),
	cup_name varchar(255),
	supercup_name varchar(255),
	times_won_league varchar(255),
	times_won_cup varchar(255),
	times_won_supercup varchar(255)
);

create table manager(
id     int primary key auto_increment not null,
name    varchar(255),
surname varchar(255),
team    int
);

create table positions(
id   int primary key auto_increment not null,
position_name  varchar(255),
player int
);


alter table player add foreign key (team) references team(id);
alter table player add foreign key (positions) references positions(id);
alter table team add foreign key (manager) references manager(id);
alter table team add foreign key (trophy) references trophy(id);
alter table trophy add foreign key (team) references team(id);

/*operator insert*/

create table operator(
	id int not null primary key auto_increment,
	name varchar(255) not null,
	surname varchar(255) not null,
	email varchar(255) not null,
	password char(60) not null
);

insert into operator(id,name,surname,email,password) values(
null,'Kristijan','Baro','baro.kristijan@gmail.com','$2y$10$ZHXft4hWvvgl8HIzHc4FEemQKLr0ZAj4DX3r0kBTi4e.e67woaoQS');

/*position insert */

insert into positions(id,position_name,player) values
(null,'Striker', null),
(null,'Midfielder',null),
(null,'Defender',null),
(null,'Goalkeeper',null)
;

/*manager insert */

insert into manager(id,name,surname,team) values
(null,'Jose','Mourinho',null),
(null,'Jurgen','Klopp',null),
(null,'Josep','Guardiola',null),
(null,'Arsene','Wenger',null),
(null,'Maruo','Pochetino',null),
(null,'Random','Guy',null),
(null,'Mauro','Sarri',null),
(null,'Ole','Gunar',null),
(null,'Guy','Manager',null)
;


/*team insert*/

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Manchester',null,'Old Traford',45000,1900,null,'Manchester');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Chelsea',null,'Bridge',30000,1905,null,'London');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Arsenal',null,'Emirates',40000,1904,null,'London');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Spurs',null,'Lane',35000,1900,null,'London');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Liverpool',null,'Anfield',40000,1904,null,'Liverpool');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'City',null,'Etihad',30000,2000,null,'Manchester');


/*player insert*/

/*team 1*/
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Romelu','Lukaku','Belgium',null,45000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Marcus','Rashford','Endland',null,25000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Ander','Herrera','Spain',null,30000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Paul','Pogba','France',null,65000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Victor','Lindelof','Sweden',null,32000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Luke','Shaw','England',null,20000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'David','de Gea','Spain',null,55000.00,1);


/*team 2*/
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Gonzalo','Higuain','Argentina',null,75000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Olivier','Giroud','France',null,35000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Eden','Hazard','Belgium',null,105000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Mateo','Kovačić','Croatia',null,45000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'David','Luiz','Brazil',null,65000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Gary','Cahill','England',null,35000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Kepa','Arrizabalaga','Spain',null,65000.00,2);

/*team 3*/
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Pierre','Emerick-Aubameyang','Gabon',null,65000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Alexandre','Lacazette','France',null,57000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Matteo','Guendouzi','France',null,15000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Denis','Suarez','Spain',null,32000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Rob','Holding','England',null,22000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Nacho','Monreal','Spain',null,35000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Petr','Cech','Czech Republic',null,75000.00,3);

/* team 4 */
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Harry','Kane','England',null,78000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Son','Heung-Min','South Korea',null,59000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Christian','Eriksen','Denmark',null,120000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Victor','Wanyama','Kenya',null,36000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Davinson','Sanchez','Columbia',null,37000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Jan','Vertongen','Belgium',null,68000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Hugo','Lloris','France',null,89000.00,4);

/*team 5*/
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Mohamed','Salah','Egypt',null,198000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Roberto','Firmino','Brazil',null,152000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'James','Milner','England',null,50000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Naby','Keita','Guinea',null,77000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Virgil','Van Dijk','Netherlands',null,137000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Dejan','Lovren','Croatia',null,60000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Alisson','Becker','Brazil',null,59000.00,5);

/*team 6*/
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Sergio','Aguero','Argentina',null,165000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Gabriel','Jesus','Brazil',null,62000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Leroy','Sane','Germany',null,70000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Kevin','De Bruyne','Belgium',null,217000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'John','Stones','England',null,67000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Kyle','Walker','England',null,77000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Ederson','Moraes','Brazil',null,79000.00,6);


/*trophy insert*/

insert into trophy (id,team,league_name,cup_name,supercup_name,times_won_league,times_won_cup,times_won_supercup) values(
null,1,'Republic League','Republic Cup','Republic Supercup','13','5','6');

insert into trophy (id,team,league_name,cup_name,supercup_name,times_won_league,times_won_cup,times_won_supercup) values(
null,2,'Republic League','Republic Cup','Republic Supercup','5','3','4');

insert into trophy (id,team,league_name,cup_name,supercup_name,times_won_league,times_won_cup,times_won_supercup) values(
null,3,'Republic League','Republic Cup','Republic Supercup','3','7','1');

insert into trophy (id,team,league_name,cup_name,supercup_name,times_won_league,times_won_cup,times_won_supercup) values(
null,4,'Republic League','Republic Cup','Republic Supercup','0','1','0');

insert into trophy (id,team,league_name,cup_name,supercup_name,times_won_league,times_won_cup,times_won_supercup) values(
null,5,'Republic League','Republic Cup','Republic Supercup','0','4','3');

insert into trophy (id,team,league_name,cup_name,supercup_name,times_won_league,times_won_cup,times_won_supercup) values(
null,6,'Republic League','Republic Cup','Republic Supercup','3','7','5');






