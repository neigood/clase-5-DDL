/*Parte 1: Crear entorno de trabajo
- Crear una base de datos
- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.*/
CREATE SCHEMA individualddl DEFAULT CHARACTER SET utf8 ;

CREATE USER 'usuarioddl'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON individualddl TO 'usuarioddl'@'localhost';

use individualddl;

/*Parte 2: Crear tres tablas.
- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña,
zona horaria (por defecto UTC-3), género y teléfono de contacto).*/

  CREATE TABLE usuarios (
  id_usuario TINYINT NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  contrasena VARCHAR(15) NULL,
  zona_horaria VARCHAR(15) NULL DEFAULT 'UTC-3',
  genero VARCHAR(15) NULL,
  telefono VARCHAR(12) NOT NULL,
  PRIMARY KEY (id_usuario));
  
/*- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a
la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).*/

  CREATE TABLE informacion (
  id_usuario TINYINT NOT NULL,
  id_ingreso TINYINT NOT NULL,
  fecha_hora_ingreso DATETIME NULL,
  PRIMARY KEY (id_usuario));

/*- La tercera tabla almacena información sobre la cantidad de veces que los usuarios han visitado la
aplicación. Piense en una estructura de columnas que permita entregar esta información y cree la
tabla.*/

CREATE TABLE vistasEnLaPagina (
  vista_pagina TINYINT NOT NULL,
  id_usuario TINYINT NOT NULL,
  PRIMARY KEY (id_usuario));

/*Parte 3: Creación de registros.
- Para cada tabla cree 8 registros.*/


INSERT INTO usuarios(id_usuario, nombre, apellido, contrasena, genero, telefono) 
VALUES (1, 'pablo', 'escobar', '1234', 'masculino', '85636547'),
(2, 'luis', 'perez', '1234', 'masculino', '84520236'),
(3, 'pedro', 'gonzalez', '1234', 'masculino', '85635475'),
(4, 'juan', 'cepeda', '1234', 'masculino', '95632587'),
(5, 'daniel', 'moron', '1234', 'masculino', '85478520'),
(6, 'tamara', 'leon', '1234', 'femenino', '98653201'),
(7, 'williams', 'maldonado', '1234', 'masculino', '85421536'),
(8, 'marcela', 'sandoval', '1234', 'femenino', '78451290');

INSERT INTO informacion(id_usuario, id_ingreso, fecha_hora_ingreso)
VALUES(1,1,'2021-10-11 09:23:15'),(2,2,'2021-10-17 10:23:15'),
(3,3,'2021-10-11 10:23:15'),(4,4,'2021-10-12 10:23:15'),
(5,5,'2021-10-13 10:23:15'),(6,6,'2021-10-14 10:23:15'),
(7,7,'2021-10-15 10:23:15'),(8,8,'2021-10-16 10:23:15');

INSERT INTO vistasenlapagina (vista_pagina, id_usuario)
VALUES ('8', '1'),('3', '2'),
('3', '3'),('2', '4'),
('4', '5'), ('5', '6'),
('4', '7'),('9', '8');

/*Parte 4: Elimine una de las tablas creadas.*/

drop table informacion ;


/*Justifique cada tipo de dato utilizado en la creación de las tablas.

VARCHAR: fue implementado para los atributos NOMBRE, APELLIDO, CONTRASEÑA, ZONA_HORARIA, GENERO,TELEFONO
y asignamos una longitud correspondiente a los datos solicitados. Fue asignado porque son datos de tipo string,
y VARCHAR asegura que el espacio utilizado sea acorde a la longitud del texto, es decir, si la longitud asignada es 
de 15 caracteres, y se ocupan 10, VARCHAR indica que el espacio utilizado se ajuste a esos 10 caracteres.

TINYINT: fue implementado para los atributos id_usuario, id_informacion, ya que nuestra base de datos está
pensada para el ingreso de una cantidad limitada de registros (8 registros), ocupando menos memoria si utilizaramos INT.

DATETIME: fue implementado para el campo fecha_hora_ingreso porque se nos solicitaba informacion sobre hora y fecha
y este tipo de dato nos garantiza esta información.

*/
