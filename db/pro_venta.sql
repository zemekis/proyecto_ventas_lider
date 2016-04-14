CREATE DATABASE pro_venta;
USE pro_venta;

create table usuario(
id_usuario int auto_increment,
nombre_usuario varchar(50),
password_usuario varchar(50),
primary key(id_usuario)
);

create table marca(
id_marca int auto_increment,
nombre_marca varchar(50),
primary key(id_marca)
);
 
create table tipo(
id_tipo int auto_increment,
nombre_tipo varchar(50),
primary key(id_tipo)
);

create table producto(
id_producto int auto_increment,
nombre_producto varchar(50),
precio_producto int,
stock_producto int,
marcaFK int ,
tipoFK int,
primary key(id_producto),
foreign key(marcaFK) references marca(id_marca),
foreign key(tipoFK) references tipo(id_tipo)
);

create table tipocliente(
id_tipoCliente int auto_increment,
nombre_tipoCliente varchar(50),
primary key (id_tipoCliente)
);

create table cliente(
id_cliente int auto_increment,
nombre_cliente varchar(50),
tipo_clienteFK int,
rut_cliente varchar(20),
primary key (id_cliente),
foreign key (tipo_clienteFK) references tipoCliente(id_tipoCliente)
);

create table metodopago(
id_metodoPago int auto_increment,
nombre_metodoPago varchar(50),
primary key (id_metodoPago)
);

create table venta(
id_venta int auto_increment,
direccionLocal_venta varchar(50),
fecha_venta timestamp,
giro_venta varchar(50),
metodo_pagoFK int,
id_usuarioFK  int,
id_clienteFK int ,
id_productoFK int,
primary key (id_venta),
foreign key (metodo_pagoFK)references metodoPago(id_metodopago),
foreign key (id_usuarioFK) references usuario(id_usuario),
foreign key (id_clienteFK)references cliente(id_cliente),
foreign key (id_productoFK)references producto(id_producto)
);


create table registrohistorico(
id_registroHistorico int auto_increment,
accion_registrohistorico varchar(50),
fecha_registrohistorico timestamp,
primary key(id_registrohistorico));


create table registroventa(
id_registroventa int auto_increment,
fecha_registro timestamp,
id_ventaFK int,
primary key (id_registroventa),
foreign key (id_ventaFK) references venta(id_venta)
);

-- drop database pro_venta;
-- drop table cliente;
-- drop table marca;
-- drop table metodoPago;
-- drop table producto;
-- drop table registrohistorico;
-- drop table registroventa;
-- drop table tipo;
-- drop table tipocliente;
-- drop table usuario;
-- drop table venta;
show tables;

