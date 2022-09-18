--Crear base de datos y formato de fecha--
create database oblAG2021
use oblAG2021
SET DATEFORMAT YMD;

--Borrar tablas--
DROP TABLE pasajeroMercoSurBeneficio;
DROP TABLE pasajeroMercoSur;
DROP TABLE boleto;
DROP TABLE viaje;
DROP TABLE asiento;
DROP TABLE bus;
DROP TABLE terminal;
DROP TABLE pasajeroTelefono;
DROP TABLE pasajero;
DROP TABLE pais;

-- DDL --
create table Pais(
	IdPais decimal not null Primary Key,
	NombreParis varchar(50));

create table Pasajero (
	IdPasajero decimal not null Primary Key,
	NombrePasajero varchar(60),
	APaternoPasajero varchar(60),
	AMaternoPasajero varchar(60),
	TipoDocumentoPasajero char(3),
	NumeroDocumentoPasajero decimal,
	FechaNacimientoPasajero date,
	EmailPasajero varchar(60),
	PasswordPasajero character(40),
	IdPais decimal not null foreign key references Pais(IdPais));

create table PasajeroTelefono (
	IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
	TelefonoPasajero varchar(60),
	Primary Key (IdPasajero, TelefonoPasajero));

create table Terminal (
	IdTerminal decimal not null Primary Key,
	NombreTerminal varchar(60),
	IdPais decimal not null foreign key references Pais(IdPais));

create table bus (
	Idbus decimal not null Primary Key,
	Tipobus varchar(60),
	Capacidadbus integer,
	Marcabus varchar(80));

create table Asiento (
	Idbus decimal not null foreign key references bus (Idbus),
	FilaAsiento integer,
	LetraAsiento char(2),
	Primary Key (Idbus,FilaAsiento,LetraAsiento));

create table Viaje (
	IdTerminalOrigenViaje decimal not null foreign key references Terminal
	(IdTerminal),
	IdTerminalDestinoViaje decimal not null foreign key references Terminal
	(IdTerminal),
	FechaHoraViaje datetime,
	Importe float,
	Idbus decimal foreign key references bus (Idbus),
	IdViaje decimal not null Primary Key);

create table Boleto (
	IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
	Idbus decimal not null foreign key references bus (Idbus),
	FilaAsiento integer,
	LetraAsiento char(2),
	FechaCompraBoleto date,
	IdViaje decimal not null foreign key references Viaje (IdViaje),
	Foreign key (Idbus,FilaAsiento,LetraAsiento) references
	Asiento(Idbus,FilaAsiento,LetraAsiento));

create table PasajeroMercoSur (
	IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
	PorcentajePasajeroMercoSur float,
	Primary Key (IdPasajero));

create table PasajeroMercoSurBeneficio (
	IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
	BeneficioMercoSur varchar(80),
	Primary Key (IdPasajero,BeneficioMercoSur));

 --DML--
 --Precarga Propias--

INSERT INTO pais VALUES (1,'URUGUAY');
INSERT INTO pais VALUES (2,'ARGENTINA');
INSERT INTO pais VALUES (3,'BRASIL');
INSERT INTO pais VALUES (4,'CHILE');

INSERT INTO pasajero VALUES (1,'JORGE','PEREZ','NUÑEZ','CI','12345678','1992-07-23','jperez@hotmail.com','pereznu012',1);
INSERT INTO pasajero VALUES (2,'JUAN','GARCIA','CORTEZ','CI','87654321','1985-02-14','jgarciacortez@gmail.com','cortez0505',2);
INSERT INTO pasajero VALUES (3,'LUIS','ABELLA','GUTIERREZ','RUC','11223344','1990-05-05','soyturista@gmail.com','password01',4);
INSERT INTO pasajero VALUES (4,'ANA','SORIA','SILVERA','CI','55667788','1995-03-29','megaman58@gmail.com','netflix123*',3);
INSERT INTO pasajero VALUES (5,'SONIA','RUIZ','TOMAS','RUC','44332211','1990-08-10','soniart@hotmail.com','sonia1990',1);
INSERT INTO pasajero VALUES (6,'CAROLINA','DIAZ','MARTINEZ','CI','45879389','1995-07-23','caro120@hotmail.com','holaCaro',1);
INSERT INTO pasajero VALUES (7,'JUAN','GOMEZ','MENDEZ','CI','5879245','1980-02-14','nomore2021@gmail.com','tomala87',2);
INSERT INTO pasajero VALUES (8,'SEBASTIAN','MOLLER','GUZMAN','RUC','87422226','1997-05-05','seba11454@gmail.com','password20254',4);
INSERT INTO pasajero VALUES (9,'CECILIA','GONZALES','SILVA','CI','58899863','1991-03-29','cecigonsil2021@gmail.com','258\-92',3);
INSERT INTO pasajero VALUES (10,'NICOLAS','TORRES','LUCAS','CI','44332289','1975-02-15','nicotolunas@hotmail.com','lucas2087',1);

