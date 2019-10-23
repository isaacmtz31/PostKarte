drop database if exists postkarte;
create database postkarte;
use postkarte;

drop table if exists usuarioPK;
create table usuarioPK
(
	idUsuario int(3) primary key not null,
    nombre nvarchar(80) not null,
    aPaterno nvarchar(80) not null,
    aMaterno nvarchar(80) not null, 
    email varchar(60) not null unique,
    passw varchar(32) not null,
    genero char(1) default 'U', /* F = FEMENIN | M = MASCULIN | U = UNDEFINED */
    edad date NOT NULL, 
    rol char(1) not null default 'N', /* N = NORMAL USER | A = ADMIN */ 
    fechaRegistro date default current_timestamp
);

drop table if exists categorias;
create table categorias
(
	idCategoria int(3) primary key not null, 
    descripcion nvarchar(200) not null, 
    titulo nvarchar(50) not null, 
    imagen nvarchar(300) null default 'C:\wamp64\www\postkarte_v2\imgs\categoria1.jpg',
    conteo int(4) not null default 0 /* TO COUNT EVERY KARTE SENT WHICHS BELONGS TO THIS CATEGORIE */
);


drop table if exists karte;
create table karte
(
	idKarte int(3) primary key not null,
    nombreK nvarchar(50) not null, 
    descripcion nvarchar(200) not null, 
    idCategoria int(3) not null, 
    enviados int(4) not null default 0,
    calificacion int(2) not null default 0,
    
    FOREIGN KEY  (idCategoria) REFERENCES categorias(idCategoria)
);

drop table if exists relCatKar;
create table relCatKar
(
	idKarte int(3) not null,
    idCategoria int(3) not null,
	
    FOREIGN KEY (idKarte) REFERENCES karte(idKarte),
    FOREIGN KEY (idCategoria) REFERENCES categorias(idCategoria)
);
