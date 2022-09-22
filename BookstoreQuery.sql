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
insert into Oferta(temporada,descuento,descripcion) values ('VERANO',15,'OFERTA DE VERANOESTA OFERTA REPRESENTA EL 15% DE DESCUENTO PARA PRODUCTOS EXCLUSIVOS');
insert into Oferta(temporada,descuento,descripcion) values ('INVIERNO',30,'ESTA OFERTA REPRESENTA EL 30% DE DESCUENTO PARA ELEVAR NUESTRAS VENTAS EN ESTA TEMPORADA');
insert into Oferta(temporada,descuento,descripcion) values ('CIERRE DE TEMPORADA',50,'ESTA OFERTA REPRESENTA EL 50% DE DESCUENTO POR BLACK FRIDAY, CYBER MONDAY, DÍA DE LAS MADRES O PADRE, NAVIDAD');
insert into Oferta(temporada,descuento,descripcion) values ('FECHAS ESPECIALES',70,'ESTA OFERTA REPRESENTA EL 70% DE DESCUENTO, SE LA CONOCE COMO UNA VENTA DE LIQUIDACIÓN QUE ABRE LA PUERTA PARA CONOCER NUEVOS PRODUCTOS.');



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
  titulo varchar(50) NOT NULL,
  idOfertas int not null,
  descripcion text NOT NULL,
  isbn varchar(50) NOT NULL,
  idCategoria int NOT NULL,
  precio float NOT NULL,
  portada varchar (500) NOT NULL,
);

ALTER TABLE Libro ADD CONSTRAINT fk_IdAutor
  FOREIGN KEY (idAutor) REFERENCES Autor(idAutor) ON DELETE CASCADE;

ALTER TABLE Libro ADD CONSTRAINT fk_IdOfertas
  FOREIGN KEY (idOfertas) REFERENCES Oferta(idOfertas) ON DELETE CASCADE;


ALTER TABLE Libro ADD CONSTRAINT fk_idCategoria
  FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria) ON DELETE CASCADE;