INSERT INTO pasajeroTelefono VALUES(1,'099099099');
INSERT INTO pasajeroTelefono VALUES(2,'095666777');
INSERT INTO pasajeroTelefono VALUES(3,'098776655');
INSERT INTO pasajeroTelefono VALUES(4,'099112233');
INSERT INTO pasajeroTelefono VALUES(4,'095432234');

INSERT INTO terminal VALUES (1,'Tres Cruces',1);
INSERT INTO terminal VALUES (2,'Micros CATA',2);
INSERT INTO terminal VALUES (3,'El Rapido',2);
INSERT INTO terminal VALUES (4,'Terminal de Brasilia',3);
INSERT INTO terminal VALUES (5,'Santa Maria De Los Angeles',4);
INSERT INTO terminal VALUES (6,'Terminal San Pedro',1);
INSERT INTO terminal VALUES (7,'Terminal Canela',4);
INSERT INTO terminal VALUES (8,'Terminal 79',3);
INSERT INTO terminal VALUES (9,'La Gran Central',2);

INSERT INTO bus VALUES (1,'2 pisos',80,'Buquebus');
INSERT INTO bus VALUES (2,'Comun',50,'Copsa');
INSERT INTO bus VALUES (3,'Comun',50,'Honda');
INSERT INTO bus VALUES (4,'2 pisos',80,'CATA');
INSERT INTO bus VALUES (5,'Comun',20,'SATA');
INSERT INTO bus VALUES (6,'2 pisos',34,'Corsa');
INSERT INTO bus VALUES (7,'Comun',30,'Dairy');
INSERT INTO bus VALUES (8,'Comun',32,'Fago');
INSERT INTO bus VALUES (9,'2 pisos',70,'Pony');
INSERT INTO bus VALUES (10,'2 pisos',70,'Tigre');

INSERT INTO asiento VALUES (1,11,'A');
INSERT INTO asiento VALUES (1,8,'C');
INSERT INTO asiento VALUES (1,4,'B');
INSERT INTO asiento VALUES (1,7,'A');
INSERT INTO asiento VALUES (2,2,'A');
INSERT INTO asiento VALUES (2,8,'C');
INSERT INTO asiento VALUES (2,1,'D');
INSERT INTO asiento VALUES (3,6,'A');
INSERT INTO asiento VALUES (3,6,'B');
INSERT INTO asiento VALUES (3,6,'C');
INSERT INTO asiento VALUES (4,11,'A');
INSERT INTO asiento VALUES (4,9,'A');
INSERT INTO asiento VALUES (4,9,'D');
INSERT INTO asiento VALUES (4,11,'C');

