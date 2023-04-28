/* 
Actividad de aprendizaje.
Funciones almacenadas
Temario: A

Curso: Taller II
Catedrático: Jorge Pérez.

	Nombre alumno: Andres_flores
	Carné:	_2021049
	Sección: _IN5BM
	Fecha: 10/02/2022
    
*/

DROP DATABASE IF EXISTS db_funciones_andres_flores;
CREATE DATABASE db_funciones_andres_flores;

USE db_funciones_andres_flores;

CREATE TABLE resultados (
	id INT AUTO_INCREMENT NOT NULL,
    area DECIMAL(10,2),
    impares VARCHAR(45),
    menor INT,
    PRIMARY KEY pk_funciones_Id (id)
);
-------------------------------------------------------------------------------------------------------------
-- INSTRUCCIONES:

-- 1. Crear un procedimiento almacenado para insertar registros en la tabla Resultados

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_resultados_create$$
CREATE PROCEDURE sp_resultados_create(
	IN _id VARCHAR (10), 
    IN _area VARCHAR (102),
    IN _impares VARCHAR (45), 
    IN _menor int
)
BEGIN
	INSERT INTO resultados (
		id,
        area,
        impares,
        menor 
	)
	values
	(
		_id,
		_area,
		_impares,
		_menor
	);
END$$
DELIMITER ;

------------------------------------------------------------------------------------------
-- 2. Crear una función para calcular el área de un triangulo.

delimiter $$
drop function if exists fn_area_triangulo $$
create function fn_area_triangulo(base int, altura int)
returns decimal
reads SQL data deterministic
begin
	declare area decimal;
    set area = base * altura /2;
    return area;
end $$
delimiter ;

select fn_area_triangulo(4,6);
----------------------------------------------------------------------------------------------

-- 3. Crear una función que acumule en una variable todos los números impares del 1 al N.
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio3 $$
CREATE PROCEDURE sp_ejercicio3 ()
BEGIN
    DECLARE i TINYINT UNSIGNED; 
    SET  i = 0; 
    
    miBucle: LOOP 
        -- Instrucciones que se van a repetir 
        SET i = i + 1;
        SELECT "El valor de i es: "+ i AS i;
        
        IF i = 4 THEN 
        
        LEAVE miBucle;
        end if;
    END LOOP miBucle;

END $$
DELIMITER ;

call sp_ejercicio3();
---------------------------------------------------------------------------------------------------------------------------

-- 4. Crear una función para calcular el número menor de 4 números enteros.

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio $$
CREATE PROCEDURE sp_ejercicio()
BEGIN
    DECLARE i TINYINT UNSIGNED;
    SET i = 0; 
    
    miBucle: LOOP
		Set i = i + 1;
        
        IF i = 3 THEN 
          
            ITERATE miBucle;
		END IF;
		SELECT "El valor de i es: " + i AS i;
        IF i = 4 THEN
            LEAVE miBucle;
		END IF;
    END LOOP miBucle;

END $$

DELIMITER ;

call sp_ejercicio();



-- 5. Llamar al procedimiento almacenado creado anteriormente para insertar el resultado de las funciones en la tabla Resultados


-- 6 Crear un procedimitno almacenado para listar todos los registros de la tabla resultado








