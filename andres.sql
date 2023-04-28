/*
*Estudiantes
*Andy Ambrosio.2021105
*Andres Flores.2021049
*
*Grupo: 1/2 (Lunes/Jueves)
*Codigo tecnico: IN5BM
*Fecha creacion:26/04/2022
*Fecha modificacion:
*/

drop database if exists db_control_academico_in5bm;
create database db_control_academico_in5bm;
use db_control_academico_in5bm;

drop table if exists alumnos;
create table if not exists alumnos(
	carne varchar(7) not null,
	nombre1 varchar(15) not null,
	nombre2 varchar(15) null,
	nombre3 varchar(15) null,
	apellido1 varchar(15) not null,
	apellido2 varchar(15) null,
	constraint pk_alumnos primary key(carne)
);

drop table if exists horarios;
create table if not exists horarios(
	id int not null auto_increment,
	horario_final time not null,
	horario_inicio time not null,
	lunes tinyint(1) null,
	martes tinyint(1) null,
	miercoles tinyint(1) null,
	jueves tinyint(1) null,
	viernes tinyint(1) null,
	constraint pk_horarios primary key(id)
);

drop table if exists solanes;
create table if not exists solanes(
	codigo_salon varchar(7)not null,
	nivel int null,
	edificio varchar(45) null,
	capacidad_maxima int not null,
	descripcion varchar(45) null,
	constraint pk_salones primary key(codigo_salon)
);

drop table if exists carreras_tecnicas;
create table if not exists carreras_tecnicas(
	condigo_tecnico varchar(8) not null,
	carrera varchar(45)
    not null,
	grado varchar(10) not null,
	seccion char(1) not null,
	jornada varchar(10) not null,
	constraint carreras_tecnicas primary key (condigo_tecnico)
);

drop table if exists instructores;
create table if not exists instructores(
	id int not null auto_increment,
	nombre1 varchar(16) not null,
	nombre2 varchar(15) null,
	nombre3 varchar(15) null,
	apellido1 varchar(15) not null,
	apellido2 varchar(15) null,
	direccion varchar(45) null,
	email varchar(45) not null,
	telefono varchar(45) not null,
	fecha_nacimiento date null,
constraint instructores primary key(id)
);

drop table if exists cursos;
create table if not exists cursos(
	id int not null auto_increment,
    nombre_curso varchar(255) not null,
    ciclo year null,
    cupo_maximo int null,
    cupu_minimo int null,
    carrera_tecnica_id varchar(128) null,
    horario_id int null,
    instructor_id int null,
    salon_id varchar(7) null,
    constraint cursos primary key (id),
    constraint fk_cusos_carreras_tecnicas
		foreign key (carrera_tecnica_id) 
		references carreras_tecnicas(condigo_tecnico)
        on delete cascade on update cascade,
	constraint fk_cursos_horarios
		foreign key (horario_id)
        references horarios(id)
        on delete cascade on update cascade,
	constraint fk_cursos_instructores
		foreign key (instructor_id)
        references instructores(id)
		on delete cascade on update cascade,
	constraint fk_cursos_salon
		foreign key (salon_id)
        references solanes(codigo_salon)
		on delete cascade on update cascade

);

drop table if exists asignaciones_alumnos;
create table if not exists asignaciones_alumnos(
	id varchar(45)not null,
    alumno_id varchar(16) null,
    curso_id int not null,
    fecha_asignacion datetime null,
	constraint asignaciones_alumnos primary key(id),
    constraint fk_asignacion_salones_alumnos
		foreign key (alumno_id)
		references alumnos(carne)
        on delete cascade on update cascade,
	constraint fk_asignacion_saones_curso
		foreign key (curso_id)
        references cursos(id)
);
use db_control_academico_in5bm;
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_read_by_id $$
CREATE PROCEDURE sp_alumnos_read_by_id (
	_carne VARCHAR(7))
