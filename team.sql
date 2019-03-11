drop database if exists Team;
create database Team character set utf8 collate utf8_general_ci;
use Team;

/* c:\xampp\mysql\bin\mysql -ukbaro -pkbaro --default_character_set=utf8 < c:\team.sql */

create table team(
	id int primary key auto_increment not null,
	title varchar(255),
	manager varchar(255),
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
	position varchar(255),
	salary DECIMAL(18,2),
    team int
);

create table trophy(
	id int primary key auto_increment not null,
	team int not null,
	league_name varchar(255),
	cup_name varchar(255),
	supercup_name varchar(255),
	times_won_league varchar(255),
	times_won_cup varchar(255),
	times_won_supercup varchar(255)
);

alter table player add foreign key (team) references team(id);

alter table team add foreign key (trophy) references trophy(id);
alter table trophy add foreign key (team) references team(id);

/* user insert */
create table user(
  id int not null primary key auto_increment,
  username varchar (255) not null,
  email varchar (255) not null,
  password char(60) not null,
  profile_pic varchar (255)
);

insert into user(id,username,email,password,profile_pic)values(
null,'Marko','markomaric@gmail.com','e','abc'
 );
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

/*team insert*/

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Manchester','Ole','Old Traford',45000,1900,null,'Manchester');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Chelsea','Sarri','Bridge',30000,1905,null,'London');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Arsenal','Arsen','Emirates',40000,1904,null,'London');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Spurs','Poche','Lane',35000,1900,null,'London');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'Liverpool','Klopp','Anfield',40000,1904,null,'Liverpool');

insert into team (id,title,manager,ground,ground_capacity,since,trophy,city) values(
null,'City','Pep','Etihad',30000,2000,null,'Manchester');


/*player insert*/

/*team 1*/
insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Romelu','Lukaku','Belgium','Striker',45000.00,1);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Marcus','Rashford','Endland','Striker',25000.00,1);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Ander','Herrera','Spain','Midfielder',30000.00,1);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Paul','Pogba','France','Midfielder',65000.00,1);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Victor','Lindelof','Sweden','Defender',32000.00,1);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Luke','Shaw','England','Defender',20000.00,1);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'David','de Gea','Spain','Goalkeeper',55000.00,1);


/*team 2*/
insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Gonzalo','Higuain','Argentina','Striker',75000.00,2);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Olivier','Giroud','France','Striker',35000.00,2);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Eden','Hazard','Belgium','Midfielder',105000.00,2);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Mateo','Kovačić','Croatia','Midfielder',45000.00,2);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'David','Luiz','Brazil','Defender',65000.00,2);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Gary','Cahill','England','Defender',35000.00,2);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Kepa','Arrizabalaga','Spain','Goalkeeper',65000.00,2);

/*team 3*/
insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Pierre','Emerick-Aubameyang','Gabon','Striker',65000.00,3);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Alexandre','Lacazette','France','Striker',57000.00,3);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Matteo','Guendouzi','France','Midfielder',15000.00,3);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Denis','Suarez','Spain','Midfielder',32000.00,3);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Rob','Holding','England','Defender',22000.00,3);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Nacho','Monreal','Spain','Defender',35000.00,3);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Petr','Cech','Czech Republic','Goalkeeper',75000.00,3);

/* team 4 */
insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Harry','Kane','England','Striker',78000.00,4);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Son','Heung-Min','South Korea','Striker',59000.00,4);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Christian','Eriksen','Denmark','Midfielder',120000.00,4);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Victor','Wanyama','Kenya','Midfielder',36000.00,4);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Davinson','Sanchez','Columbia','Defender',37000.00,4);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Jan','Vertongen','Belgium','Defender',68000.00,4);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Hugo','Lloris','France','Goalkeeper',89000.00,4);

/*team 5*/
insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Mohamed','Salah','Egypt','Striker',198000.00,5);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Roberto','Firmino','Brazil','Striker',152000.00,5);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'James','Milner','England','Midfielder',50000.00,5);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Naby','Keita','Guinea','Midfielder',77000.00,5);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Virgil','Van Dijk','Netherlands','Defender',137000.00,5);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Dejan','Lovren','Croatia','Defender',60000.00,5);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Alisson','Becker','Brazil','Goalkeeper',59000.00,5);

/*team 6*/
insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Sergio','Aguero','Argentina','Striker',165000.00,6);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Gabriel','Jesus','Brazil','Striker',62000.00,6);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Leroy','Sane','Germany','Midfielder',70000.00,6);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Kevin','De Bruyne','Belgium','Midfielder',217000.00,6);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'John','Stones','England','Defender',67000.00,6);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Kyle','Walker','England','Defender',77000.00,6);

insert into player (id,name,surname,nationality,position,salary,team) values(
null,'Ederson','Moraes','Brazil','Goalkeeper',79000.00,6);


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






