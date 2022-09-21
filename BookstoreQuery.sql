-- CREATE DATABASE BookstoreDB;


-- Libro, Autor, Usuario, Venta, Oferta 
use BookstoreDB;


CREATE TABLE Usuario(
	idUsuario int identity(1,1) not null primary key,
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL,
	fechaNacimiento date NOT NULL,
	rolUsuario varchar(50) NOT NULL,
	nombreUsuario varchar(100) NOT NULL,
	password varchar(50) NOT NULL
);

insert into Usuario(nombre,apellido,fechaNacimiento,rolUsuario,nombreUsuario,password) values ('Brayan','C','2000','admin','admin','admin');


CREATE TABLE Autor(
	idAutor int identity(1,1) NOT NULL primary key,
	nombreAutor varchar(50) NOT NULL,
	biografia text NOT NULL,
	twitter varchar(100) NOT NULL,
	instagram varchar(100) NOT NULL,
	fotoAutor varchar(500)
);
insert into Autor(nombreAutor,biografia,twitter,instagram,fotoAutor) values ('oscar','duran','duran','duran','duran');


CREATE TABLE Oferta(
	idOfertas int identity(1,1) NOT NULL primary key,
	temporada varchar(20) NOT NULL,
	descuento float NOT NULL,
	descripcion text
);
insert into Oferta(temporada,descuento,descripcion) values ('No aplica',0,'No aplica para ninguna oferta');
insert into Oferta(temporada,descuento,descripcion) values ('Verano',20,'Descuento en todos los productos');
insert into Oferta(temporada,descuento,descripcion) values ('Invierno',15,'Descuento en productos exclusivos');


CREATE TABLE Categoria(
	idCategoria int NOT NULL primary key ,
	Nombre varchar(50) NOT NULL,
);

insert into Categoria(idCategoria, Nombre) values (1,'Ficcion');
insert into Categoria(idCategoria, Nombre) values (2,'Misterio');
insert into Categoria(idCategoria, Nombre) values (3,'Clasico');
insert into Categoria(idCategoria, Nombre) values (4,'Fantasia');


CREATE TABLE Libro(
  idLibro int identity(1,1) NOT NULL primary key,
  idAutor int NOT NULL,
  titulo varchar(15) NOT NULL,
  idOfertas int not null,
  descripcion text NOT NULL,
  isbn varchar(20) NOT NULL,
  idCategoria int NOT NULL,
  precio float NOT NULL,
  portada varchar (200) NOT NULL,
);
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio) values (1,'oscar',3,'hola','hola2',3,20);
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio) values (1,'rexii',2,'hola','hola2',2,20);
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio) values (1,'copito',1,'hola','hola2',1,20);
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio) values (1,'Fantasia',2,'Fantasia','hola2',4,20);

ALTER TABLE Libro ADD CONSTRAINT fk_IdAutor
  FOREIGN KEY (idAutor) REFERENCES Autor(idAutor) ON DELETE CASCADE;

ALTER TABLE Libro ADD CONSTRAINT fk_IdOfertas
  FOREIGN KEY (idOfertas) REFERENCES Oferta(idOfertas) ON DELETE CASCADE;


ALTER TABLE Libro ADD CONSTRAINT fk_idCategoria
  FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria) ON DELETE CASCADE;


create table Venta(
	idVenta int identity(1,1) not null primary key,
	idLibro int NOT NULL,
	idUsuario int NOT NULL,
	cantidad int NOT NULL,
	impuesto float NOT NULL,
	subtotal float NOT NULL,
	totalPagar float NOT NULL
);

ALTER TABLE Venta ADD CONSTRAINT fk_IdLibro
  FOREIGN KEY (idLibro) REFERENCES Libro(idLibro) ON DELETE CASCADE;

ALTER TABLE Venta ADD CONSTRAINT fk_IdUsuario
  FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE;



select l.titulo, U.nombre, U.rolUsuario,v.totalPagar from Venta V 
join Usuario U on v.idUsuario = u.idUsuario 
join Libro l on v.idLibro = l.idLibro;

select * from autor;