BEGIN
    SELECT
        a.carne,
        a.nombre1,
        a.nombre2,
        a.nombre3,
        a.apellido1,
        a.apellido2
    FROM
        alumnos AS a
	WHERE a.carne=_carne;
END $$
DELIMITER ;
-- select alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_read $$
CREATE PROCEDURE sp_alumnos_read()
BEGIN
    SELECT
        a.carne,
        a.nombre1,
        a.nombre2,
        a.nombre3,
        a.apellido1,
        a.apellido2
    FROM
        alumnos AS a;
END $$
DELIMITER ;
-- insert alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_create $$
CREATE PROCEDURE sp_alumnos_create(
	_carne varchar(7),
	_nombre1 varchar(15),
	_nombre2 varchar(15),
	_nombre3 varchar(15),
	_apellido1 varchar(15),
	_apellido2 varchar(15))
BEGIN
    INSERT INTO alumnos (carne, nombre1, nombre2,nombre3,apellido1,apellido2)
	VALUES (_carne,_nombre1,_nombre2,_nombre3,_apellido1,_apellido2);
END $$
DELIMITER ;
-- update alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_update $$
CREATE PROCEDURE sp_alumnos_update(
	_carne varchar(7),
    _nombre1 varchar(15),
	_nombre2 varchar(15),
	_nombre3 varchar(15),
	_apellido1 varchar(15),
	_apellido2 varchar(15))
BEGIN
    UPDATE alumnos 
    SET nombre1=_nombre1, nombre2=_nombre2,nombre3=_nombre3,apellido1=_apellido1,apellido2=_apellido2 
    WHERE carne=_carne;
END $$
DELIMITER ;
-- delete alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_alumnos_delete $$
CREATE PROCEDURE sp_alumnos_delete(
	_carne varchar(7))
BEGIN
    DELETE FROM alumnos where carne=_carne;
END $$
DELIMITER ;

-- select by id
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_read_by_id $$
CREATE PROCEDURE sp_horarios_read_by_id(
	_id INT)
BEGIN
    SELECT
        h.horario_final,
        h.horario_inicio,
        h.lunes,
        h.martes,
        h.miercoles,
        h.jueves,
        h.viernes
    FROM
        horarios AS h
	WHERE h.id=_id;
END $$
DELIMITER ;
-- select horarios
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_read $$
CREATE PROCEDURE sp_horarios_read()
BEGIN
    SELECT
		h.id,
        h.horario_final,
        h.horario_inicio,
        h.lunes,
        h.martes,
        h.miercoles,
        h.jueves,
        h.viernes
    FROM
        horarios AS h;
END $$
DELIMITER ;
-- insert horarios
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_create $$
CREATE PROCEDURE sp_horarios_create(
	_horario_final time,
	_horario_inicio time,
	_lunes tinyint(1) ,
	_martes tinyint(1) ,
	_miercoles tinyint(1),
	_jueves tinyint(1),
	_viernes tinyint(1))
BEGIN
	INSERT INTO horarios(horario_inicio,horario_final,lunes,martes,miercoles,jueves,viernes)
	VALUES(_horario_inicio,_horario_final,_lunes,_martes,_miercoles,_jueves,_viernes);
    
END $$
DELIMITER ;
-- update horarios
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_update $$
CREATE PROCEDURE sp_horarios_update(
	_id int,
	_horario_final time,
	_horario_inicio time,
	_lunes tinyint(1) ,
	_martes tinyint(1) ,
	_miercoles tinyint(1),
	_jueves tinyint(1),
	_viernes tinyint(1))
BEGIN
	UPDATE horarios
    SET horario_inicio=_horario_inicio,horario_final=_horario_final,lunes=_lunes,
    martes=_martes,miercoles=_miercoles,jueves=_jueves,viernes=_viernes
    WHERE id=_id;
    
END $$
-- delete horarios
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_horarios_delete $$
CREATE PROCEDURE sp_horarios_delete(
	_id int)
