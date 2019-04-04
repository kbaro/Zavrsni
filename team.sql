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
surname varchar(255)
);

create table positions(
id   int primary key auto_increment not null,
position_name  varchar(255)
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

insert into positions(id,position_name) values
(null,'Striker'),
(null,'Midfielder'),
(null,'Defender'),
(null,'Goalkeeper')
;

/*manager insert */

insert into manager(id,name,surname) values
(null,'Jose','Mourinho'),
(null,'Jurgen','Klopp'),
(null,'Josep','Guardiola'),
(null,'Arsene','Wenger'),
(null,'Maruo','Pochetino'),
(null,'Random','Guy'),
(null,'Mauro','Sarri'),
(null,'Ole','Gunar'),
(null,'Guy','Manager')
;


/*team insert*/

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Manchester',8,'Old Traford',45000,1900,null,'Manchester');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Chelsea',7,'Bridge',30000,1905,null,'London');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Arsenal',4,'Emirates',40000,1904,null,'London');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Spurs',5,'Lane',35000,1900,null,'London');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Liverpool',2,'Anfield',40000,1904,null,'Liverpool');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'City',3,'Etihad',30000,2000,null,'Manchester');


/*player insert*/

/*team 1*/
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Romelu','Lukaku','Belgium',1,45000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Marcus','Rashford','Endland',1,25000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Ander','Herrera','Spain',2,30000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Paul','Pogba','France',2,65000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Victor','Lindelof','Sweden',3,32000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Luke','Shaw','England',3,20000.00,1);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'David','de Gea','Spain',4,55000.00,1);


/*team 2*/
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Gonzalo','Higuain','Argentina',1,75000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Olivier','Giroud','France',1,35000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Eden','Hazard','Belgium',1,105000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Mateo','Kovačić','Croatia',2,45000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'David','Luiz','Brazil',3,65000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Gary','Cahill','England',3,35000.00,2);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Kepa','Arrizabalaga','Spain',4,65000.00,2);

/*team 3*/
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Pierre','Emerick-Aubameyang','Gabon',1,65000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Alexandre','Lacazette','France',1,57000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Matteo','Guendouzi','France',2,15000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Denis','Suarez','Spain',2,32000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Rob','Holding','England',3,22000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Nacho','Monreal','Spain',3,35000.00,3);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Petr','Cech','Czech Republic',4,75000.00,3);

/* team 4 */
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Harry','Kane','England',1,78000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Son','Heung-Min','South Korea',1,59000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Christian','Eriksen','Denmark',2,120000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Victor','Wanyama','Kenya',2,36000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Davinson','Sanchez','Columbia',3,37000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Jan','Vertongen','Belgium',3,68000.00,4);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Hugo','Lloris','France',4,89000.00,4);

/*team 5*/
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Mohamed','Salah','Egypt',1,198000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Roberto','Firmino','Brazil',1,152000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'James','Milner','England',2,50000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Naby','Keita','Guinea',2,77000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Virgil','Van Dijk','Netherlands',3,137000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Dejan','Lovren','Croatia',3,60000.00,5);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Alisson','Becker','Brazil',4,59000.00,5);

/*team 6*/
insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Sergio','Aguero','Argentina',1,165000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Gabriel','Jesus','Brazil',1,62000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Leroy','Sane','Germany',1,70000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Kevin','De Bruyne','Belgium',2,217000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'John','Stones','England',3,67000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Kyle','Walker','England',3,77000.00,6);

insert into player (id,name,surname,nationality,positions,salary,team) values(
null,'Ederson','Moraes','Brazil',4,79000.00,6);


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