INSERT INTO viaje VALUES (1,2,'2021-11-07 06:00:00',1000,9,1);
INSERT INTO viaje VALUES (1,3,'2021-11-08 07:00:00',1000,8,2);
INSERT INTO viaje VALUES (1,4,'2021-11-09 08:00:00',600,7,3);
INSERT INTO viaje VALUES (1,5,'2021-11-10 09:00:00',800,6,4);
INSERT INTO viaje VALUES (2,1,'2021-11-11 10:00:00',1200,5,5);
INSERT INTO viaje VALUES (2,3,'2021-11-12 11:00:00',1000,4,6);
INSERT INTO viaje VALUES (2,4,'2021-11-13 12:00:00',600,3,7);
INSERT INTO viaje VALUES (2,5,'2021-11-14 13:00:00',800,2,8);
INSERT INTO viaje VALUES (3,1,'2021-11-15 14:00:00',1200,1,9);
INSERT INTO viaje VALUES (3,2,'2021-11-16 15:00:00',1200,9,10);
INSERT INTO viaje VALUES (3,4,'2021-11-17 16:00:00',1200,8,11);
INSERT INTO viaje VALUES (3,5,'2021-11-18 17:00:00',1000,7,12);
INSERT INTO viaje VALUES (4,1,'2021-11-19 18:00:00',600,6,13);
INSERT INTO viaje VALUES (4,2,'2021-11-20 19:00:00',800,5,14);
INSERT INTO viaje VALUES (4,3,'2021-11-21 20:00:00',1200,4,15);
INSERT INTO viaje VALUES (4,5,'2021-11-22 21:00:00',1200,3,16);
INSERT INTO viaje VALUES (5,1,'2021-11-23 22:00:00',1200,2,17);
INSERT INTO viaje VALUES (5,2,'2021-11-24 23:00:00',1200,1,18);
INSERT INTO viaje VALUES (5,3,'2021-11-25 00:00:00',600,6,19);
INSERT INTO viaje VALUES (5,4,'2021-11-26 01:00:00',800,5,20);
INSERT INTO viaje VALUES (1,2,'2021-11-27 02:00:00',1000,9,21);
INSERT INTO viaje VALUES (1,3,'2021-11-28 03:00:00',1000,8,22);
INSERT INTO viaje VALUES (1,4,'2021-11-29 04:00:00',600,7,23);
INSERT INTO viaje VALUES (1,5,'2021-11-30 05:00:00',800,6,24);
INSERT INTO viaje VALUES (2,1,'2021-12-01 06:00:00',1200,5,25);
INSERT INTO viaje VALUES (2,3,'2021-12-02 07:00:00',1000,4,26);
INSERT INTO viaje VALUES (2,4,'2021-12-03 08:00:00',600,3,27);
INSERT INTO viaje VALUES (2,5,'2021-12-04 09:00:00',800,2,28);
INSERT INTO viaje VALUES (3,1,'2021-12-05 10:00:00',1200,1,29);
INSERT INTO viaje VALUES (3,2,'2021-12-06 11:00:00',1200,9,30);
INSERT INTO viaje VALUES (3,4,'2021-12-07 12:00:00',1200,8,31);
INSERT INTO viaje VALUES (3,5,'2021-12-08 13:00:00',1000,7,32);
INSERT INTO viaje VALUES (4,1,'2021-12-09 14:00:00',800,5,255);