BEGIN
	DELETE FROM horarios 
    WHERE id=_id;
    
END $$

-- select by id
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_read_by_id $$
CREATE PROCEDURE sp_salones_read_by_id(
	_codigo_salon varchar(7))
BEGIN
    SELECT
		s.nivel,
        s.edificio,
        s.capacidad_maxima,
        s.descripcion
    FROM
        solanes AS s
	WHERE s._codigo_salon=__codigo_salon;
END $$
DELIMITER ;
-- select salones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_read $$
CREATE PROCEDURE sp_salones_read()
BEGIN
    SELECT
		s.codigo_salon,
		s.nivel,
        s.edificio,
        s.capacidad_maxima,
        s.descripcion
    FROM
        solanes AS s;
END $$
DELIMITER ;
-- insert salones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_create $$
CREATE PROCEDURE sp_salones_create(
	_codigo_salon varchar(5),
	_nivel int,
	_edificio varchar(15),
	_capacidad_maxima int,
	_descripcion varchar(45))
BEGIN
    INSERT INTO solanes(codigo_salon,nivel,edificio,capacidad_maxima,descripcion)
	VALUES(_codigo_salon ,_nivel,_edificio,_capacidad_maxima,_descripcion);
END $$
DELIMITER ;
-- update salones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_update $$
CREATE PROCEDURE sp_salones_update(
	_codigo_salon varchar(5),
	_nivel int,
	_edificio varchar(15),
	_capacidad_maxima int,
	_descripcion varchar(45))
BEGIN
    UPDATE solanes
    SET nivel=_nivel,edificio=_edificio,capacidad_maxima=_capacidad_maxima,descripcion=_descripcion
    WHERE codigo_salon=_codigo_salon;
END $$
DELIMITER ;
-- delete salones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_salones_delete $$
CREATE PROCEDURE sp_salones_delete(
	_codigo_salon varchar(5))
BEGIN
	DELETE FROM solanes
    WHERE codigo_salon=_codigo_salon;
END $$
DELIMITER ;

-- select by id 
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_read_by_id $$
CREATE PROCEDURE sp_carreras_tecnicas_read_by_id(
	_condigo_tecnico varchar(8))
BEGIN
    SELECT
		c.condigo_tecnico,
        c.carrera,
        c.grado,
        c.seccion,
        c.jornada
    FROM
        carreras_tecnicas AS c
	WHERE c.condigo_tecnico=_condigo_tecnico;
END $$
DELIMITER ;
-- select carreras_tecnicas
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_read $$
CREATE PROCEDURE sp_carreras_tecnicas_read()
BEGIN
    SELECT
		c.condigo_tecnico,
        c.carrera,
        c.grado,
        c.seccion,
        c.jornada
    FROM
        carreras_tecnicas AS c;
END $$
DELIMITER ;
-- insert carreras_tecnicas
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_create $$
CREATE PROCEDURE sp_carreras_tecnicas_create(
	_condigo_tecnico varchar(8),
	_carrera varchar(45),
	_grado varchar(30),
	_seccion char(1),
	_jornada varchar(10))
BEGIN
    INSERT INTO carreras_tecnicas(condigo_tecnico,carrera,grado,seccion,jornada)
	VALUES(_condigo_tecnico,_carrera,_grado,_seccion,_jornada);
END $$
DELIMITER ;
-- update carreras_tecnicas
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_update $$
CREATE PROCEDURE sp_carreras_tecnicas_update(
	_condigo_tecnico varchar(8),
	_carrera varchar(45),
	_grado varchar(30),
	_seccion char(1),
	_jornada varchar(10))
BEGIN
    UPDATE carreras_tecnicas
    SET carrera=_carrera,grado=_grado,seccion=_seccion,jornada=_jornada
    WHERE condigo_tecnico=_condigo_tecnico;