/* libros sin oferta Ficcion */
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (1,'El Ascenso de Próxima',1,'Varias realidades paralelas','01wqw',1,55,' https://images-na.ssl-images-amazon.com/images/I/41PIUSWMlYS._SX311_BO1,204,203,200_.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (8,'El lugar donde los equilibristas descansan',1,'Historias convincentes de ciencia','ewd5w',1,75,'https://luisgarciamillan.es/wp-content/uploads/2020/12/el-lugar-donde-los-equilibristas-descansan.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (9,'La Gran Catástrofe Amarilla',1,'Coyuntura actual ','1a48a',1,45,'https://luisgarciamillan.es/wp-content/uploads/2020/11/La-gran-catastrofe-amarilla-jj-benitez.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (8,'Un Mundo Feliz',1,'Nuestra sociedad está cambiando.','26dww',1,60,'https://luisgarciamillan.es/wp-content/uploads/2020/11/un-mundo-feliz-Aldous-Huxley.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (5,'Exhalación',1,'Ted Chiang el malo.','15q5q',1,45,'https://luisgarciamillan.es/wp-content/uploads/2020/11/exhalacion-ted-chiang.jpg');

/* libros con oferta Ficcion */
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (4,'Fahrenheit 451',3,'Cuenta la historia de un sombrío y horroroso futuro. Montag, el protagonista, pertenece a una extraña brigada de bomberos cuya misión es la de provocar incendios para quemar libros.','a254d',1,62,'https://images-na.ssl-images-amazon.com/images/I/71erWNLpZGL.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (8,'El problema de los tres cuerpos',2,'Es el primer libro de la Trilogía de los Tres Cuerpos. Además, es la primera obra galardonada con un Premio Hugo no escrita en inglés. Uno de los mejores libros de ciencia ficción sin duda','w455w',1,46,'https://luisgarciamillan.es/wp-content/uploads/2020/11/el-problema-de-los-tres-cuerpos-Cixin-Liu.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (6,'Roma soy yo: La verdadera historia de Julio César',3,' El cruel senador Dolabela va a ser juzgado por corrupción, pero ha contratado a los mejores abogados, ha comprado al jurado y, además, es conocido por usar la violencia contra todos los que se enfrentan a él.','c157c',1,29,'https://images-na.ssl-images-amazon.com/images/I/719yqLXOmyL.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (5,'Los penitentes J. E. Álamo',4,'Arrasa a los falsos predicadores, aquellos que claman contra mi nombre y lo ensucian al pronunciarlo. Tú serás el Segador. Aprenderán a temerte porque sabrán que tu palabra es la mía','s455w',1,43,'https://www.obscura.es/Imagenes/PorIdentidad?identidad=fa951c73-1400-4aff-bea8-c79a5a8aa40a');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (7,'Violeta Isabel Allende',2,'Violeta viene al mundo un tormentoso día de 1920, siendo la primera niña de una familia de cinco bulliciosos hermanos. Desde el principio su vida estará marcada por acontecimientos extraordinarios, pues todavía se sienten las ondas expansivas de la Gran Guerra cuando la gripe española llega a las orillas de su país','d154x',1,60,'https://imagessl5.casadellibro.com/a/l/t5/75/9788401027475.jpg');

/* libros sin oferta Misterio */
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (3,'El Juego del Alma',1,'Te sumergirás más y más.','0df8w',2,25,'https://www.mrbooks.com/mrbooks/portadas/9788491293545.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (1,'La bestia',1,'Mejores libros de misterio','ht51t',2,35,'https://libroveolibroleo.com/wp-content/uploads/2022/02/la-bestia-carmen-mola-393x600.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (4,'El Silencio de las Olas',1,'Enlaza de forma magistral ','i5a8a',2,100,'https://libroveolibroleo.com/wp-content/uploads/2021/03/el-silencio-de-las-olas-angela-banzas.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (8,'La hora de las Gaviotas',1,'Fuertes Autores femeninos','26dww',2,80,'https://libroveolibroleo.com/wp-content/uploads/2021/03/La-hora-de-las-Gaviotas-Ibon-Martin-392x600.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (5,'El silencio de la ciudad blanca',1,'Dando inicio a una trilogía.','a5a5q',2,36,'https://images-na.ssl-images-amazon.com/images/I/91fOLPVWbSL.jpg');


/* libros con oferta Misterio */
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (1,'Todo lo que sucedió con Miranda Huff',4,'Castillo decide profundizar en un tema cotidiano con su particular toque de drama y suspenso, para llevar a sus lectores una experiencia de miedo y giros emocionantes, que han convertido este libro en todo un fenómeno literario en Europa.','a489n',2,40,'https://libroveolibroleo.com/wp-content/uploads/2020/04/Todo-lo-que-sucedi---con-Miranda-Huff-391x600.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (3,'La pareja de al lado',2,'odo comienza con una cena cotidiana en casa de tus vecinos, mientras tu bebé de 6 meses dormía en casa y la visitabas cada media hora para asegurarte que todo estaba bien, pero en este momento mientras subes la escalera en medio de un silencio total','sf144',2,70,'https://libroveolibroleo.com/wp-content/uploads/2020/04/La-pareja-de-al-lado-395x600.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (5,'La cara norte del corazón',3,'En vísperas del peor huracán de la historia, Amia se dirige con un equipo de investigación a Nueva Orleans, pero una llamada de su tía la hará volver al pasado, a una infancia que había olvidado, enfrentándola de nuevo al miedo y recuerdos que la dotarán de un gran conocimiento.','aw485',2,40,'https://libroveolibroleo.com/wp-content/uploads/2020/04/La-cara-norte-del-coraz--n-350x600.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (8,'El pintor de almas',3,'Dalmau Sala vive dos realidades sociales en una ciudad dividida entre los desfavorecidos y los burgueses que se apegan al modernismo de la época. Por un lado está su familia y la mujer que ama, quienes defienden sin miedo a la clase obrera','asc14',2,50,'https://libroveolibroleo.com/wp-content/uploads/2020/04/El-pintor-de-almas-391x600.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (9,'La última cripta',4,'Una novela de misterio y de mucha acción es la que nos presenta el escritor español Fernando Gamboa, un experto que a través de maravillosos personajes nos hará emprender un viaje de aventuras, intrigas y misterios en cada palabra y en cada página.','sss44',2,67,'https://libroveolibroleo.com/wp-content/uploads/2020/04/La---ltima-cripta.jpg');

/* libros sin oferta Clasico */
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (2,'Las mil y una noches',1,' Hecho en la Edad Medieval.','0aa8w',3,15,'https://www.planetadelibros.com.ec/usuaris/libros/fotos/199/m_libros/198430_portada_las-mil-y-una-noches_anonimo_201502271755.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (3,'Don Quijote de la Mancha',1,'Rompió con todos los esquemas.','h26at',3,70,'https://planetadelibroscom.cdnstatics2.com/usuaris/libros/fotos/198/m_libros/portada_don-quijote-de-la-mancha_miguel-de-cervantes_201504281253.png');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (1,'Orgullo y prejuicio',1,'Poblada de grandes clásicos','ika5a',3,60,'https://planetadelibroscom.cdnstatics2.com/usuaris/libros/fotos/62/m_libros/portada_orgullo-y-prejuicio_jane-austen_201506271719.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (6,'Frankenstein',1,'Un desafío para la época.','35adq',3,32,'https://planetadelibroscom.cdnstatics2.com/usuaris/libros/fotos/191/m_libros/portada_frankenstein_mary-shelley_201506271720.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (7,'Cumbres borrascosas',1,'Desafío para los críticos.','7q8qz',3,45,'https://planetadelibroscom.cdnstatics2.com/usuaris/libros/fotos/264/m_libros/portada_cumbres-borrascosas_emily-bronte_201711281311.jpg');

/* libros con oferta Clasico */
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (2,'George Orwell',3,'Orwell creó una distopía donde la humanidad es totalmente controlada por una fuerza opresora: el gran hermano. La obra cuestiona cómo, a través de modificar el lenguaje y de la vigilancia omnipresente, se puede controlar toda una sociedad','ss14w2',3,80,'https://blogs.20minutos.es/yaestaellistoquetodolosabe/files/2013/06/El-d%C3%ADa-que-se-public%C3%B3-la-novela-%E2%80%981984%E2%80%99-de-George-Orwell.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (4,'El problema de los tres cuerpos',2,'Es el primer libro de la Trilogía de los Tres Cuerpos. Además, es la primera obra galardonada con un Premio Hugo no escrita en inglés. Uno de los mejores libros de ciencia ficción sin duda','365ss',3,70,'https://planetadelibroscom.cdnstatics2.com/usuaris/libros/fotos/322/m_libros/portada_grandes-esperanzas_charles-dickens_202007091854.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (6,'Mujercitas',3,'En “Mujercitas”, la autora nos cuenta la historia de tres jóvenes hermanas y de su vecino. A través de la novela, se puede seguir sus relaciones, sus aventuras y, sobre todo, el crecimiento personal de las tres hermanas. “Mujercitas” es una novela emocionante y tierna, ideal para entender el contexto de la época.','ww895',3,70,'https://planetadelibroscom.cdnstatics2.com/usuaris/libros/fotos/301/m_libros/portada_mujercitas_louisa-may-alcott_201908020955.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (8,'Madame Bovary',4,'Madame Bovary es todo un clásico de la literatura francesa, donde se retrata la vida de la protagonista en una sociedad donde no tiene ni voz ni voto. A través de la mirada del personaje, descubrimos la Francia de después de la revolución francesa y sus costumbres de la alta nobleza.','987ww',3,90,'https://planetadelibroscom.cdnstatics2.com/usuaris/libros/fotos/218/m_libros/portada_madame-bovary_gustave-flaubert_201606262159.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (9,'Crimen y castigo',2,'Si quieres vivir un viaje tanto histórico como introspectivo del comportamiento humano, Dostoyevski es el autor ideal para ponerte entre la espada y la pared. “Crimen y castigo” es una de las grandes obras de la literatura rusa, así como de la literatura universal, que trata temas tan candentes como la muerte, la culpa, la locura','aw778',3,80,'https://planetadelibroscom.cdnstatics2.com/usuaris/libros/fotos/214/m_libros/portada_crimen-y-castigo_fiodor-m-dostoievski_201604251800.jpg');
/* libros sin oferta Fantasia */
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (6,'De sangre y cenizas',1,'Adictiva e inesperada','0a77w',4,18,' https://covers.alibrate.com/b/60b68ab1e8b29a072d4b71b3/180600f5-4060-4610-a92b-d0eab0c40d32/share');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (2,'Carval',1,'Sueños de realidad ','h8W8t',4,75,'https://queridolibro.com/wp-content/uploads/2022/01/512lwQh50S._SX315_BO1204203200_.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (5,'Escuadrón',1,'Siglos en guerra','i545a',4,31,'https://queridolibro.com/wp-content/uploads/2022/01/81Le1hP5f1L-659x1024.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (4,'El último deseo',1,'Se gana la vida como cazador. ','35SD6',4,56,'https://queridolibro.com/wp-content/uploads/2022/01/71FitA91OL-654x1024.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (1,'El príncipe cruel',1,' Sus padres fueron asesinados.','89a4a',4,77,'https://queridolibro.com/wp-content/uploads/2022/01/71gEBBEpx3L-683x1024.jpg');

/* libros con oferta Fantasia */
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (4,'El nombre del viento',3,'La novela cuenta la historia de Kvothe, un personaje legendario que, tras años de retiro, accede a contar a un cronista los verdaderos motivos por los que se convirtió en leyenda. Atípica, profunda y sincera, El nombre del viento es una novela de aventuras, de historias dentro de otras historias, de misterio, de amistad, de amor, de magia y de superación que ha deslumbrado a todos los que la han leído.','v258r',4,40,'https://queridolibro.com/wp-content/uploads/2022/01/51cGrEjmBDL-1.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (2,'Seis de cuervos',3,'Kaz Brekker, un genio del crimen que regenta un antro de juegos de azar y apuestas conocido como el Club Cuervo, debe reunir a un grupo de seis personas con las habilidades necesarias para entrar (y salir) de la Corte de Hielo, una fortaleza inexpugnable que mantiene bajo llave un secreto que podría dinamitar el equilibrio de poder en el mundo.','r2648r',4,25,'https://queridolibro.com/wp-content/uploads/2022/01/9788416387588-1.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (3,'LORE',4,'Cada siete años comienza el agón. Como castigo por la rebelión, nueve dioses griegos son forzados a caminar por la Tierra, entre los mortales, mientras son perseguidos por cazadores, descendientes de antiguos linajes, con ansias de matar a un dios y hacerse con su poder divino y su inmortalidad.','ty3265',4,65,'https://queridolibro.com/wp-content/uploads/2022/01/81ERUXSkWSL-2.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (1,'CRONICAS DE LA TORRE 1',4,'Dana creció junto a sus hermanos llevando una vida normal. El día que el Maestro la llevó con él a la Torre, en el Valle de los Lobos, no se imaginaba que su vida cambiaría para siempre y que se convertiría en la depositaria de secretos tan mágicos como antiguos.','s4525w',4,35,'https://queridolibro.com/wp-content/uploads/2022/01/915DT-Lmh1L-680x1024.jpg');
insert into Libro(idAutor,titulo,idOfertas,descripcion,isbn,idCategoria,precio,portada) values (6,'La rueda del tiempo',2,'La vida de Rand Al’Thor y sus amigos en Campo de Emond ha resultado bastante monótona hasta que una joven misteriosa llega al pueblo. Moraine, una maga capaz de encauzar el Poder Único, anuncia el despertar de una terrible amenaza.','s248f',4,40,'https://queridolibro.com/wp-content/uploads/2022/01/91BrzYTawmL-640x1024.jpg');

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