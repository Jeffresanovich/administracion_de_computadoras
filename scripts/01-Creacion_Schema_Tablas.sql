DROP SCHEMA IF EXISTS administracion_computadoras;
CREATE SCHEMA IF NOT EXISTS administracion_computadoras;
USE administracion_computadoras;

-- Esta tabla contiene todos los datos de las siguientes personas: 
-- DONADORES, TECNICOS, SELECTORES, SOLICITANTES (que a su vez son 4 tablas siguientes).
CREATE TABLE IF NOT EXISTS PERSONAS (
dni_persona INT NOT NULL,
nombre VARCHAR(25) NOT NULL,
apellido VARCHAR(25) NOT NULL,
direccion VARCHAR(25) NOT NULL,
telefono VARCHAR(10) NOT NULL,
email VARCHAR(30) NOT NULL,
fecha_naci DATE NOT NULL,
fecha_alta DATE NOT NULL,
estado ENUM('activo','inactivo') NOT NULL,
PRIMARY KEY (dni_persona)
);

-- Esta tabla relaciona personas y donadores
CREATE TABLE IF NOT EXISTS DONADORES (
id_donador INT AUTO_INCREMENT,
dni_persona INT NOT NULL,
PRIMARY KEY (id_donador),
CONSTRAINT FK_donador_persona FOREIGN KEY (dni_persona) REFERENCES PERSONAS(dni_persona) ON DELETE CASCADE
);

-- Tabla que almacena datos del taller.
CREATE TABLE IF NOT EXISTS TALLERES (
id_taller INT AUTO_INCREMENT,
nombre VARCHAR(25) NOT NULL,
direccion VARCHAR(25) NOT NULL,
telefono VARCHAR(10) NOT NULL,
email VARCHAR(30) NOT NULL,
PRIMARY KEY (id_taller)
);

-- Esta tabla relaciona personas, tecnicos y el taller donde trabaja 
CREATE TABLE IF NOT EXISTS TECNICOS (
id_tecnico INT AUTO_INCREMENT,
dni_persona INT NOT NULL,
id_taller INT ,
PRIMARY KEY (id_tecnico),
CONSTRAINT FK_tecnico_persona FOREIGN KEY (dni_persona) REFERENCES PERSONAS(dni_persona) ON DELETE CASCADE,
CONSTRAINT FK_tecnico_taller FOREIGN KEY (id_taller) REFERENCES TALLERES(id_taller) ON DELETE SET NULL
);

-- Esta tabla relaciona personas y selectores
CREATE TABLE IF NOT EXISTS SELECTORES (
id_selector INT AUTO_INCREMENT,
dni_persona INT NOT NULL,
PRIMARY KEY (id_selector),
CONSTRAINT FK_selector_persona FOREIGN KEY (dni_persona) REFERENCES PERSONAS(dni_persona) ON DELETE CASCADE
);

-- Esta tabla relaciona personas y solicitantes
CREATE TABLE IF NOT EXISTS SOLICITANTES (
id_solicitante INT AUTO_INCREMENT,
dni_persona INT NOT NULL,
PRIMARY KEY (id_solicitante),
CONSTRAINT FK_solicitante_persona FOREIGN KEY (dni_persona) REFERENCES PERSONAS(dni_persona) ON DELETE CASCADE
);


-- DE AQUI, PODRIA DECIRSE, PARTE LA LOGICA DEL NEGOCIO (despues de alta de las personas, obviamente)
-- Tabla que almacena los datos de la computadora donada y su donador
CREATE TABLE IF NOT EXISTS PC_DONADAS (
id_pc_donada INT AUTO_INCREMENT,
id_donador INT NOT NULL,
fecha_donacion DATE NOT NULL,
condicion ENUM('nuevo','usado') NOT NULL,
tipo ENUM('escritorio','notebook') NOT NULL,
uso ENUM('hogar','trabajo') NOT NULL,
micro VARCHAR(50) NOT NULL,
mother VARCHAR(50) NOT NULL,
ram VARCHAR(50) NOT NULL,
rom VARCHAR(50) NOT NULL,
pantalla VARCHAR(50) NOT NULL,
falla VARCHAR(255) NOT NULL,
PRIMARY KEY (id_pc_donada),
CONSTRAINT FK_donacion_donador FOREIGN KEY (id_donador) REFERENCES DONADORES(id_donador)
);



-- Tabla que recibe una computadora donada y le asigna un taller para su reparación
CREATE TABLE IF NOT EXISTS PC_REPARADAS (
id_pc_reparada INT AUTO_INCREMENT,
id_pc_donada INT NOT NULL,
id_tecnico INT NOT NULL,
fecha_reparacion DATE NOT NULL,
estado ENUM('alta','baja') NOT NULL,
comentario VARCHAR(255) NOT NULL,
PRIMARY KEY (id_pc_reparada),
CONSTRAINT FK_reparacion_donacion FOREIGN KEY (id_pc_donada) REFERENCES PC_DONADAS(id_pc_donada),
CONSTRAINT FK_reparacion_tecnico FOREIGN KEY (id_tecnico) REFERENCES TECNICOS(id_tecnico)
);

-- Tabla que registra la solicitud de un solicitante previamente registrado
CREATE TABLE IF NOT EXISTS SOLICITUDES (
id_solicitud INT AUTO_INCREMENT,
id_solicitante INT NOT NULL,
fecha_solicitud DATE NOT NULL,
proposito VARCHAR(255) NOT NULL,
PRIMARY KEY (id_solicitud),
CONSTRAINT FK_solicitudes_solicitante FOREIGN KEY (id_solicitante) REFERENCES SOLICITANTES(id_solicitante)
);

-- Tabla que registra la evaluación por parte de un selector de la solicitud recibida, 
-- y su respectivo rechazo o aprobación
CREATE TABLE IF NOT EXISTS EVALUACIONES (
id_evaluacion INT AUTO_INCREMENT,
id_selector INT NOT NULL,
id_solicitud INT NOT NULL,
fecha_evaluacion DATE NOT NULL,
resultado ENUM('aprobado','rechazado') NOT NULL,
comentario VARCHAR(255) NOT NULL,
PRIMARY KEY (id_evaluacion),
CONSTRAINT FK_evaluacion_selector FOREIGN KEY (id_selector) REFERENCES SELECTORES(id_selector),
CONSTRAINT FK_evaluacion_solicitud FOREIGN KEY (id_solicitud) REFERENCES SOLICITUDES(id_solicitud)
);

-- Table que registra los datos de entrega con la computadora asignada
CREATE TABLE IF NOT EXISTS ENTREGAS (
id_entrega INT AUTO_INCREMENT,
id_evaluacion INT NOT NULL,
id_pc_reparada INT NOT NULL,
fecha_entrega DATE NOT NULL,
recepcion VARCHAR(100) NOT NULL,
PRIMARY KEY (id_entrega),
CONSTRAINT FK_entrega_evaluacion FOREIGN KEY (id_evaluacion) REFERENCES EVALUACIONES(id_evaluacion),
CONSTRAINT FK_entrega_computadora FOREIGN KEY (id_pc_reparada) REFERENCES PC_REPARADAS(id_pc_reparada)
);



