-- USUARIO 1 con permisos de sólo lectura sobre todas las tablas.
DROP USER 'jperez'@'localhost' ;
CREATE USER 'jperez'@'localhost' IDENTIFIED BY '123456' ; -- CREA AL USUARIO jperez
GRANT SELECT ON ADMINISTRACION_COMPUTADORAS.* TO 'jperez'@'localhost' ; -- PERMITE AL USUARIO jperez SOLO CONSULTAR TABLAS
SHOW GRANTS FOR 'jperez'@'localhost' ; -- VERIFICO PERMISOS

-- USUARIO 2 con permisos de Lectura, Inserción y Modificación de datos.
DROP USER 'mgonzalez'@'localhost' ;
CREATE USER 'mgonzalez'@'localhost' IDENTIFIED BY '123456' ; -- CREA AL USUARIO mgonzalez
GRANT SELECT, INSERT, UPDATE ON ADMINISTRACION_COMPUTADORAS.* TO 'mgonzalez'@'localhost' ; 	-- PERMITE AL USUARIO mgonzalez: 
SHOW GRANTS FOR 'mgonzalez'@'localhost' ; -- VERIFICO PERMISOS	 							-- CONSULTAR, INSERTAR Y MODIFICAR CAMPOS EN TABLAS


-- Ninguno de ellos podrá eliminar registros de ninguna tabla.
-- Cada sentencia GRANT y CREATE USER deberá estar comentada con lo que realiza la misma.

