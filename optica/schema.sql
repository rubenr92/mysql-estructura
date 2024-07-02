
DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica CHARACTER SET utf8mb4;
USE optica;

CREATE TABLE proveedor(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    tlf INT,
    fax VARCHAR(10),
    nif VARCHAR(9)
);

CREATE TABLE cliente(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    tlf INT,
    email VARCHAR(50),
    id_recomendacion INT UNSIGNED,
    FOREIGN KEY (id_recomendacion) REFERENCES cliente(id) 
);

CREATE TABLE gafas(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50),
    graduacioni FLOAT(2),
    graduaciond FLOAT(2),
    color VARCHAR(10),
    montura ENUM('metalica', 'pasta', 'flotant'),
    color_montura VARCHAR(10),
    precio FLOAT(2),
    vendedor VARCHAR(50),
    periodo INT,
    id_proveedor INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id),
    id_cliente INT UNSIGNED,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

INSERT INTO proveedor VALUES(1,'General optica', null, 934437867, null, 1234);
INSERT INTO proveedor VALUES(2,'Multiopticas', null, 934437867,null,2345);

INSERT INTO cliente VALUES(1, 'Irene', 'valencia 72', 677972215, null,null);
INSERT INTO cliente VALUES(2, 'David', 'consell de cent', 671972612, null,1);

INSERT INTO gafas VALUES(1,'oakley', 1.2,1.3,null, 'metalica', 'negro', 230,null,2023, 1,1);
INSERT INTO gafas VALUES(2, 'scalpers', 1.4,1.2,null, 'pasta', 'azul', 210, null,2023,2,2);
INSERT INTO gafas VALUES(3, 'oakley',1.4,1.2, 'azul', 'metalica', 'gris',300,'Ricardo',2024,1,2);