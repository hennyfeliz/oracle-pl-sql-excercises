/* RAISE APPLICATION ERROR */
/* 
CONTACTO::informaticonfig@gmail.com
COLABORACION: paypal.me/informaticonfig

CODIGO:
drop table empleados;
 drop table control;

 create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  domicilio varchar2(30),
  seccion varchar2(20),
  sueldo number(8,2)
 );

 create table control(
  usuario varchar2(30),
  fecha date,
  operacion varchar2(30)
 );

 insert into empleados values('22222222','Acosta','Ana','Avellaneda 11','Secretaria',1800);
 insert into empleados values('23333333','Bustos','Betina','Bulnes 22','Gerencia',5000);
 insert into empleados values('24444444','Caseres','Carlos','Colon 333','Contaduria',3000);
 */

/* errores definidos por el usuario... */


CREATE OR REPLACE TRIGGER TR_CONTROL_EMPLEADOS BEFORE
  INSERT OR
    UPDATE OR
      DELETE ON EMPLEADOS FOR EACH ROW
    BEGIN
      IF(:NEW.SUELDO>5000) THEN
        REISE_APPLICATION_ERROR(-20000, 'el sueldo no puede superar los $5.000.00');
      END IF;
      INSERT INTO CONTROL VALUES(
        USER,
        SYSDATE,
        'insercion...'
      );
      IF(:OLD.SECCION='gerencia') THEN
        REISE_APPLICATION_ERROR(-20000, 'no se puede eliminar puesto de gerencia...');
      END IF;
      INSERT INTO CONTROL VALUES(
        USER,
        SYSDATE,
        'borrado...'
      );
      IF UPDATING('documento') THEN
        RAISE_APPLICATION_ERROR(-20000, 'no se puede actualizar numero de documento...');
      END IF;
    END TR_CONTROL_EMPLEADOS;
    SELECT
      *
    FROM
      EMPLEADOS;
 /* muestra todos los empleados */
    INSERT INTO EMPLEADOS VALUES(
      '1283142-1',
      'suarez',
      'ramon',
      'calle alberto #23',
      'informatica',
      8000
    );
 /* lanza un error; porque el sueldo supera el limite de la primera condicioanl que dice que no puede ser mayor de '5000'

  salida: 'el sueldo no puede superar los $5.000.00'...
 */
    DELETE FROM EMPLEADOS
    WHERE
      SECCION = 'gerencia';
 /* lanza un error; debido a que en la segunda condicional dice que no se puede borrar personas en el puesto de gerencia...

salida: 'no se puede eliminar puesto de gerencia...'.
 */
    UPDATE EMPLEADOS
    SET
      DOCUMENTO = '2312384512'
    WHERE
      DOCUMENTO = '1238121265';
 /* lanza un error; debido a que no podemos actualizar registros iguales a documentos...

salida: 'no se puede actializar numero de documento...'

 */

 /* ACTUALIZANDO SUELDO A PERSONAS CON EL DOCUEMTENTO DE 24444444 */
UPDATE EMPLEADOS
SET 
  SUELDO = 10000
WHERE
  DOCUEMENTO = '2020202020'

