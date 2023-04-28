DROP DATABASE IF exists db_control_estudiante_in5bm;
CREATE DATABASE	 db_control_estudiante_in5bm;
USE db_control_estudiante_in5bm;



DROP TABLE IF EXISTS estudiantes;
CREATE TABLE IF NOT EXISTS estudiantes (
id INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(45),
apellido VARCHAR(45),
email VARCHAR(60),
telefono VARCHAR(8),
saldo DECIMAL(6,2),
PRIMARY KEY(id)
);



INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("Juan Alberto","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("Juan Alberto","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("Juan Alberto","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("Juan Alberto","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("Juan Alberto","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("Juan Alberto","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("Juan Alberto","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("C Palomudo","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("C Palomudo","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("C Palomudo","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("C Palomudo","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("C Palomudo","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("C Palomudo","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("C Palomudo","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("C Palomudo","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("C Palomudo","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("C Palomudo","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);
INSERT INTO estudiantes (nombre, apellido, email, telefono, saldo) VALUES ("C Palomudo","INSERTAR APELLIDO","INSERTAR CORREO","12345678",1600.00);

