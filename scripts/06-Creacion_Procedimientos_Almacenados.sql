	USE ADMINISTRACION_COMPUTADORAS;

-- CONSIGNA 1: 	debe permitir indicar a través de un parámetro (p_campo) el campo de ordenamiento de una tabla y 
-- 				mediante un segundo parámetro (p_orden), si el orden es descendente o ascendente.
DROP PROCEDURE IF EXISTS SP_ORDERNAR_PCDONADAS_POR;
DELIMITER //
CREATE PROCEDURE SP_ORDERNAR_PCDONADAS_POR(IN p_campo CHAR(10),IN p_orden CHAR(4))
BEGIN
	SET @consulta = CONCAT('SELECT * FROM PC_DONADAS ORDER BY ',p_campo,' ',p_orden) ;
    PREPARE param_stmt FROM @consulta ;
	EXECUTE param_stmt ;
    DEALLOCATE PREPARE param_stmt ;
END
// DELIMITER ;

/*
-- IMPLEMENTACION: Se ingrea el campo a ordenar y el tipo de orden

call administracion_computadoras.SP_ORDERNAR_PCDONADAS_POR('micro', 'asc');
call administracion_computadoras.SP_ORDERNAR_PCDONADAS_POR('mother', 'desc');
*/

-- CONSIGNA 2: puede 
	-- 1: insertar registros en una tabla de tu proyecto. 
	-- 2: eliminar algún registro específico de una tabla de tu proyecto.

-- INSERTA UN REGISTRO NUEVO EN LA TABLA PERSONA PIDIENDO LAS PARAMETROS NECESARIOS
DROP PROCEDURE IF EXISTS SP_INSERT_PERSONA;
DELIMITER $$
CREATE PROCEDURE SP_INSERT_PERSONA (	IN p_dni_persona INT, 
										IN p_nombre VARCHAR(25), 
                                        IN p_apellido VARCHAR(25),  
                                        IN p_direccion VARCHAR(25), 
                                        IN p_telefono VARCHAR(10), 
                                        IN p_email  VARCHAR(30), 
                                        IN p_fecha_naci DATE,
                                        OUT p_nombre_respuesta VARCHAR(25), 
                                        OUT p_apellido_respuesta VARCHAR(25),  
										OUT p_email_respuesta  VARCHAR(30), 
                                        OUT p_mensaje VARCHAR(30))
BEGIN
-- Almaceno la existencia de un persona: 1 si existe y 0 si no existe
	SET @existe = 	(SELECT COUNT(dni_persona) FROM administracion_computadoras.PERSONAS WHERE dni_persona = p_dni_persona);

-- Si no existe: la ingreso y registro la opracion exitosa en "p_mensaje",
-- pero si exise: almaceno el mensaje de que existe en "p_mensaje".
		IF (@existe = 0) THEN INSERT INTO PERSONAS VALUES (p_dni_persona, p_nombre, p_apellido, p_direccion, p_telefono, p_email, p_fecha_naci, CURDATE(),'activo');
                          SET p_mensaje = 'Persona agregada con exito!' ;
		ELSE SET p_mensaje = 'La persona ya existe!' ;
		END IF ;
    
-- Finalmente, idependientemente de que exista o no (si no existe ya se insertó): se guardan sus datos principales para devolver
    SELECT nombre, apellido, email INTO p_nombre_respuesta, p_apellido_respuesta, p_email_respuesta
	FROM PERSONAS 
	WHERE dni_persona = p_dni_persona;
END
$$ DELIMITER ;

/*
-- IMPLEMENTACION: Inserto un resgistro usando: "SP_INSERT_PERSONA"
-- NOTA IMPORTANTE: Por favor ejecutar DOS VECES, la primera vez insertará el registro (mensaje exitoso) 
				-- la segunda vez mostrará los datos con un mensaje distinto.
set @p_nombre_respuesta = '0';
set @p_apellido_respuesta = '0';
set @p_email_respuesta = '0';
set @p_mensaje = '0';
call administracion_computadoras.SP_INSERT_PERSONA(34951595, 'Jeffrey', 'Resanovich', 'Suipacha 2155', '3513258744', 'jeffresanovich@mail.com', '1989-05-08', @p_nombre_respuesta, @p_apellido_respuesta, @p_email_respuesta, @p_mensaje);
select  @p_nombre_respuesta AS nombre, 
		@p_apellido_respuesta AS apellido, 
		@p_email_respuesta AS email, 
        @p_mensaje AS mensaje;
*/


-- ELIMINA UN REGISTRO ESPECIFICANDO: NOMBRE DE LA TABLA, CAMPO LLAVE PRIMARIA Y LLAVE PRIMARIA DEL REGISTRO A BORRAR.
DROP PROCEDURE IF EXISTS SP_DELETE_REGISTRO;
DELIMITER //
CREATE PROCEDURE SP_DELETE_REGISTRO (IN p_tabla char(10), 
									 IN p_campo_primarykey CHAR(20), 
                                     IN p_primarykey INT, 
                                     OUT p_tabla_respuesta char(10), 
                                     OUT p_primarykey_respuesta INT,
                                     OUT p_mensaje VARCHAR(30))
BEGIN
-- Procedo a eliminar el registro
	SET @borrar = CONCAT('DELETE FROM ',p_tabla,' ','WHERE ',p_campo_primarykey,' = ',p_primarykey) ;
    PREPARE param_stmt2 FROM @borrar ;
    EXECUTE param_stmt2 ;
    DEALLOCATE PREPARE param_stmt2 ;
    
-- Devuevo nombre de la tabla y llave primeria del registro eliminado junto a un mensaje de exito 
    SET p_tabla_respuesta = p_tabla;
    SET p_primarykey_respuesta = p_primarykey;
    SET p_mensaje = 'Registro eliminado con exito';
END
// DELIMITER ;

/*
-- IMPLEMENTACION: Elimino un resgistro usando: "SP_DELETE_REGISTRO"	
set @p_tabla_respuesta = '0';
set @p_primarykey_respuesta = 0;
set @p_mensaje = '0';
call administracion_computadoras.SP_DELETE_REGISTRO('PERSONAS', 'dni_persona', 34951595, @p_tabla_respuesta, @p_primarykey_respuesta, @p_mensaje);
select  @p_tabla_respuesta AS tabla, 
		@p_primarykey_respuesta AS registro, 
        @p_mensaje AS mensaje;
*/        
