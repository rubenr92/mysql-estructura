DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

CREATE TABLE cliente(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    tlf INT NOT NULL
);


CREATE TABLE empleado(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100) NOT NULL,
    dni VARCHAR(9) NOT NULL,    
    tlf INT NOT NULL,
    puesto VARCHAR(10),
    direccion_tienda VARCHAR (100)
);

CREATE TABLE pedidos(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(200),
    imagen VARCHAR(100),
    precio FLOAT NOT NULL,
    tipo VARCHAR (20),
    fecha DATETIME,
    id_cliente INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    id_empleado INT UNSIGNED,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id)  
);

INSERT INTO cliente VALUES(1,'Carla','Garcia', 'Garcia', 'Florida, 08030, bcn, bcn', 612345678);
INSERT INTO cliente VALUES(2,'Jorje','Perez', 'Martin', 'Florida, 08040, bcn, bcn', 634567891);

INSERT INTO empleado VALUES(1,'Pedro','Gonzalez', 'Muñoz', '37221428P',62234432,'cocinero','Aragon, 08030, Barcelona, Barcelona');
INSERT INTO empleado VALUES(2,'Juan','Hernandez', 'Flores', '37221728T',622344322,'repartidor','Aragon, 08030, Barcelona, Barcelona');
INSERT INTO empleado VALUES(3,'Maria','Morales', 'Gonzalez', '38221428P',622344323,'repartidor','Marina, 08040, Barcelona, Barcelona');
INSERT INTO empleado VALUES(4,'Carlos','Lopez', 'Rojas', '38251428S',622344324,'cocinero','Marina, 08040, Barcelona, Barcelona');
INSERT INTO empleado VALUES(5,'Julia','Diaz', 'Gonzalez', '39227728A',622344325,'cocinero','Aragon, 08030, Barcelona, Barcelona');


INSERT INTO pedidos VALUES(1, 'Pizza carbonara', null, null, 12,'pizza mediana','2024-07-10 21:00:00' ,1,2);
INSERT INTO pedidos VALUES(2,'Hamburguesa con queso', null, null, 9, 'hamburguesa','2024-07-10 21:04:00' ,2,3);
INSERT INTO pedidos VALUES(3,'Pizza margarita', null, null, 10, 'pizza pequeña','2024-07-10 21:00:00', 1,2);
INSERT INTO pedidos VALUES(4,'Coca cola', null, null, 2, 'bebida','2024-07-10 21:00:00' , 1,2);
INSERT INTO pedidos VALUES(5,'Hamburguesa con queso', null, null, 9, 'hamburguesa','2024-07-10 21:04:00' , 2,3);
INSERT INTO pedidos VALUES(6,'pizza carbonara', null, null, 12, 'bebida','2024-07-10 21:04:00' ,2,3);
INSERT INTO pedidos VALUES(7,'Fanta naranja', null, null, 2, 'bebida','2024-07-10 21:04:00' ,2,3);






