/* cursor ref */

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION DATO_EMPLEADO(
  V_DOCUMENTO IN NUMBER
) RETURN SYS_REF_CURSOR IS
  V_REF  SYS_REF_CURSOR BEGIN OPEN V_REF FOR
  SELECT
    *
  FROM
    EMPLEADOS
  WHERE
    DOCUMENTO = V_DOCUMENTO;
  RETURN V_REF;
END DATO_EMPLEADO;
 /* contexto: devolvera los registros que sean iguales a la columna de 'documento' -> v_documento y los retornara... */
 /* devolvera una sola columna con todos los datos empegotados... */
 SELECT DATO_EMPLEADO('283212391') FROM DUAL;
 /* declarando una variable y reasignando el valor de retorno de la funcion 'dato_empleado' */
 VAR    RC1 REFCURSOR EXEX :RC1:=DATO_EMPLEADO('283212391');
PRINT  RC1   ;