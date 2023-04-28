/*Integrantes: 	
				Andres Flores
				José Beltrán
                Carlos Díaz
                
Codigo Tecnico: IN5BM
Grupo: 3
*/


DROP DATABASE IF EXISTS db_animal_love;
CREATE DATABASE IF NOT EXISTS db_animal_love
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;


USE db_animal_love;


DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS personas;
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS salones;
DROP TABLE IF EXISTS tipo_mascotas;
DROP TABLE IF EXISTS vacunas;
DROP TABLE IF EXISTS mascotas;
DROP TABLE IF EXISTS asignaciones_vacunas_mascotas;
DROP TABLE IF EXISTS adopciones;
DROP TABLE IF EXISTS usuarios;

#----------------------------     TABLAS        ------------------------------#

CREATE TABLE IF NOT EXISTS roles(
	id_rol INT NOT NULL,
    rol VARCHAR(20),
    PRIMARY KEY (id_rol)
);

CREATE TABLE IF NOT EXISTS personas(
	id_persona INT NOT NULL,
    nombre1 VARCHAR(30) NOT NULL,
    nombre2 VARCHAR(30),
    nombre3 VARCHAR(30),
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30),
    direccion VARCHAR(30),
    cui VARCHAR(30) NOT NULL,
    telefono VARCHAR(9),
    PRIMARY KEY (id_persona)
);

