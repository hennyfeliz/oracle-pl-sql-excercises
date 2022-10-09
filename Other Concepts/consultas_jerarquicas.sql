/* consultas jerarquicas */

DROP TABLE EMPLEADOS;

CREATE TABLE EMPLEADOS (
  ID_EMPLEADO INT NOT NULL PRIMARY KEY,
  NOMBRE VARCHAR(20) NOT NULL,
  ID_PUESTO CHAR(20),
  ID_SUPERVISOR INT NULL
);

/* inserts */
INSERT INTO EMPLEADOS VALUES(
  100,
  'Miguel Gonzales',
  'PRESIDENTE',
  NULL
);

INSERT INTO EMPLEADOS VALUES(
  101,
  'Federico Antillana',
  'VICE_PRESIDENTE',
  100
);

INSERT INTO EMPLEADOS VALUES(
  102,
  'MIguel Montero',
  'GERENTE_GRAL',
  100
);

INSERT INTO EMPLEADOS VALUES(
  103,
  'Manuel Saldaños',
  'IT_GERENTE',
  102
);

INSERT INTO EMPLEADOS VALUES(
  104,
  'Ana Montesinos',
  'SOPORTE_IT',
  103
);

INSERT INTO EMPLEADOS VALUES(
  105,
  'Manuel Figueroa',
  'SOPORTE_IT',
  103
);

INSERT INTO EMPLEADOS VALUES(
  106,
  'Eliana Sandoval',
  'SOPORTE_IT',
  103
);

INSERT INTO EMPLEADOS VALUES(
  107,
  'Iluminada Contreras',
  'SOPORTE_IT',
  103
);

INSERT INTO EMPLEADOS VALUES(
  108,
  'Manuela Condado',
  'SECRETARIA',
  101
);

INSERT INTO EMPLEADOS VALUES(
  109,
  'Emilia Cortinez',
  'SECRETARIA',
  102
);

INSERT INTO EMPLEADOS VALUES(
  110,
  'Denia Soler',
  'SECRETARIA',
  103
);

INSERT INTO EMPLEADOS VALUES(
  111,
  'Barbara Eleonor',
  'SECRETARIA',
  101
);

INSERT INTO EMPLEADOS VALUES(
  112,
  'Fausto Melaneo',
  'VENDEDOR',
  102
);

INSERT INTO EMPLEADOS VALUES(
  113,
  'Adalberto Mirabal',
  'VENDEDOR',
  102
);

INSERT INTO EMPLEADOS VALUES(
  114,
  'Estelvina Zorrilla',
  'VENDEDORA',
  102
);

INSERT INTO EMPLEADOS VALUES(
  115,
  'Mireya Matos',
  'ASISTENTE_SECRETARIO',
  108
);

INSERT INTO EMPLEADOS VALUES(
  116,
  'Elena Martinez',
  'ASISTENTE_SECRETARIO',
  109
);

/* inicio de ejercicios... */

SELECT
  NOMBRE,
  ID_PUESTO LEVEL
FROM
  EMPLEADOS START WITH NOMBRE 'Migue Gonzales'
CONNECT BY
  PRIOR ID_EMPLEADO = ID_SUPERVISOR;

/* salida: 

  nombre      puesto        level

  'roberto'   'presidente'  1
  'francisco' 'vice pres.'  2
  'manuela'   'secretaria'  3
  'barbara'   'asist. sect' 4

 */

/* visualizando jerarquia en modo 'recorrido'... */

SELECT
  LEVE,
  NOMBRE,
  ID_PUESTO,
  SYS_CONNECT_BY_PATH(NOMBRE,
  '>') JERARQUIA
FROM
  EMPLEADOS START WITH ID_SUPERVISOR IS NULL
CONNECT BY
  PRIOR ID_EMPLEADO = ID_SUPERVISOR;

/* salida:

  JERARQUIA

  Miguel
  Miguel > Federico
  Miguel > Fererico > Manuela
  Miguel > Manuel
  Miguel > Manuel > Roberto
 */



/* SYS_CONNECT_BY_PATH(P_ /*COLUMN*/,

P_ /*CHAR*/,

P_ /*'nlsparam'*/ ) *
/