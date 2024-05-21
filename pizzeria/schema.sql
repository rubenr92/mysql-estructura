DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

CREATE TABLE cliente(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    codigo_postal INT NOT NULL,
    localidad VARCHAR(30) NOT NULL,
    provincia VARCHAR(30) NOT NULL,
    tlf INT NOT NULL
);

CREATE TABLE tienda(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(50) NOT NULL,
    codigo_postal INT NOT NULL,
    localidad VARCHAR(30) NOT NULL,
    provincia VARCHAR(30) NOT NULL
);

CREATE TABLE empleado(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100) NOT NULL,
    dni VARCHAR(9) NOT NULL,    
    tlf INT NOT NULL,
    puesto VARCHAR(10),
    id_tienda INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_tienda) REFERENCES tienda(id)
);

CREATE TABLE pedido(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    hora TIME,
    tipo VARCHAR(11),
    numhamb INT ,
    numpizzas INT,
    numbebidas INT ,
    precio FLOAT NOT NULL,
    id_tienda INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_tienda) REFERENCES tienda(id),
    id_cliente INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    id_repartidor INT UNSIGNED,
    FOREIGN KEY (id_repartidor) REFERENCES empleado(id)
);

CREATE TABLE producto(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(200),
    imagen VARCHAR(100),
    precio FLOAT NOT NULL,
    tipo VARCHAR(12)
);


INSERT INTO cliente VALUES(1,'Carla','Garcia', 'Garcia', 'Florida', 08030, 'bcn', 'bcn', 612345678);
INSERT INTO cliente VALUES(2,'Jorje','Perez', 'Martin', 'Florida', 08040, 'bcn', 'bcn', 634567891);

INSERT INTO tienda VALUES(1,'Aragon','08030', 'Barcelona', 'Barcelona');
INSERT INTO tienda VALUES(2,'Marina','08040', 'Barcelona', 'Barcelona');

INSERT INTO empleado VALUES(1,'Pedro','Gonzalez', 'Muñoz', '37221428P',62234432,'cocinero',1);
INSERT INTO empleado VALUES(2,'Juan','Hernandez', 'Flores', '37221728T',622344322,'repartidor',1);
INSERT INTO empleado VALUES(3,'Maria','Morales', 'Gonzalez', '38221428P',622344323,'repartidor',2);
INSERT INTO empleado VALUES(4,'Carlos','Lopez', 'Rojas', '38251428S',622344324,'cocinero',2);
INSERT INTO empleado VALUES(5,'Julia','Diaz', 'Gonzalez', '39227728A',622344325,'cocinero',2);

INSERT INTO pedido VALUES(1, null,null,'domicilio',2,0,1,24,1,1,2);
INSERT INTO pedido VALUES(2, null,null,'domicilio',1,1,1,24,2,1,3);

INSERT INTO producto VALUES(1, 'Pizza carbonara', null, null, 12,'pizza');
INSERT INTO producto VALUES(2,'Hamburguesa con queso', null, null, 9, 'hamburguesa');
INSERT INTO producto VALUES(3,'Pizza margarita', null, null, 10, 'pizza');
INSERT INTO producto VALUES(4,'Coca cola', null, null, 2, 'bebida');
INSERT INTO producto VALUES(5,'Hamburguesa con queso', null, null, 9, 'hamburguesa');
INSERT INTO producto VALUES(6,'pizza carbonara', null, null, 12, 'bebida');
INSERT INTO producto VALUES(7,'Fanta naranja', null, null, 2, 'bebida');