CREATE TABLE IF NOT EXISTS empleados(
	id_empleado INT NOT NULL,
    persona_id INT NOT NULL,
    tipo_empleado VARCHAR(45),
    PRIMARY KEY (id_empleado),
    CONSTRAINT fk_empleados_personas
    FOREIGN KEY (persona_id)
    REFERENCES personas (id_persona)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS clientes(
	id_cliente INT NOT NULL,
    persona_id INT NOT NULL,
    nit VARCHAR(12) NOT NULL,
    PRIMARY KEY(id_cliente),
    CONSTRAINT fk_clientes_personas
    FOREIGN KEY (persona_id)
    REFERENCES personas (id_persona)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS salones(
	id_salon INT NOT NULL,
    descripcion VARCHAR(50) NULL,
    capacidad_minima INT,
    capacidad_maxima INT NOT NULL,
    edificio VARCHAR(15) NULL,
    nivel INT NULL,
    PRIMARY KEY (id_salon)
);

CREATE TABLE IF NOT EXISTS tipo_mascotas (
	id_tipo_mascota INT NOT NULL,
    tipo_mascota VARCHAR(30),
    PRIMARY KEY (id_tipo_mascota)
);

CREATE TABLE IF NOT EXISTS vacunas(
	id_vacuna INT NOT NULL,
    tipo_vacuna VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_vacuna)
);

CREATE TABLE IF NOT EXISTS mascotas(
	id_mascota INT NOT NULL,
    nombre VARCHAR(20) NULL,
    tipo_mascota_id INT NOT NULL,
    raza VARCHAR (30) NULL,
    genero VARCHAR(30) NULL,
    edad INT NULL,
    salon_id INT NOT NULL,
    PRIMARY KEY (id_mascota),
    CONSTRAINT fk_mascotas_tipo_mascotas
		FOREIGN KEY (tipo_mascota_id)
        REFERENCES tipo_mascotas (id_tipo_mascota)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_mascotas_salones
		FOREIGN KEY (salon_id)
		REFERENCES salones (id_salon)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS asignaciones_vacunas_mascotas(
	id_asignacion_vacuna INT NOT NULL,
    vacuna_id INT NOT NULL,
    mascota_id INT NOT NULL,
    fecha_vacuna DATE NOT NULL,
    PRIMARY KEY (id_asignacion_vacuna),
    CONSTRAINT fk_asignaciones_vacunas_vacunas
		FOREIGN KEY (vacuna_id)
		REFERENCES vacunas (id_vacuna)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_asignaciones_vacunas_mascotas
		FOREIGN KEY (mascota_id)
        REFERENCES mascotas (id_mascota)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS adopciones(
	id_adopcion INT NOT NULL,
    empleado_id INT NOT NULL,
    cliente_id INT NOT NULL,
    mascota_id INT NOT NULL,
    fecha_adopcion DATE NOT NULL,
    PRIMARY KEY (id_adopcion),
    CONSTRAINT fk_adopciones_empleados
		FOREIGN KEY (empleado_id)
        REFERENCES empleados (id_empleado)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_adopciones_clientes
		FOREIGN KEY (cliente_id)
        REFERENCES clientes (id_cliente)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_adopciones_mascotas
		FOREIGN KEY (mascota_id)
        REFERENCES mascotas (id_mascota)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS usuarios(
	user VARCHAR(35) NOT NULL,
    pass VARCHAR(50) NOT NULL,
    rol_id INT NOT NULL,
    empleado_id INT NOT NULL,
    PRIMARY KEY (user),
    CONSTRAINT fk_usuarios_roles
		FOREIGN KEY (rol_id)
        REFERENCES roles (id_rol)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_usuarios_empleados
		FOREIGN KEY (empleado_id)
        REFERENCES empleados (id_empleado)
        ON DELETE CASCADE ON UPDATE CASCADE
);

#------------------------------ INSERCIÓN DE LA TABLA ROLES ----------------------------------#

INSERT INTO roles (id_rol, rol)
VALUES
(1, 'Administrador'),
(2, 'Gestor de Proyectos'),
(3, 'Usuario'),
(4, 'Usuario Limitado');

#----------------------------- INSERCIÓN DE LA TABLA PERSONAS --------------------------------#

INSERT INTO personas (id_persona, nombre1, nombre2, nombre3, apellido1, apellido2, direccion, cui, telefono)
VALUES
(1, 'Anthony', 'Daniel', 'Sebastian', 'Acabal', 'Mazariegos', '4av zona 1 Guatemala', '321-75391-002', '7391-8246'),
(2, 'Jorge', null, null, 'Perez', null, null,'123-4568-001',null),
(3, 'Yohan', 'Abel', 'Flores', 'Hernandez', null, '5av zona 2 Zacapa', '987-00045-003', '9874-1234'),
(4, 'Carlos', 'Alejandro', 'Sandoval', 'Morales', null, null, '951-95135-004', null),
(5, 'Pablo', 'Angel', 'Sebastian', 'Paz', 'Mazariegos', '5av zona 5 Guatemala', '300-15976-005', '7570-9438'),
(6, 'Andres', null, null, 'Quel', null, null,'123-4568-006',null),
(7, 'Juan', null, null, 'Alejandro', null, null,'789-1567-007',null),
(8, 'Delmi', 'Santi', 'Dandy', 'Jomes', 'Perez', '6av zona 6 Guatemala', '700-36985-008', '7970-1382'),
(9, 'Andre', 'Andhu', null, 'Flores', 'Canto', null, '700-36985-009', null),
(10, 'Luis', 'David', null, 'Caceres', 'Flores', null, '800-16182-010', null),
(11, 'Tulio', 'Joel', null, 'Diaz', 'Hernandez', null, '718-36487-011', null),
(12, 'Anthony', 'Santi', 'Dandy', 'Sanum', 'Archila', '18av zona 15 Guatemala', '222-36985-009', '3791-8546'),
(13, 'Doraimon', 'Beltran', null, 'Pelos', 'Hernandez', null, '718-36657-013', null),
(14, 'Joge', 'Luis', 'Perez', 'Sanum', 'Archila', '11av zona 78 Guatemala', '222-36985-010', '3791-8111'),
(15, 'Tulio', 'Jimenez', null, 'Matul', 'Tzun', null, '718-36487-010', null),
(16, 'Abel', 'tzun', 'Archila', 'Valdes', 'Ischat', '85av zona 6 Guatemala', '645-15976-005', '7570-9438'),
(17, 'Diaz', 'Abelardo', 'Sebastian', 'Paz', null, '7av zona 7 Guatemala', '285-15976-005', '7570-9438'),
(18, 'Donaldo', 'Archila', 'Sebastian', 'Paz', 'Mazariegos', '10av zona 10 Guatemala', '915-15976-005', '7570-9438'),
(19, 'Andhu', null, null, 'Carrera', null, null,'123-4568-101',null),
(20, 'Beltran', null, null, 'Tulas', null, null,'123-4568-944',null);



#----------------------------- INSERCIÓN DE LA TABLA EMPLEADOS -------------------------------#

INSERT INTO empleados (id_empleado, persona_id, tipo_empleado)
VALUES
(1, 1, 'Presidente de la Empresa'),
(2, 2, 'Vigilante de la Empresa'),
(3, 3, 'Conserge de la Empresa'),
(4, 4, 'Encargado de la Empresa'),
(5, 5, 'Propietario de la Empresa'),
(6, 6, 'Recepcionista de la Empresa'),
(7, 7, 'Contador de la Empresa'),
(8, 8, 'Jefe de la Empresa'),
(9, 9, 'Conserge de la Empresa'),
(10, 10, 'Administrador de la Empresa');

#----------------------------- INSERCIÓN DE LA TABLA CLIENTES --------------------------------#

INSERT INTO clientes (id_cliente, persona_id, nit)
VALUES
(1, 10, '47 255075-01'),
(2, 9, '49 123456-02'),
(3, 8, '50 789657-03'),
(4, 7, '55 963852-04'),
(5, 6, '60 255075-05'),
(6, 5, '65 852675-06'),
(7, 4, '70 102345-07'),
(8, 3, '75 951357-08'),
(9, 2, '80 947682-09'),
(10, 1, '47 255075-01');

#----------------------------- INSERCIÓN DE LA TABLA SALONES ---------------------------------#

INSERT INTO salones (id_salon, descripcion, capacidad_minima, capacidad_maxima, edificio, nivel)
VALUES
(1, 'Área de Enfermería', 10, 25, 'A01', 1),
(2, 'Área de Cirugia', 15, 30, 'A02', 1),
(3, 'Área de Recuperacion', 20, 35, 'B03', 2),
(4, 'Área de Vacunacion', 25, 40, 'B04', 2),
(5, 'Área de Discapacitados', 30, 45, 'C05', 3),
(6, 'Área de Cirugia', 35, 50, 'C06', 3),
(7, 'Área de Recuperacion para gatos', 40, 55, 'D07', 4),
(8, 'Área de Vacunacion para gatos',45, 60, 'D08', 4),
(9, 'Área de Cirugia para gatos', 50, 65, 'A15', 1),
(10, 'Área de Enfermería para gatos', 10, 25, 'B01', 2);

#--------------------------- INSERCIÓN DE LA TABLA TIPO MASCOTAS -----------------------------#
INSERT INTO tipo_mascotas (id_tipo_mascota, tipo_mascota)
VALUES
(1, 'Gato'),
(2, 'Perro'),
(3, 'Gato'),
(4, 'Pollo'),
(5, 'Gallina'),
(6, 'Cocodrilo'),
(7, 'Hormiga'),
(8, 'Tortuga'),
(9, 'Perro'),
(10, 'Gato');



#------------------------------ INSERCIÓN DE LA TABLA VACUNAS --------------------------------#

INSERT INTO vacunas (id_vacuna, tipo_vacuna)
VALUES
(1, 'Vacuna contra el distemper'),
(2, 'Vacuna contra parvovirus'),
(3, 'Vacuna contra la hepatitis'),
(4, 'Vacuna contra la leptospirosis'),
(5, 'Vacuna contra la rabia'),
(6, 'Vacuna contra la leptospirosis'),
(7, 'Vacuna contra el coronavirus'),
(8, 'Vacuna contra el rabia'),
(9, 'Vacuna contra el palmovirus'),
(10, 'Vacuna contra el rabia');


#----------------------------- INSERCIÓN DE LA TABLA MASCOTAS --------------------------------#
INSERT INTO mascotas (id_mascota, nombre, tipo_mascota_id, raza, genero, edad, salon_id)
VALUES
(1, 'Cory', 1, 'Pitbull', 'Masculino',1, 1),
(2, 'Luna', 2, 'Freshpoll', 'Femenino', 2, 2),
(3, 'Dolche', 3, 'Dogo', 'Masculino', 3, 3),
(4, 'Fryda', 4, 'Chiguagua', 'Femenino', 4,4),
(5, 'Tulas', 5, 'Bigol', 'Masculino', 5,5),
(6, 'Banbina', 6, 'Dogo', 'Femenino', 6,6),
(7, 'Thor', 7, 'America', 'Masculino', 7,7),
(8, 'Canon', 8, 'bulling', 'Masculino', 8,8),
(9, 'Draco', 9, 'Dogo', 'Femenino', 9,9),
(10, 'Canche', 10, 'Pitbull', 'Masculino',10, 10);

#-------------------- INSERCIÓN DE LA TABLA ASIGNACIONES VACUNAS MASCOTAS --------------------#
INSERT INTO asignaciones_vacunas_mascotas (id_asignacion_vacuna, vacuna_id, mascota_id, fecha_vacuna)
VALUES
(1,  1, 1, '01/01/22'),
(2,  2, 2, '02/02/22'),
(3,  3, 3, '03/03/22'),
(4,  4, 4, '04/04/22'),
(5,  5, 5, '05/05/22'),
(6,  6, 6, '06/06/22'),
(7,  7, 7, '07/07/22'),
(8,  8, 8, '08/08/22'),
(9,  9, 9, '9/09/22'),
(10,  10, 10, '10/10/22');

#---------------------------- INSERCIÓN DE LA TABLA ADOPCIONES -------------------------------#

INSERT INTO adopciones (id_adopcion, empleado_id, cliente_id, mascota_id, fecha_adopcion)
VALUES
(1,  1, 1, 1,  '01/01/22'),
(2,  2, 2, 2,  '02/02/22'),
(3,  3, 3, 3, '03/03/22'),
(4,  4, 4, 4, '04/04/22'),
(5,  5, 5, 5,  '05/05/22'),
(6,  6, 6, 6,  '06/06/22'),
(7,  7, 7, 7, '07/07/22'),
(8,  8, 8, 8, '08/08/22'),
(9,  9, 9, 9, '9/09/22'),
(10,  10, 10, 10, '10/10/22');

#----------------------------- INSERCIÓN DE LA TABLA USUARIOS --------------------------------#
INSERT INTO usuarios (user, pass, rol_id, empleado_id)
VALUES
('11','12345',11, 11),
('12','98745',12, 12),
('13','78950',13, 13),
('14','00000',14, 14),
('15','98752',15, 15),
('16','02020',16, 16),
('17','30303',17, 17),
('18','88888',18, 18),
('19','98712',19, 19),
('20','35791',20, 20);
    

