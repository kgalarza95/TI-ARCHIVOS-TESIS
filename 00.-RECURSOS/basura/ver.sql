--creando tabla de socios
 create table socios(
  documento char(8) not null, 
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key(documento)
 );

--creando tabla deportes
 create table deportes(
  codigo number(2),
  nombre varchar2(20),
  profesor varchar2(15),
  primary key(codigo)
 );

--creando tabla inscriptos
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte number(2) not null,
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
 );

--llenando tabla socios
 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

--llenando tabla deportes
 insert into deportes values(1,'basquet','Juan Juarez');
 insert into deportes values(2,'futbol','Pedro Perez');
 insert into deportes values(3,'natacion','Marina Morales');
 insert into deportes values(4,'tenis','Marina Morales');

--llenando tabla inscriptos
 insert into inscriptos values ('22222222',3,'2016','s');
 insert into inscriptos values ('23333333',3,'2016','s');
 insert into inscriptos values ('24444444',3,'2016','n');
 insert into inscriptos values ('22222222',3,'2015','s');
 insert into inscriptos values ('22222222',3,'2017','n');
 insert into inscriptos values ('24444444',1,'2016','s');
 insert into inscriptos values ('24444444',2,'2016','s');
 insert into inscriptos values ('26666666',0,'2016','s');