INSERT INTO boleto VALUES (1,3,6,'B','2021-09-30',4);
INSERT INTO boleto VALUES (1,3,6,'A','2021-09-30',4);
INSERT INTO boleto VALUES (2,2,8,'C','2021-10-25',1);
INSERT INTO boleto VALUES (3,1,4,'B','2021-09-12',2);
INSERT INTO boleto VALUES (4,4,9,'A','2021-10-09',3);
INSERT INTO boleto VALUES (4,4,9,'D','2021-10-09',3);
INSERT INTO boleto VALUES (4,4,9,'D','2021-10-09',3);
INSERT INTO boleto VALUES (4,4,9,'D','2021-09-09',3);
INSERT INTO boleto VALUES (4,4,9,'D','2021-09-09',3);
INSERT INTO boleto VALUES (4,4,9,'D','2021-10-09',3);
INSERT INTO boleto VALUES (4,4,9,'D','2021-09-09',255);
INSERT INTO boleto VALUES (3,1,4,'B','2021-10-12',2);
INSERT INTO boleto VALUES (3,1,4,'B','2021-09-12',2);
INSERT INTO boleto VALUES (3,1,4,'B','2021-10-12',2);
INSERT INTO boleto VALUES (3,1,4,'B','2021-09-12',2);
INSERT INTO boleto VALUES (3,1,4,'B','2021-10-11',2);
INSERT INTO boleto VALUES (3,1,4,'B','2021-12-17',2);
INSERT INTO boleto VALUES (4,4,9,'D','2021-09-01',3);
INSERT INTO boleto VALUES (4,4,9,'D','2021-09-02',3);
INSERT INTO boleto VALUES (3,4,9,'D','2021-09-03',3);
INSERT INTO boleto VALUES (9,4,9,'D','2021-09-04',3);
INSERT INTO boleto VALUES (3,4,9,'D','2021-09-05',32);
INSERT INTO boleto VALUES (7,4,9,'D','2021-09-06',255);
INSERT INTO boleto VALUES (2,4,9,'D','2021-09-07',30);
INSERT INTO boleto VALUES (4,4,9,'D','2021-09-08',29);
INSERT INTO boleto VALUES (6,4,9,'D','2021-09-09',28);
INSERT INTO boleto VALUES (6,4,9,'D','2021-09-10',27);
INSERT INTO boleto VALUES (6,4,9,'D','2021-09-11',26);
INSERT INTO boleto VALUES (3,4,9,'D','2021-09-12',255);
INSERT INTO boleto VALUES (4,4,9,'D','2021-09-13',24);
INSERT INTO boleto VALUES (4,4,9,'D','2021-09-14',23);
INSERT INTO boleto VALUES (3,4,9,'D','2021-09-15',22);
INSERT INTO boleto VALUES (8,4,9,'D','2021-09-16',255);
INSERT INTO boleto VALUES (5,4,9,'D','2021-09-17',20);
INSERT INTO boleto VALUES (7,4,9,'D','2021-09-18',19);
INSERT INTO boleto VALUES (6,4,9,'D','2021-09-09',255);
INSERT INTO boleto VALUES (6,4,9,'D','2021-09-10',17);
INSERT INTO boleto VALUES (6,4,9,'D','2021-09-10',16);

INSERT INTO pasajeroMercoSur VALUES (1,30);
INSERT INTO pasajeroMercoSur VALUES (4,40);

INSERT INTO pasajeroMercoSurBeneficio VALUES (1,'Desayuno y almuerzo gratuito.');
INSERT INTO pasajeroMercoSurBeneficio VALUES (4,'Desayuno y almuerzo gratuito.');

--Precarga AULAS--

Insert into Pais
values (1,'Uruguay'),(2,'Brasil'),(3,'Argentina'),(4,'Paraguay'),(5,'Espa�a'),(6,'Rusia'),(7,'Chile');

insert into Pasajero
values	(1,'Lionel','Messi','','AAA',1111,'1992-12-12','adrimede@hotmail.com','adr123',1),
		(2,'Neymar','Junior','','BBB',2222,'1990-12-24','brupic@hotmail.com','bru123',3),
		(3,'Paulo','Dybala','','CCC',3333,'1960-05-10','juanan@hotmail.com','jua123',2),
		(4,'Thiago','Silva','','DDD',4444,'1980-07-12','soyturista@gmail.com','seb123',2),
		(5,'Gonzalo','Higuain','','EEE',5555,'1995-10-28','fedemede@hotmail.com','fed123',1),
		(10,'Fernando','Muslera','','AAA',1111,'1992-12-12','fernandomuslera@hotmail.com','xxx',1),
		(11,'Diego','Godin','','BBB',2222,'1990-12-24','diegogodin@hotmail.com','yyy',1),
		(12,'Jos� Mar�a','Gimenez','','CCC',3333,'1960-05-10','josema@hotmail.com','zzz',1),
		(13,'Luis','Suarez','','DDD',4444,'1980-07-12','luchosuarez@gmail.com','ttt',1),
		(14,'Edinson','Cavani','','EEE',5555,'1995-10-28','edicavani@hotmail.com','www',1),
		(15,'Arturo','Vidal','','EEE',5555,'1995-10-28','artrito@hotmail.com','www',7);

