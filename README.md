------------

*Nombre del Proyecto:* **Administración de Computadoras**

*Propietario:* **Resanovich, Jeffrey**

------------

[TOC]

### Introducción

“Uno lo tiene, otro lo quiere”, es un slogan de una conocida página de compa venta, que busca satisfacer una demanda o necesidad realizando un intercambio de intereses o de bienes. Este modelo es base en las relaciones de comercio, económicas, pero también son el fundamento de las relaciones sociales.

 En la actualidad la tecnología es protagonista de nuestro día a día, permitiendo mejores oportunidades de trabajo, de estudio, de interacción social, etc. Contar con un dispositivo que permita lograr estas experiencias se ha convertido en una necesidad. ¿Pero qué sucede cuando por diversos motivos esta necesidad no puede ser cubierta?
Siguiendo con el modelo de intercambio de productos o servicios, muchas personas, familias e incluso empresas, descartan y almacenan computadoras que, con un simple mantenimiento y actualización, podrían ayudar a otras personas y familias a tener una mejor experiencia de conectividad, tanto para estudiar, como para trabajar o simplemente aprender a manejar un nuevo dispositivo.

En este proyecto se desarrollará una base de datos donde se registren los datos necesarios para poder realizar este intercambio, creando puentes de conexión entre una computadora que alguien tiene en desuso por diversas razones y un estudiante, trabajador o simplemente familia que no puede adquirirla.


### Objetivo

Gestionar la información de computadoras donadas, registrando:
- Datos de personas en sus respectivos roles:
  - Donantes
  - Técnicos
  - Selectores
  - Solicitantes.
- Componentes y características de computadora donada.
- Registro de reparación y/o bajas de PC y responsable del mismo.
- Solicitudes y evaluaciones de los solicitantes.
- Entregas, garantizando trazabilidad en todo el proceso. 

### Situación Problema

En la actualidad, la conectividad abre puertas en todos los ámbitos de la vida, no contar con la posibilidad de tener un dispositivo que permita esta conexión puede significar la pérdida de oportunidades de progreso y crecimiento.

La situación económica de nuestro país sumado a otros factores trae como consecuencia que un gran número de personas no pueda acceder a estos dispositivos, provocando la deserción en estudios, la falta de oportunidades laborales, entre otros resultados. A su vez, del otro lado de la moneda, muchas personas suelen tener más de un dispositivo electrónico en sus hogares o empresas: celulares, tablets, relojes, televisores, etc.; todos inteligentes, esto hace que disminuya el uso de sus computadoras (escritorio o notebook), y estas queden desactualizas y/o averiadas en algún rincón de sus hogares o empresas. Otras personas simplemente pueden comprar nuevas computadoras y aún conservan las viejas o simplemente se han pasado de escritorio a notebook.

De aquí surge la necesidad de crear la Base de Datos que permita hacer esta conexión entre personas que pueden ofrecer algo en desuso y/o tiempo y transformarlo en un alivio para personas que realmente lo necesitan.


### Herramientas tecnológicas utilizadas

Las herramientas y aplicaciones tecnológicas utilizadas para este proyecto son:
- MySql Workbench	Administración de Base de Datos.
- Draw.io	Diseño de Base de Datos.
- Microsoft Word	Armado del Informe General.
- Microsoft Excel	Generación de reportes.

### Diagrama Entidad Relación (DER)

