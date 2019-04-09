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

create table positions(
id   int primary key auto_increment not null,
position_name  varchar(255)
);

create table results(
  id int primary key auto_increment not null,
  score1 varchar (2),
  score2 varchar (2),
  team int,
  player int
);


alter table player add foreign key (team) references team(id);
alter table player add foreign key (positions) references positions(id);
alter table team add foreign key (manager) references manager(id);
alter table team_trophy add foreign key (trophy) references trophy(id);
alter table team_trophy add foreign key (team) references team(id);
alter table results add foreign key (team) references team(id);
alter table results add foreign key (player) references player(id);

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

insert into team (id,title,manager,ground,ground_capacity,since,city) values(
null,'Manchester',8,'Old Traford',45000,1900,'Manchester');

insert into team (id,title,manager,ground,ground_capacity,since,city) values(
null,'Chelsea',7,'Bridge',30000,1905,'London');

insert into team (id,title,manager,ground,ground_capacity,since,city) values(
null,'Arsenal',4,'Emirates',40000,1904,'London');

insert into team (id,title,manager,ground,ground_capacity,since,city) values(
null,'Spurs',5,'Lane',35000,1900,'London');

insert into team (id,title,manager,ground,ground_capacity,since,city) values(
null,'Liverpool',2,'Anfield',40000,1904,'Liverpool');

insert into team (id,title,manager,ground,ground_capacity,since,city) values(
null,'City',3,'Etihad',30000,2000,'Manchester');


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

insert into trophy (id,trophy_name) values(
null,'Republic League'),
(null,'Republic Cup'),
(null,'Republic SuperCup');

/* team_trophy insert */

insert into team_trophy(id,year_won,team,trophy,times_won)values
(null ,1995 ,2,1,20),
(null,1997 , 2,1,15),
(null,2017,6,1,6),
(null,2018,2,1,17),
(null,1999 ,1,1,7),
(null,2017,3,2,6),
(null,2018,4,2,17),
(null,2000 ,5,2,7),
(null ,2015 ,1,3,20),
(null,2016 , 2,3,15),
(null,2019 ,5,3,7);