insert into PasajeroTelefono
values(1,'095237627'),
	  (2,'095223234'),
	  (3,'092232327'),
	  (4,'094237627'),
	  (5,'092237627'),
	  (1,'097237237');

insert into Terminal
values(1,'Montevideo',1),
      (2,'San Pablo',2),
	  (3,'Buenos Aires',3),
	  (4,'Rio',2),
	  (5,'Asuncion',4),
	  (6,'Santiago de chile',7),
	  (7,'Moscu',6),
	  (8,'Leningrado',6);

insert into bus
values(1,'Internacional',40,'CUTCSA'),
      (2,'Urbano',32,'CUTCSA'),
      (3,'Internacional',40,'COME'),
	  (4,'Urbano',32,'COME');

insert into Asiento
values	(1,1,'A'),(1,2,'A'),(1,3,'A'),(1,4,'A'),
		(1,1,'B'),(1,2,'B'),(1,3,'B'),(1,4,'B'),
		(1,1,'C'),(1,2,'C'),(1,3,'C'),(1,4,'C'),
		(1,1,'D'),(1,2,'D'),(1,3,'D'),(1,4,'D'),
		(2,1,'A'),(2,2,'A'),(2,3,'A'),(2,4,'A'),
		(2,1,'B'),(2,2,'B'),(2,3,'B'),(2,4,'B'),
		(2,1,'C'),(2,2,'C'),(2,3,'C'),(2,4,'C'),
		(2,1,'D'),(2,2,'D'),(2,3,'D'),(2,4,'D'),
		(3,1,'A'),(3,2,'A'),(3,3,'A'),(3,4,'A'),
		(3,1,'B'),(3,2,'B'),(3,3,'B'),(3,4,'B'),
		(3,1,'C'),(3,2,'C'),(3,3,'C'),(3,4,'C'),
		(3,1,'D'),(3,2,'D'),(3,3,'D'),(3,4,'D'),
		(4,1,'A'),(4,2,'A'),(4,3,'A'),(4,4,'A'),
		(4,1,'B'),(4,2,'B'),(4,3,'B'),(4,4,'B'),
		(4,1,'C'),(4,2,'C'),(4,3,'C'),(4,4,'C'),
		(4,1,'D'),(4,2,'D'),(4,3,'D'),(4,4,'D');


insert into Viaje(IdTerminalOrigenViaje,IdTerminalDestinoViaje,FechaHoraViaje,Importe,Idbus,IdViaje)
values	(1,2,'2018-06-01 12:30:40',150,1,1),   -- Montevideo San Pablo
		(1,2,'2017-05-12 12:30:40',150,1,2),   -- Montevideo San Pablo
		(5,1,'2017-07-17 15:40:10',120,2,3),   -- Asuncion Montevideo 
		(2,3,'2017-08-28 19:00:15',100,3,4),   -- San Pablo Buenos Aires
		(4,8,'2017-09-04 21:45:55',150,4,5),   -- Rio Moscu 
		(1,2,'2017-11-16 00:00:00',150,3,6),   -- Montevideo San Pablo modificar esta fecha para el bus que sale ma�ana
		(5,1,'2017-11-15 12:40:00',150,3,7),   -- viaje del boleto del mes 9 
		(1,4,'2017-12-21 05:10:00',250,1,8),   -- viaje del boleto del mes 9
		(5,2,'2017-10-02 21:20:00',120,3,9),   -- viaje del boleto del mes 9 
		(1,3,'2017-11-20 00:00:00',150,3,255), -- Montevideo Buenos Aires
	    (5,3,'2017-12-13 00:00:00',130,4,256), -- Asuncion Buenos Aires
		(1,8,'2018-06-01 12:30:40',150,1,100), -- montevideo moscu
		(1,6,'2018-06-01 12:30:40',150,1,101); -- montevideo santiago