END $$
DELIMITER ;
-- delete carreras_tecnicas
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_carreras_tecnicas_delete $$
CREATE PROCEDURE sp_carreras_tecnicas_delete(
	_condigo_tecnico varchar(8))
BEGIN
    DELETE FROM carreras_tecnicas
    WHERE condigo_tecnico=_condigo_tecnico;
END $$
DELIMITER ;

-- select by id
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_read_by_id $$
CREATE PROCEDURE sp_instructores_read_by_id(
	_id INT)
BEGIN
    SELECT
		i.nombre1,
        i.nombre2,
        i.nombre3,
        i.apellido1,
        i.apellido2,
        i.direccion,
        i.email,
        i.telefono,
        i.fecha_nacimiento
    FROM
        instructores AS i
	WHERE i.id=_id;
END $$
DELIMITER ;
-- select instructores
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_read $$
CREATE PROCEDURE sp_instructores_read()
BEGIN
    SELECT
		i.id,
		i.nombre1,
        i.nombre2,
        i.nombre3,
        i.apellido1,
        i.apellido2,
        i.direccion,
        i.email,
        i.telefono,
        i.fecha_nacimiento
    FROM
        instructores AS i;
END $$
DELIMITER ;
-- insert instructores
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_create $$
CREATE PROCEDURE sp_instructores_create(
	_nombre1 varchar(16),
	_nombre2 varchar(15),
	_nombre3 varchar(15),
	_apellido1 varchar(15),
	_apellido2 varchar(15),
	_direccion varchar(45),
	_email varchar(45),
	_telefono varchar(45),
	_fecha_nacimiento date)
BEGIN
    insert into instructores(nombre1,nombre2,nombre3,apellido1,apellido2,direccion,email,telefono,fecha_nacimiento)
	values(_nombre1,_nombre2,_nombre3,_apellido1,_apellido2,_direccion,_email,_telefono,_fecha_nacimiento);
END $$
DELIMITER ;
-- update instructores
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_update $$
CREATE PROCEDURE sp_instructores_update(
	_id int,
	_nombre1 varchar(16),
	_nombre2 varchar(15),
	_nombre3 varchar(15),
	_apellido1 varchar(15),
	_apellido2 varchar(15),
	_direccion varchar(45),
	_email varchar(45),
	_telefono varchar(45),
	_fecha_nacimiento date)
BEGIN
    UPDATE instructores
    SET nombre1=_nombre1,nombre2=_nombre2,nombre3=_nombre3,apellido1=_apellido1,
    apellido2=_apellido2,direccion=_direccion,email=_email,telefono=_telefono,fecha_nacimiento=_fecha_nacimiento
    WHERE id=_id;
END $$
DELIMITER ;
-- delete instructores
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_instructores_delete $$
CREATE PROCEDURE sp_instructores_delete(
	_id int)
BEGIN
    DELETE FROM instructores
    WHERE id=_id;
END $$
DELIMITER ;


-- select by id
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_read_by_id $$
CREATE PROCEDURE sp_cursos_read_by_id(
	_id INT)
BEGIN
	SELECT
		c.nombre_curso,
        c.ciclo,
        c.cupo_maximo,
        c.cupu_minimo,
        t.carrera,
        h.horario_final,
        i.nombre1,
        s.nivel
	FROM
		cursos AS c,horarios AS h,instructores AS i,solanes AS s,carreras_tecnicas AS t
	WHERE c.horario_id=h.id
	AND c.instructor_id=i.id
	AND c.salon_id=s.id
	AND c.carrera_tecnica_id=t.condigo_tecnico
    AND id=_id;
    
