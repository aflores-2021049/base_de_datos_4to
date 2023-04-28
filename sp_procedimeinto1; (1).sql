/*Andres Andhu Flores Hernandez
2021049
IN5BM
GRUPO: 1*/




DROP DATABASE IF EXISTS sp_procedimeinto1;
CREATE DATABASE sp_procedimeinto1;
use sp_procedimeinto1;

/* CREAR UN PROCEMIENTO ALMACENADO QUE RECIBA DOS NÚMEROS (DOS PARÁMETROS) */

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_procedimiento1 $$
CREATE PROCEDURE sp_procedimiento1 (IN numero1 INT, IN numero2 INT )
begin
    IF  numero1 = numero2  THEN 
         SELECT "Lo números son iguales";
	ELSEIF numero1 != numero2 THEN
         SELECT "Los números no son iguales";
    END IF;
    
       
end $$

DELIMITER ;

call sp_procedimiento1(2,1);


/* Crear un procedimiento almacenado que reciba dos números (dos parpametros) y decir cual es el mayor*/


DELIMITER $$
DROP PROCEDURE IF EXISTS sp_procedimiento2 $$
CREATE PROCEDURE sp_procedimiento2(IN numero1 INT, IN numero2 INT )
begin
    IF  numero1 = numero2  THEN 
         SELECT "Número iguales" AS resultado;
	ELSEIF numero1 > numero2 THEN
         SELECT concat ("número mayor", numero1) AS resultado;
    else
        SELECT concat ("número mayor:", numero2) AS resulatado;
    END IF;
    
       
end $$

DELIMITER ;

call sp_procedimiento2(9,1);


DELIMITER $$
DROP PROCEDURE IF ExISTS sp_ejercicio3 $$
CREATE PROCEDURE sp_ejercicio3(IN _forma_pago VARCHAR (45))
BEGIN
    DECLARE forma_pago ENUM ("efectivo", "tarjeta","transferencia");
    SET forma_pago = _forma_pago;
    
    CASE forma_pago 
       WHEN "efectivo" THEN 
           SELECT "La forma de pago es: efectivo";
	   WHEN "tarjeta" THEN 
           SELECT "La forma de pago es: tarjeta";
		ELSE 
		   SELECT "la forma de pago: transferecia";
	END CASE;
END$$ 
DELIMITER ;

call sp_ejercicio3("efectivo");


/*ejemplo de ENUM Y CASE*/
DELIMITER $$
DROP PROCEDURE IF ExISTS sp_ejercicio4 $$
CREATE PROCEDURE sp_ejercicio4(IN _forma_pago INT)
BEGIN
    DECLARE forma_pago ENUM ("efectivo", "tarjeta","transferencia");
    SET forma_pago = _forma_pago;
    
    CASE forma_pago 
       WHEN "efectivo" THEN 
           SELECT "La forma de pago es: efectivo";
	   WHEN "tarjeta" THEN 
           SELECT "La forma de pago es: tarjeta";
		ELSE 
		   SELECT "la forma de pago: transferecia";
	END CASE;
END$$ 
DELIMITER ;

call sp_ejercicio4("3");


/*Pedir una nota numérica entera entre 0 y 10, y mostrar 
dicha nota de la forma: cero, uno, dos, tres...*/

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio5 $$
CREATE PROCEDURE sp_ejercicio5 ()
BEGIN
    DECLARE numero1 enum ("0","1","2","3""4","5","6","7","8","9","10");
    SET numero1 = numero;
    CASE numero1
       WHEN "cero" THEN 
           SELECT "0"; 
		WHEN "UNO" THEN 
           SELECT "1";
		WHEN "tres" THEN 
           SELECT "3";
		WHEN "cuatro" THEN
		    SELECT  "4";
		WHEN "cinco" THEN
		    SELECT  "5"; 
		WHEN "seis" THEN
		    SELECT  "6"; 
		WHEN "siete" THEN
		    SELECT  "7"; 
		WHEN "ocho" THEN
		    SELECT  "8"; 
		WHEN "nueve" THEN
		    SELECT  "9"; 
		WHEN "diez" THEN
		    SELECT  "10"; 
	END CASE;
END$$ 
DELIMITER ;

call sp_ejercicio5();



DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio6 $$
CREATE PROCEDURE sp_ejercicio6 ()
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

call sp_ejercicio6();


DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio7 $$
CREATE PROCEDURE sp_ejercicio7()
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

call sp_ejercicio7();

/* Crear un procedimineto almacenado que reciba dos parametros 
correspondiente al valor inicial y final de una 
seri de números que debe mostrar en pantalla 
a excepción de los números pares*/



DELIMITER $$
DROP PROCEDURE IF EXISTS sp_ejercicio8 $$
CREATE PROCEDURE sp_ejercicio8(IN inicio INT, IN fin INT)
BEGIN
    DECLARE i TINYINT UNSIGNED;
    SET i = inicio; 
    
    miBucle: LOOP
		Set i = i + 1;
        
        IF i % 2 = 0 THEN 
          
            ITERATE miBucle;
		END IF;
		SELECT "El valor de i es: " + i AS i;
        IF i >= fin THEN
            LEAVE miBucle;
		END IF;
    END LOOP miBucle;

END $$

DELIMITER ;  
call sp_ejercicio8(4, 13);

/* EJEMPLO REPEAT UNTIL
*/

  DELIMITER $$
  DROP PROCEDURE IF EXISTS sp_ejercicio9 $$
  CREATE PROCEDURE sp_ejercicio9()
  BEGIN
  
     DECLARE i TINYINT UNSIGNED;
     SET i = 0;
     
     miCiclo: REPEAT
         SET i = i +1;
         SELECT i AS contador;	
         
		UNTIL i = 4
	END REPEAT miCiclo;
END $$
  
  
  DELIMITER ;
  CALL sp_ejercicio9();
  


DELIMITER ;  
call sp_ejercicio8(4, 13);

DELIMITER $$
drop procedure if exists sp_ejercicio10 $$
create procedure sp_ejercicio10(in inicio int, in fin int)
begin
    declare i tinyint unsigned;
	set i = inicio;

	miCiclo: repeat 
		if i % 2 = 0 then
            SELECT i AS contador;
		end if;
        
        set i = i + 1;
           
            until i = fin
            end repeat miCiclo;

end $$
DELIMITER ;

call sp_ejercicio10(5,10);

