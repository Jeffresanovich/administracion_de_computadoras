USE ADMINISTRACION_COMPUTADORAS;

-- SE BORRAN LAS FUNCIONES SI YA EXISTEN
DROP FUNCTION IF EXISTS FN_PC_DONADAS_POR_DONADOR;
DROP FUNCTION IF EXISTS FN_NOMBRE_APELLIDO;
DROP FUNCTION IF EXISTS FN_TIPO_PERSONA;

-- FUNCION 1: RECIBE COMO PARAMETRO EL "id_donador" Y RETORNA LA CANTIDAD DE PC DONADAS POR EL MISMO
DELIMITER \\
CREATE FUNCTION FN_PC_DONADAS_POR_DONADOR (p_id_donador VARCHAR(25))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE cantidad INT;
    SET cantidad = (SELECT COUNT(id_pc_donada) AS CANT_PC_DONADAS
					FROM PC_DONADAS
					WHERE id_donador = p_id_donador);
	RETURN CANTIDAD;
END ;
\\ DELIMITER ;

-- FUNCION 2: RECIBE COMO PARAMETRO EL "dni_persona" Y DEVUELVE LA CONCATENACION DEL NOMBRE Y APELLIDO
DELIMITER \\
CREATE FUNCTION FN_NOMBRE_APELLIDO (p_dni_persona VARCHAR (100)) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE nombre_apellido VARCHAR(100);
    SET nombre_apellido = (SELECT CONCAT(nombre,' ',apellido) AS NOMBRE_DONADOR
							FROM PERSONAS
							WHERE dni_persona = p_dni_persona);
	RETURN nombre_apellido;
END
\\ DELIMITER ;

/*
-- IMPLEMENTACION DE AMBAS FUNCIONES PARA OBTENER EL NOMBRE COMPLETO Y LA CANTIDAD DE PC DONADAS POR DONADOR
SELECT 	FN_NOMBRE_APELLIDO(dni_persona) AS NOMBRE_COMPLETO, 
		FN_PC_DONADAS_POR_DONADOR(id_donador) AS CANT_PC_DONADAS 
FROM DONADORES;
*/

-- FUNCION 3: RECIBE COMO PARAMETRO UN "dni_persona" Y DEVUELVE EL TIPO DE ROLL QUE CUMPLE EN LA BD
DELIMITER $$
CREATE FUNCTION FN_TIPO_PERSONA (p_dni_persona VARCHAR(10))
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
	DECLARE tipo VARCHAR(15);        
	IF ((SELECT COUNT(dni_persona) FROM DONADORES WHERE dni_persona = p_dni_persona) = 1) THEN SET tipo = 'DONADOR';
		ELSEIF ((SELECT COUNT(dni_persona) FROM TECNICOS WHERE dni_persona = p_dni_persona)  = 1) THEN SET tipo = 'TECNICO';
		ELSEIF ((SELECT COUNT(dni_persona) FROM SELECTORES WHERE dni_persona = p_dni_persona)  = 1) THEN SET tipo = 'SELECTOR';
		ELSEIF ((SELECT COUNT(dni_persona) FROM SOLICITANTES WHERE dni_persona = p_dni_persona)  = 1) THEN SET tipo = 'SOLICITANTE';
        ELSEIF ((SELECT COUNT(dni_persona) FROM PERSONAS WHERE dni_persona = p_dni_persona)  = 1) THEN SET tipo = 'INACTIVO';
        ELSE SET tipo = 'NO EXISTE';
    END IF;
    RETURN tipo;
END
$$ DELIMITER ;

/*
-- IMPLEMENTACION POSIBLE 1: DEVUELVE EL ROLL DE CADA PERSONA EN LA TABLA "PERSONAS" JUENTO AL NOMBRE, APELLIDO Y MAIL
SELECT nombre, apellido, email, FN_TIPO_PERSONA(dni_persona) AS TIPO_PERSONA
FROM PERSONAS
ORDER BY TIPO_PERSONA;

-- IMPLEMENTACION POSIBLE 2: DEVUELVE LA CANTIDAD DE CADA TIPO DE PERSONA
SELECT FN_TIPO_PERSONA(dni_persona) AS TIPO_PERSONA, COUNT(FN_TIPO_PERSONA(dni_persona)) AS CANTIDAD
FROM PERSONAS
GROUP BY FN_TIPO_PERSONA(dni_persona)
*/