END $$
DELIMITER ;
-- select cursos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_read $$
CREATE PROCEDURE sp_cursos_read()
BEGIN
	SELECT
		c.nombre_curso,
        c.ciclo,
        c.cupo_maximo,
        c.cupu_minimo,
        t.carrera,
        h.horario_final,
        i.nombre1,
        s.nivel
	FROM
		cursos AS c,horarios AS h,instructores AS i,solanes AS s,carreras_tecnicas AS t
	WHERE c.horario_id=h.id
	AND c.instructor_id=i.id
	AND c.salon_id=s.codigo_salon
	AND c.carrera_tecnica_id=t.condigo_tecnico;
    
END $$
DELIMITER ;
-- insert cursos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_create $$
CREATE PROCEDURE sp_cursos_create(
    _nombre_curso varchar(255),
    _ciclo year,
    _cupo_maximo int,
    _cupu_minimo int,
    _carrera_tecnica_id varchar(128),
    _horario_id int ,
    _instructor_id int,
    _salon_id int)
BEGIN
	INSERT INTO cursos(nombre_curso,ciclo,cupo_maximo,cupu_minimo,carrera_tecnica_id,horario_id,instructor_id, salon_id)
	VALUES(_nombre_curso,_ciclo,_cupo_maximo,_cupu_minimo,_carrera_tecnica_id,_horario_id,_instructor_id,_salon_id);
    
END $$
DELIMITER ;
-- update cursos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_update $$
CREATE PROCEDURE sp_cursos_update(
	_id int,
    _nombre_curso varchar(255),
    _ciclo year,
    _cupo_maximo int,
    _cupu_minimo int,
    _carrera_tecnica_id varchar(128),
    _horario_id int ,
    _instructor_id int,
    _salon_id int)
BEGIN
	UPDATE cursos
    SET nombre_curso=_nombre_curso,ciclo=_ciclo,cupo_maximo=_cupo_maximo,cupu_minimo=_cupu_minimo,
    carrera_tecnica_id=_carrera_tecnica_id,horario_id=_horario_id,instructor_id=_instructor_id, salon_id=_salon_id
    WHERE id=_id;
    
END $$
DELIMITER ;
-- delete cursos
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_cursos_delete $$
CREATE PROCEDURE sp_cursos_delete(
	_id int)
BEGIN
	DELETE FROM cursos
    WHERE id=_id;
    
END $$
DELIMITER ;


-- select by id
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_read_by_id $$
CREATE PROCEDURE sp_asignaciones_alumnos_read_by_id(
	_id varchar(45))
BEGIN
    SELECT alumnos.carne AS Carne_Alumno,
		   alumnos.nombre1 AS Nombre1_Alumno,
		   alumnos.nombre2 AS Nombre1_Alumno, 
           cursos.nombre_curso AS Nombre_Curso,
           asignaciones_alumnos.fecha_asignacion AS Fecha_Asignacion
	FROM asignaciones_alumnos,alumnos,cursos 
    WHERE asignaciones_alumnos.alumno_id=alumnos.carne 
    AND asignaciones_alumnos.curso_id=cursos.id
    AND id=_id;
END $$
DELIMITER ;
-- select asignaciones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_read $$
CREATE PROCEDURE sp_asignaciones_alumnos_read()
BEGIN
    SELECT alumnos.carne AS Carne_Alumno,
		   alumnos.nombre1 AS Nombre1_Alumno,
		   alumnos.nombre2 AS Nombre1_Alumno, 
           cursos.nombre_curso AS Nombre_Curso,
           asignaciones_alumnos.fecha_asignacion AS Fecha_Asignacion
	FROM asignaciones_alumnos,alumnos,cursos 
    WHERE asignaciones_alumnos.alumno_id=alumnos.carne 
    AND asignaciones_alumnos.curso_id=cursos.id;
END $$
DELIMITER ;
-- insert asignaciones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_create $$
CREATE PROCEDURE sp_asignaciones_alumnos_create(
	_id varchar(45),
    _alumno_id varchar(16),
    _curso_id int,
    _fecha_asignacion datetime)