insert into Boleto
values	(1,1,1,'A','2017-01-01',1),	   		
		(1,1,1,'B','2017-01-01',1),
		(1,1,1,'C','2017-01-01',1),
		(1,1,1,'D','2017-01-01',1),
		(2,1,2,'A','2017-02-05',2),
		(4,3,2,'A','2017-09-15',7),--boleto del mes 9 del mail soyturista@gmail.com
		(4,1,4,'C','2017-09-22',8),--boleto del mes 9 del mail soyturista@gmail.com
		(4,3,3,'A','2017-09-05',9),--boleto del mes 9 del mail soyturista@gmail.com
		(4,3,2,'A','2017-09-05',9),--boleto del mes 9 del mail soyturista@gmail.com
		(2,1,2,'B','2017-02-05',2),
		(3,2,2,'A','2017-03-17',3),
		(4,3,1,'B','2017-05-15',4),
		(5,4,3,'C','2017-07-25',5),
		(2,1,3,'A','2017-02-05',2),
		(2,1,3,'B','2017-02-05',2),
		(2,1,1,'A','2017-02-05',2),
		(2,1,1,'B','2017-02-05',2),
		(4,3,4,'B','2017-01-09',255),
		(10,1,1,'A','2017-01-01',100),	   		
		(11,1,1,'B','2017-01-01',100),
		(12,1,1,'C','2017-01-01',100),
		(13,1,1,'D','2017-01-01',100),
		(14,1,2,'A','2017-02-05',100),
		(15,1,2,'A','2017-02-05',101);


insert into PasajeroMercoSur
values	(1,5),(2,5),(5,10);


insert into PasajeroMercoSurBeneficio
values	(1,'Beneficio por ser pasajero mercosur'),
		(2,'Beneficio por ser pasajero mercosur'),
		(5,'Beneficio por ser pasajero mercosur');

--DQL--

--1. Listar el o los nombres de los pasajeros con la mayor cantidad de pasajes comprados a su nombre.

SELECT p.NombrePasajero FROM Boleto b , Pasajero p
WHERE p.IdPasajero = b.IdPasajero group by p.NombrePasajero 
HAVING COUNT(b.IdPasajero) = (SELECT MAX(y.CantidadBoletos) Mayor_Cantidad_Boletos FROM 
(SELECT b.IdPasajero , COUNT(b.IdPasajero) CantidadBoletos FROM Boleto b group by b.IdPasajero) y);

-- 2. Listar todos los datos de los buses con más de 35 asientos que no tengan asignado ningún destino
-- que parta el día de mañana.

SELECT b.* FROM bus b WHERE b.Idbus not in (SELECT distinct V.Idbus FROM Viaje v 
WHERE CAST((v.FechaHoraViaje) as DATE) = CAST(GETDATE()+1 as DATE)) and b.Capacidadbus > 35

-- 3. Listar todos los datos de los pasajeros para los cuales haya registrados en el sistema más de 5 
--pasajes comprados.

SELECT p.* FROM Pasajero p , (SELECT b.IdPasajero , COUNT(b.IdPasajero) CantidadBoletos 
FROM Boleto b group by b.IdPasajero)c 
WHERE p.IdPasajero = c.IdPasajero and c.CantidadBoletos >5

--4. Listar idpasajero, nombre, apellidos y asiento (idasiento y fila) que correspondan a pasajes comprados
--para el destino cuyo idviaje es 255. 

SELECT p.IdPasajero, p.NombrePasajero, p.APaternoPasajero, p.AMaternoPasajero, b.FilaAsiento, b.LetraAsiento FROM 
Boleto b , Pasajero p WHERE b.IdPasajero = p.IdPasajero and b.IdViaje = 255

-- 5. Listar todos los iddestino y cantidad de pasajes comprados durante el mes de Setiembre de este año para 
-- c/u de los destinos del pasajero cuyo correo es soyturista@gmail.com.
-- La lista debe estar ordenada por iddestino ascendente.

SELECT v.IdTerminalDestinoViaje , COUNT(b.IdPasajero) Cantidad 
FROM Boleto b , Viaje v , Pasajero p 
WHERE p.IdPasajero=b.IdPasajero and v.IdViaje=b.IdViaje and p.EmailPasajero = 'soyturista@gmail.com'  
and FechaCompraBoleto between '2021-09-01' and '2021-09-30' 
group by v.IdTerminalDestinoViaje
order by v.IdTerminalDestinoViaje asc