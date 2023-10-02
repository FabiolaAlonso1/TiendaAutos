Drop database if exists TiendaAutos;
create database TiendaAutos;
use TiendaAutos;

create table roles(
    id int not null primary key auto_increment,
    nombre varchar(255) not null
);

create table compra(
	id int unsigned auto_increment primary key,
	fecha_compra date not null,
	precio_compra float not null,
	metodo_pago varchar(255) not null
);

create table usuario(
	id int unsigned auto_increment primary key,
	nombre varchar(255) not null,
	apaterno varchar(255) not null,
	amaterno varchar(255) not null,
	telefono varchar (10) not null,
    direccion varchar (255) not null,
    contraseña varchar(255) not null,
    rol_id int not null,
    correo_electronico varchar (255) not null,
    foreign key (rol_id) references roles(id)
);

create table automovil(
	id int unsigned auto_increment primary key,
	marca varchar(255) not null,
	modelo varchar(255) not null,
	año varchar(4) not null,
	precio float not null,
    descripcion varchar(255) not null,
    imagen varchar(255) not null,
    stock boolean not null,
    id_usuario int unsigned not null,
    foreign key (id_usuario) references usuario(id)
);

create table comentarios(
    id int  unsigned auto_increment primary key,
    comentario varchar(255) not null,
    fecha_creacion datetime not null default current_timestamp(),
    estado int not null,
    id_usuario int unsigned not null,
    id_automovil int unsigned not null,
    foreign key (id_usuario) references usuario(id),
    foreign key (id_automovil) references automovil(id)
);

create table carrito(
    id int unsigned auto_increment primary key,
    id_auto int unsigned not null, 
    id_compra int unsigned not null,

	foreign key (id_auto) references automovil(id),
    foreign key (id_compra) references compra(id)

);