BEGIN
	INSERT INTO asignaciones_alumnos(id, alumno_id,curso_id,fecha_asignacion)
	VALUES(_id,_alumno_id,_curso_id,_fecha_asignacion);
END $$
DELIMITER ;
-- update asignaciones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_update $$
CREATE PROCEDURE sp_asignaciones_alumnos_update(
	_id varchar(45),
    _alumno_id varchar(16),
    _curso_id int,
    _fecha_asignacion datetime)
BEGIN
	UPDATE asignaciones_alumnos
    SET alumno_id=_alumno_id,curso_id=_curso_id,fecha_asignacion=_fecha_asignacion
    WHERE id=_id;
END $$
DELIMITER ;
-- delete asignaciones
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_asignaciones_alumnos_delete $$
CREATE PROCEDURE sp_asignaciones_alumnos_delete(
	_id varchar(45))
BEGIN
	DELETE FROM asignaciones_alumnos
    WHERE id=_id;
END $$
DELIMITER ;
call sp_alumnos_create("2021221","Perez","Lase","Luis","Ambrosio","Caal");
call sp_alumnos_create ("2021106","Perez","Ambrosio","Caal","Espinoza","Perez");
call sp_alumnos_create ("2021107","Perez","Ambrosio","Ka","Gomez","Sosa");
call sp_alumnos_create ("2021108","Perez","Ambrosio","Chaves","Reyes","Segura");
call sp_alumnos_create ("2021109","Perez","Ambrosio","Fuentes","Lidani","Quintanilla");
call sp_alumnos_create ("2021110","Perez","Lase","Luis","Ambrosio","Caal");
call sp_alumnos_create ("2021111","Perez","Ambrosio","Caal","Espinoza","Perez");
call sp_alumnos_create ("2021112","Perez","Ambrosio","Ka","Gomez","Sosa");
call sp_alumnos_create ("2021113","Perez","Ambrosio","Chaves","Reyes","Segura");
call sp_alumnos_create ("2021116","Perez","Ambrosio","Fuentes","Lidani","Quintanilla");

call sp_horarios_create ('14:45','14:14',1,0,1,0,1);
call sp_horarios_create ('10:59','11:20',0,1,1,1,1);
call sp_horarios_create ('08:56','12:59',1,1,1,0,0);
call sp_horarios_create('09:58','14:14',1,0,1,0,1);
call sp_horarios_create('04:58','14:20',1,1,1,1,1);
call sp_horarios_create('14:45','14:14',0,0,0,0,0);
call sp_horarios_create('08:56','12:59',1,1,1,0,0);
call sp_horarios_create('09:58','14:14',1,0,1,0,1);
call sp_horarios_create('04:58','14:20',1,1,1,1,1);
call sp_horarios_create('14:45','14:14',0,0,0,0,0);

call sp_salones_create("23",2,"C4",40,"espaciosos");
call sp_salones_create("12",34,"C24",23,"espaciosos");
call sp_salones_create("13",23,"C23",23,"medianos");
call sp_salones_create("14",45,"C22",29,"espaciosos");
call sp_salones_create("15",20,"C21",58,"pequeños");
call sp_salones_create("16",2,"C4",40,"espaciosos");
call sp_salones_create("17",34,"C26",22,"espaciosos");
call sp_salones_create("18",23,"D23",43,"medianos");
call sp_salones_create("19",45,"D45",23,"espaciosos");
call sp_salones_create("20",20,"D12",12,"pequeños");