![Diagrama Entidad Relacion](https://github.com/Jeffresanovich/administracion_de_computadoras/blob/master/img/DER.png?raw=true)


### Definición de Tablas

El proyecto está compuesto por 11 tablas, detalladas a continuación:

#### 1. PERSONAS
*Datos importantes de toda persona involucrada en el proceso, independientemente de rol que luego cumpla.*

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| dni_persona | Documento Nacional de Identidad asociada a una persona. | Número |
| nombre | Nombres de la persona. | Texto |
| apellido | Apellidos de la persona. | Texto |
| direccion | Lugar donde reside actualmente. | Texto |
| telefono | Número de teléfono o celular para contacto. | Texto |
| email | Correo electrónico. | Texto |
| fecha_naci | Fecha de nacimiento. | Fecha |
| fecha_alta | Fecha de alta en el sistema. | Fecha |
| estado | Estado actual en la aplicación: activo o inactivo. | Texto |

#### 2. DONADORES
*Asigna un identificador único a un tipo de persona que se registre como donador.*

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_donador | Identificador único asociado al donador. | Número |
| dni_persona | Identificador asociado a los datos de la persona previamente registrada. | Número |

#### 3. TECNICOS
*Asigna un identificador único a un tipo de persona que se registre como técnico y el taller donde trabaja.*

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_tecnico | Identificador único asociado al técnico. | Número |
| dni_persona | Identificador asociado a los datos de la persona previamente registrada. | Número |
| id_taller | Identificador asociado a los datos del taller donde trabaja el técnico. | Número |


#### 4. TALLERES
*Almacena información del taller donde trabajan uno o más técnicos.*

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_taller | Identificador único asociado al taller. | Número |
| nombre | Nombre o razón social del taller. | Texto |
| direccion | Dirección física del taller. | Texto |
| telefono | Número de teléfono o celular para contacto. | Texto |
| email | Dirección de correo electrónico. | Texto |

#### 5. SELECTORES 
*Asigna un identificador único a un tipo de persona que se registre como selector.*

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_selector | Identificador único asociado al selector. | Número |
| dni_persona | Identificador asociado a los datos de la persona previamente registrada. | Número |

#### 6. SOLICITANTES
*Asigna un identificador único a un tipo de persona que se registre como solicitante.*

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_solicitante | Identificador único asociado al solicitante. | Número|
| dni_persona |  asociado a los datos de la persona previamente registrada. | Número|

#### 7. SOLICITUDES
*Vincula un solicitante con el propósito y fecha de la solicitud.*

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_solicitud | Identificador único asociado al pedido o solicitud. | Número |
| id_solicitante | Identificador asociado a los datos del solicitante. | Número |
| fecha_solicitud | Fecha de registro de la solicitud o aplicación. | Fecha |
| proposito | Propósito de la aplicación para un PC. | Texto |


#### 8. EVALUACIONES
*Registra el resultado las evaluaciones de las solicitudes.*

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_evaluacion | Identificador único asociado a la evaluación de la solicitud previamente registrada. | Número |
| id_selector | Identificador asociado a los datos del selector. | Número |
| id_solicitud | Identificador asociado a los datos de la solicitud. | Número |
| fecha_evaluacion | Fecha en que realizo la evaluación. | Fecha |
| resultado | Resultado obtenido: aprobado o rechazado. | Texto |
| comentario | Comentario sobre la evaluación. | Texto |

#### 9. PC_DONADAS
*Registra datos relevantes de la computadora donada y su respectiva falla.*

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_pc_donada | Identificador único asociado a las características de la PC donada. | Número |
| id_donador | Identificador asociado a los datos del donador. | Número |
| fecha_donacion | Fecha en que se efectuó la donación. | Fecha |
| condicion | Condición del PC: nuevo o usado. | Texto |
| tipo | Tipo de PC: escritorio o notebook. | Texto |
| uso | Para que se usara: hogar o trabajo. | Texto |
| micro | Características del microprocesador. | Texto |
| mother | Características de la placa madre. | Texto |
| ram | Características de la memoria RAM. | Texto |
| rom | Características de la memoria ROM (HDD, SSD, etc). | Texto |
| pantalla | Características de la pantalla. | Texto |
| falla | Detalle de falla o estado de PC. | Texto |

#### 10. PC_REPARADAS
*Vincula la computadora donada con un técnico responsable de su reparación o baja del quipo.*

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_pc_reparada | Identificador único asociado a la reparación del PC. | Número |
| id_pc_donada | Identificador asociado a los datos de la PC donada. | Número |
| id_tecnico | Identificador asociado a los datos del técnico encargado de la reparación o mantenimiento. | Número |
| fecha_reparacion | Fecha en que se realizó el trabajo. | Fecha |
| estado | Estado del PC luego de la intervención del técnico: alta o baja. | Texto |
| comentario | Detalle de las pruebas realizadas y/o motivo de baja. | Texto |

#### 11. ENTREGAS
*Registra los datos de entrega de la computadora reparada con el solicitante previamente evaluado y aprobado.*

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_entrega | Identificador único asociado a los datos de entrega. | Número |
| id_evaluacion | Identificador asociado a los datos de la evaluación. | Número |
| id_pc_reparada | Identificador asociado a los datos de la PC reparada. | Número |
| fecha_entrega | Fecha en que se realizó la entrega. | Fecha |
| recepcion | Detalles de la recepción del PC. | Texto |

------------

**Aclaraciones:**
- Cada ítem esta dado por: nombre de la tabla y descripción, seguido del detalle de los campos.
- Todas las llaves primarias (primer campo de todas las tablas) son auto incrementales a excepción de la tabla PERSONAS (dni_persona).
- Todos los campos son obligatorios, es decir, no aceptan valor nulo.

### Objetos de la Base de Datos

#### Vistas (View)
##### a) vw_donadores_anio2021_con_corei5
*Listado de donadores del año 2021 que tenían un microprocesador 'core i5':*

|     | Descripción |
| -------------: | ------------- |
| Objetivo | Obtener información de donadores en determinado momento en base a un componente particular. |
| Tablas que la componen | DONADORES, PERSONAS, PC_DONADAS |

##### b) vw_pc_disponibles_por_tipo
*Lista el total de PC disponibles para entregar clasificándolas por tipo de PC: notebook o escritorio:*

|     | Descripción |
| -------------: | ------------- |
| Objetivo | Listar PC disponibles para entregar, clasificándolas. |
| Tablas que la componen | PC_DONADAS, PC_REPARADAS, ENTREGAS |


##### c) vw_tecnicos_por_taller
*Lista la cantidad de técnicos disponibles clasificándolos por taller en donde se desempeñan:*

|     | Descripción |
| -------------: | ------------- |
| Objetivo | Listar cantidad de técnicos en cada taller. |
| Tablas que la componen | TALLERES, TALLERES |

##### d) vw_pc_disponible
*Detalla características de las computadoras disponibles para donar y si es nuevo o usado:*

|     | Descripción |
| -------------: | ------------- |
| Objetivo | Listar características de PC disponibles para donar. |
| Tablas que la componen | PC_DONADAS, PC_REPARADAS, ENTREGAS |

##### e) vw_solicitudes_pendientes_evaluacion
*Permite conocer las solicitudes pendientes de evaluación:*

|     | Descripción |
| -------------: | ------------- |
| Objetivo | Listar solicitudes pendientes de evaluación. |
| Tablas que la componen | PERSONAS, SOLICITANTES, SOLICITUDES, EVALUACIONES |

#### Funciones (Function)

##### a) FN_PC_DONADAS_POR_DONADOR
|  Acción  | Descripción |
| -------------: | ------------- |
|  Objetivo | Listar PC donados por determinado donador. |
|  Ingreso | Identificador único asociado al donador: id_donador. |
| Retorno | Listado de PC donadas. |

##### b) FN_NOMBRE_APELLIDO
|  Acción  | Descripción |
| -------------: | ------------- |
| Objetivo | Identificar una persona en base a su DNI. |
| Ingreso| Documento Nacional de Identidad asociada a una persona: dni_persona. |
| Retorno | Nombre y apellido concatenados (unido como único dato). |

##### c) FN_TIPO_PERSONA
|  Acción  | Descripción |
| -------------: | ------------- |
| Objetivo | Identificar el tipo de función que cumple una persona registrada. |
| Ingreso | Documento Nacional de Identidad asociada a una persona: dni_persona. |
| Retorno | El tipo de función que se asignó luego del registro. |

#### Procedimientos Almacenados (Stored Procedures)

##### a) SP_ORDERNAR_PCDONADAS_POR

|  Acción  | Descripción |
| -------------: | ------------- |
| Objetivo | Ordenar tabla PC_DONADAS en base a un campo especifico. |
| Ingreso | p_campo: cualquier campo de la tabla PC_DONADAS.  |
| Ingreso | p_orden: asc(ascendente) o desc(descendente). |
| Retorno | Listado de PC donadas ordenada de acuerdo a los parámetros de entrada. |


##### b) SP_INSERT_PERSONA

|  Acción  | Descripción |
| -------------: | ------------- |
| Objetivo | Insertar un registro en la taba PERSONAS. |
| Ingreso | Todos los campos que se encuentran en la tabla persona. |
| Retorno | Texto confirmando el registro de la persona o si la persona se encuentra  previamente registrada. |


##### c) SP_DELETE_REGISTRO

|  Acción  | Descripción |
| -------------: | ------------- |
| Objetivo | Eliminar un registro particular de una tabla particular. |
| Ingreso | p_tabla: nombre de la tabla. |
| Ingreso | p_campo_primarykey: nombre del campo llave primaria. |
| Ingreso | p_primarykey: valor de llave primaria del registro a borrar. |
| Retorno | Nombre de la tabla y llave primeria del registro eliminado junto a un mensaje de éxito. |



#### Disparadores (Triggers)

##### Tabla: PERSONAS_LOG

| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_peronas_log | Identificador único asociado al registro de logs. | Número |
| accion | Registra el tipo de acción: insert o delete de una persona. | Texto |
| tabla | Tabla sobre la que se monitorea el movimiento. | Texto |
| usuario | Usuario que realizo la modificación. | Texto |
| fecha | Fecha de modificación. | Fecha |
| hora | Hora de modificación. | Hora |

###### a) TGR_LOG_INSERT_PERSONAS
*Registra, en la tabla PERSONAS_LOG, datos particulares de cada nueva persona DESPUES de ser INSERTADA.*

###### b) TGR_LOG_DELETE_PERSONAS
*Registra, en la tabla PERSONAS_LOG, datos particulares de cada persona ANTES de ser ELIMINADA.*


##### Tabla: MOVIMIENTOS_PC
| Nombre campo | Descripción | Tipo |
| -------------: | ------------- | :-------------: |
| id_mov_pc | Identificador único asociado al registro de movimiento | Número |
| pc_disponible | Registra un 1 después de insertar una PC_REPARADA. | Número |
| entregada | Registra un 1 antes de insertar una ENTREGA . | Número |
| tabla | Tabla de donde proviene la información: PC_REPARADAS o ENTREGAS | Texto |
| usuario | Usuario que realizo el registro. | Texto |
| fecha | Fecha de registro. | Fecha |
| hora | Hora de registro. | Hora |

###### a) TGR_PC_DISPONIBLE
*Registra el valor de 1 en la tabla MOVIMIENTOS_PC, DESPUES de ser INSERTADA una PC en la tabla PC_REPARADAS.*

###### b) TGR_PC_ENTREGADAS
*Registra el valor de 1 en la tabla MOVIMIENTOS_PC, ANTES de ser INSERTADA una PC en tabla ENTREGAS.*



### Reportes

Algunos ejemplos de posibles reportes:

![Reportes](https://github.com/Jeffresanovich/administracion_de_computadoras/blob/master/img/reportes.jpg?raw=true)
