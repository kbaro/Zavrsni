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

create table fixture(
  id int primary key auto_increment not null,
  team_1 int,
  team_2 int,
  player int
);


alter table player add foreign key (team) references team(id);
alter table player add foreign key (positions) references positions(id);
alter table team add foreign key (manager) references manager(id);
alter table team_trophy add foreign key (trophy) references trophy(id);
alter table team_trophy add foreign key (team) references team(id);
alter table fixture add foreign key (team_1) references team(id);
alter table fixture add foreign key (team_2) references team(id);
alter table fixture add foreign key (player) references player(id);

/*operator insert*/

create table operator(
	id int not null primary key auto_increment,
	name varchar(255) not null,
	surname varchar(255) not null,
	role enum ('admin' , 'user') default 'user',
	email varchar(255) not null,
	password char(60) not null
);

insert into operator(id,name,surname,role,email,password) values(
null,'Kristijan','Baro','admin','baro.kristijan@gmail.com','$2y$10$ZHXft4hWvvgl8HIzHc4FEemQKLr0ZAj4DX3r0kBTi4e.e67woaoQS');

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


/*team insert*/

insert into team (id,title,manager,ground,ground_capacity,since,logo,city) values
(null,'Arsenal',1,'Emirates Stadium',40000,1904,'/public/img/arsenal.svg','London'),

(null,'AFC Bournemouth',2,'Vitality Stadium',25000,1914,'/public/img/bournemouth.svg','Bournemouth'),

(null,'Brighton and Hove Albion',3,'Amex Stadium',30000,1920,'/public/img/brighton.svg','Brighton'),

(null,'Burnley',4,'Turf Moor',35000,1900,'/public/img/burnley.svg','Burnley'),

(null,'Cardiff City',5,'Cardiff City Stadium',15000,'/public/img/cardiff.svg','Cardiff'),

(null,'Chelsea',6,'Stamford Bridge',50000,1905,'/public/img/chelsea.svg','London'),

(null,'Crystal Palace',7,'Selhurst Park',25000,1925,'/public/img/palace.svg','London'),

(null,'Everton',8,'Goodison Park',45000,1902,'/public/img/everton.svg','Liverpool'),

(null,'Fulham',9,'Craven Cottage',20000,1925,'/public/img/fulham.svg','London'),

(null,'Huddersfield Town',10,'John Smiths Stadium',18000,1930,'/public/img/hudder.svg','Huddersfield'),

(null,'Leicester City',11,'King Power Stadium',32000,1943,'/public/img/leicester.svg','Leicester'),

(null,'Liverpool',12,'Anfield',50000,1904,'/public/img/liverpool.svg','Liverpool'),

(null,'Manchester City',13,'Etihad Stadium',60000,2000,'/public/img/city.svg','Manchester'),

(null,'Manchester United',14,'Old Trafford',75000,1900,'/public/img/united.svg','Manchester'),

(null,'Newcastle United',15,'St.James Park',35000,1950,'/public/img/newcastle.svg','Newcastle upon Tyne'),

(null,'Southampton',16,'St. Marys Stadium',20000,1960,'/public/img/soton.svg','Southampton'),

(null,'Tottenham Hotspur',17,'Tottenham Hotspur Stadium',85000,1900,'/public/img/spurs.svg','London'),

(null,'Watford',18,'Vicarage Road',22000,1940,'/public/img/watford.svg','Watford'),

(null,'West Ham United',19,'London Stadium',40500,1920,'/public/img/westham.svg','London'),

(null,'Wolverhampton Wanderers',20,'Molineux Stadium',40000,1970,'/public/img/wolfs.svg','Wolverhampton')
;




/*player insert*/

/*team 1*/
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Romelu','Lukaku','Belgium',1,45000.00,1),

(null,'Marcus','Rashford','Endland',1,25000.00,1),

(null,'Ander','Herrera','Spain',2,30000.00,1),

(null,'Paul','Pogba','France',2,65000.00,1),

(null,'Victor','Lindelof','Sweden',3,32000.00,1),

(null,'Luke','Shaw','England',3,20000.00,1),

(null,'David','de Gea','Spain',4,55000.00,1);


/*team 2*/
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Gonzalo','Higuain','Argentina',1,75000.00,2),

(null,'Olivier','Giroud','France',1,35000.00,2),

(null,'Eden','Hazard','Belgium',1,105000.00,2),

(null,'Mateo','Kovačić','Croatia',2,45000.00,2),

(null,'David','Luiz','Brazil',3,65000.00,2),

(null,'Gary','Cahill','England',3,35000.00,2),

(null,'Kepa','Arrizabalaga','Spain',4,65000.00,2);

/*team 3*/
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Pierre','Emerick-Aubameyang','Gabon',1,65000.00,3),

(null,'Alexandre','Lacazette','France',1,57000.00,3),

(null,'Matteo','Guendouzi','France',2,15000.00,3),

(null,'Denis','Suarez','Spain',2,32000.00,3),

(null,'Rob','Holding','England',3,22000.00,3),

(null,'Nacho','Monreal','Spain',3,35000.00,3),

(null,'Petr','Cech','Czech Republic',4,75000.00,3);

/* team 4 */
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Harry','Kane','England',1,78000.00,4),

(null,'Son','Heung-Min','South Korea',1,59000.00,4),

(null,'Christian','Eriksen','Denmark',2,120000.00,4)

(null,'Victor','Wanyama','Kenya',2,36000.00,4),

(null,'Davinson','Sanchez','Columbia',3,37000.00,4),

(null,'Jan','Vertongen','Belgium',3,68000.00,4),

(null,'Hugo','Lloris','France',4,89000.00,4);

/*team 5*/
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Mohamed','Salah','Egypt',1,198000.00,5),

(null,'Roberto','Firmino','Brazil',1,152000.00,5),

(null,'James','Milner','England',2,50000.00,5),

(null,'Naby','Keita','Guinea',2,77000.00,5),

(null,'Virgil','Van Dijk','Netherlands',3,137000.00,5),

(null,'Dejan','Lovren','Croatia',3,60000.00,5),

(null,'Alisson','Becker','Brazil',4,59000.00,5);

/*team 6*/
insert into player (id,name,surname,nationality,positions,salary,photo,team) values(
null,'Sergio','Aguero','Argentina',1,165000.00,6),

(null,'Gabriel','Jesus','Brazil',1,62000.00,6),

(null,'Leroy','Sane','Germany',1,70000.00,6),

(null,'Kevin','De Bruyne','Belgium',2,217000.00,6),

(null,'John','Stones','England',3,67000.00,6),

(null,'Kyle','Walker','England',3,77000.00,6),

(null,'Ederson','Moraes','Brazil',4,79000.00,6);


/*trophy insert*/

insert into trophy (id,trophy_name,photo) values(
null,'Republic League','/public/img/league.png'),
(null,'Republic Cup','/public/img/cup.png'),
(null,'Republic SuperCup','/public/img/supercup.svg');

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