call sp_instructores_create("Josue","andy","Luis","Chaves","Mejia","zona 7","mejia@gmial.com","1254-1254","2022-04-05");
call sp_instructores_create("Andu","andy","Luis","Chaves","Mejia","zona 3","mejia@gmial.com","4587-5698","2022-04-05");
call sp_instructores_create("Luis","andy","Luis","Chaves","Mejia","zona 5","mejia@gmial.com","2365-1254","2022-04-05");
call sp_instructores_create("Elizabeth","andy","Luis","Chaves","Mejia","zona 6","mejia@gmial.com","1254-5698","2022-04-05");
call sp_instructores_create("Elena","andy","Luis","Chaves","Mejia","zona 12","mejia@gmial.com","4587-1254","2022-04-05");
call sp_instructores_create("Gaby","andy","Luis","Chaves","Mejia","zona 13","mejia@gmial.com","1254-5698","2022-04-05");
call sp_instructores_create("Elsa","andy","Luis","Chaves","Mejia","zona 1","mejia@gmial.com","1254-5471","2022-04-05");
call sp_instructores_create("Maria","andy","Luis","Chaves","Mejia","zona 2","mejia@gmial.com","2561-1254","2022-04-05");
call sp_instructores_create("Fernando","andy","Luis","Chaves","Mejia","zona 4","mejia@gmial.com","7854-1254","2022-04-05");
call sp_instructores_create("Jose","andy","Luis","Chaves","Mejia","zona 9","mejia@gmial.com","4587-1254","2022-04-05");

call sp_carreras_tecnicas_create("INF","informatica","4to","C","Matutina");
call sp_carreras_tecnicas_create("MEC","mecanica","4to","C","Matutina");
call sp_carreras_tecnicas_create("DIB","dibujo tecnico","4to","C","Matutina");
call sp_carreras_tecnicas_create("ELEC","electricidad","4to","C","Matutina");
call sp_carreras_tecnicas_create("CONT","contadores","4to","C","Matutina");
call sp_carreras_tecnicas_create("INF2","informatica","5to","C","Matutina");
call sp_carreras_tecnicas_create("MEC2","mecanica","5to","C","Matutina");
call sp_carreras_tecnicas_create("DIB2","dibujo tecnico","5to","C","Matutina");
call sp_carreras_tecnicas_create("ELEC2","electricidad","5to","C","Matutina");
call sp_carreras_tecnicas_create("CONT2","contadores","5to","C","Matutina");

call sp_cursos_create("Matematica",'2021',25,1,"CONT2",1,1,"23");
call sp_cursos_create("Literatura",'2021',25,1,"ELEC2",2,2,"12");
call sp_cursos_create("Sociales",'2021',25,1,"DIB2",3,3,"13");
call sp_cursos_create("Taller",'2021',25,1,"INF",4,4,"14");
call sp_cursos_create("Tics",'2021',25,1,"MEC2",5,5,"15");
call sp_cursos_create("Calculo",'2021',25,1,"INF2",6,6,"16");
call sp_cursos_create("Dibujo",'2021',25,1,"CONT",7,7,"17");
call sp_cursos_create("Quimica",'2021',25,1,"ELEC",8,8,"18");
call sp_cursos_create("Matematica II",'2021',25,1,"DIB",9,9,"19");
call sp_cursos_create("Ingles",'2021',25,1,"MEC",10,10,"20");

call sp_asignaciones_alumnos_create("C23","2021106",3,'2021-12-31 23:59:59');
call sp_asignaciones_alumnos_create("D23","2021107",4,'1999-12-31 23:59:59');
call sp_asignaciones_alumnos_create("A23","2021108",5,'2010-12-31 23:59:59');
call sp_asignaciones_alumnos_create("N23","2021109",4,'2022-12-31 23:59:59');
call sp_asignaciones_alumnos_create("C29","2021106",3,'2021-12-31 23:59:59');
call sp_asignaciones_alumnos_create("C22","2021106",1,'2021-12-31 23:59:59');
call sp_asignaciones_alumnos_create("D45","2021107",2,'1999-12-31 23:59:59');
call sp_asignaciones_alumnos_create("A56","2021108",6,'2010-12-31 23:59:59');
call sp_asignaciones_alumnos_create("N2","2021109",7,'2022-12-31 23:59:59');
call sp_asignaciones_alumnos_create("C21","2021106",8,'2021-12-31 23:59:59');
