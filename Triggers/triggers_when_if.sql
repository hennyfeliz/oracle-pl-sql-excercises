/*
drop table empleados;

  'creando tablas'

create table empleados(
  documento char(8),
  apellido varchar2(20),
  nombre varchar2(20),
  seccion varchar2(30),
  sueldo number(8,2);
);

drop table control;

create table control(
  usuario varchar2(30),
  fecha date,
  documento char(8),
  antiguo_sueldo number(8,2),
  nuevo_sueldo number(8,2)
);
*/


/* ejecuta un insert cuando el valor del nuevo sueldo es mayor al sueldo anterior... */

CREATE OR REPLACE TRIGGER AUEMENTO_SUELDO BEFORE
  UPDATE OF SUELDO ON EMPLEADOS FOR EACH ROW WHEN(NEW.SUELDO > OLD.SUELDO)
BEGIN
  INSERT INTO CONTROL VALUES(
    USER,
    SYSDATE,
    :OLD.DOCUMEMENTO,
    :OLD.SUELDO,
    :NEW.SUELDO
  );
END AUEMENTO_SUELDO;
 /* example */
UPDATE EMPLEADO
SET
  SUELDO = 600
WHERE
  DOCUMENTO = 223012394; /* 1 fila actualizada... */
SELECT
  *
FROM
  CONTROL;
 /* trigger que nos coloca valores en mayuscula... */
 CREATE OR REPLACE TRIGGER TR_UPDATE_DATA BEFORE INSERT ON EMPLEADOS FOR EACH ROW BEGIN :NEW.APELLIDO :=UPPER(
  :NEW.APELLIDO
);
IF(:NEW.SUELDO IS NULL) THEN
  :NEW.SUELDO :=0;
END IF;
END TR_UPDATE_DATA;
 /* verificando datos... */
SELECT
  *
FROM
  EMPLEADOS;
 /* ejecutando insert para ver resultado del trigger... */
 INSERT INTO EMPLEADOS VALUES(
  '0238123',
  'lopez',
  'roberto',
  'oficinista',
  NULL
);
 /* 
  salida:

  poniendo el apellido en mayuscula...
  'lopez' -> 'LOPEZ'

  si el nuevo sueldo es 'null', entonces lo pondra en '0'...

  sueldo: null ->> 0.

 */