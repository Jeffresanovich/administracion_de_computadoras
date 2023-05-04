USE ADMINISTRACION_COMPUTADORAS;

-- Consigna: Elige dos tablas de las presentadas en tu proyecto. 
-- Realizarás una serie de modificaciones en los registros, controladas por transacciones.

/*
Aspectos a incluir en el entregable:
En la primera tabla, si tiene registros, deberás eliminar algunos de ellos iniciando previamente una transacción. Si no tiene registros la tabla, 
reemplaza eliminación por inserción.
Deja en una línea siguiente, comentado la sentencia Rollback, y en una línea posterior, la sentencia Commit.
Si eliminas registros importantes, deja comenzado las sentencias para re-insertarlos.
*/
START TRANSACTION ;
DELETE FROM PERSONAS WHERE dni_persona = 22549879 ;   
DELETE FROM PERSONAS WHERE dni_persona = 25569857 ; 
DELETE FROM PERSONAS WHERE dni_persona = 29568745 ; 
DELETE FROM PERSONAS WHERE dni_persona = 30258745 ; 
DELETE FROM PERSONAS WHERE dni_persona = 33215587 ;
-- ROLLBACK ;
-- COMMIT ;

/*
En la segunda tabla, inserta ocho nuevos registros iniciando también una transacción. 
Agrega un savepoint a posteriori de la inserción del registro #4 y otro savepoint a posteriori del registro #8
Agrega en una línea comentada la sentencia de eliminación del savepoint de los primeros 4 registros insertados
*/

START TRANSACTION ;
INSERT INTO TALLERES VALUES (null, 'Informatic','Suipacha 1704','3516549875','Informatic@desdev.cn') ;
INSERT INTO TALLERES VALUES (null, 'AkyNet','Padre Luis Monti 2587','3512356988','AkyNet@desdev.cn') ;
INSERT INTO TALLERES VALUES (null, 'Compu Cordoba','Alem 1234','3513456985','Compu_cordoba@desdev.cn') ;
INSERT INTO TALLERES VALUES (null, 'Matrix Computacion','Celectino Vidal 4567','3516589632','MatrixComputacion@desdev.cn') ;
SAVEPOINT SP1 ;
INSERT INTO TALLERES VALUES (null, 'Backup Computacion','Colon 50','3512458741','Backup_Computacion@desdev.cn') ;
INSERT INTO TALLERES VALUES (null, 'InfoService','San Martin 456','3516741235','InfoService@desdev.cn') ;
INSERT INTO TALLERES VALUES (null, 'TotalCompu','Patri 321','3518965874','TotalCompu@desdev.cn') ;
INSERT INTO TALLERES VALUES (null, 'World PC','Rincon 1789','3513456456','World PC@desdev.cn') ;
SAVEPOINT SP2 ;
-- RELEASE SAVEPOINT SP1 ; 	-- Sentencia de eliminación del savepoint de los primeros 4 registros insertados.
-- ROLLBACK TO SP1 ; 		-- Sentencia para verificar que efectivamente se eliminó dicho savepoint.
