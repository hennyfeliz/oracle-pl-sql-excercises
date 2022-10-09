/* COLLECIONES SEGUNDA PARTE... */

SET SERVEROUTPUT ON;

/* guardando datos de una tabla en un arreglo... */


DECLARE
  TYPE DEPARTAMENTOS IS
    TABLE OF DEPARTMENTS.DEPARTMENT_NAME%TYPE;
  INDEX BY PLS_INTEGER; /* definicion de clave */
  DEPA  DEPARTAMENTOS;
 /* creacion del cursor */
  CURSOR CUR_DEP IS
    SELECT
      *
    FROM
      DEPARTMENTS;
  F     PLS_INTEGER:=1; /* clave numerica */
BEGIN
 /* guardando datos en el arreglo... */
  FOR DEP IN CUR_DEP LOOP
    DEPA(F) := DEP.DEPARTMENT_NAME;
    F:=F+1; /* incrementando la clave */
  END LOOP;
 /* mostrando valores del arreglo... */
  FOR I IN 1..F-1 LOOP
    DBMS_OUTPUT.PUT_LINE(DEPA(I));
  END LOOP;
END;
 /* salida:

  administracion
  presidencia
  vide-presidencia
  gerente
  conserje
  contador
  etc

 */
 /* OTRA DECLARACION... */
 SET SERVEROUTPUT ON;
DECLARE
  TYPE EMPLEADOS IS
    TABLE OF EMPLOOYES%ROWTYPE;
  INDEX BY PLS_INTEGER;
  EMPLE EMPLEADOS;
 /* CURSOR */
  CURSOR CUR_EMPE IS
    SELECT
      *
    FROM
      EMPLOOYES
    WHERE
      SALARY >= 4000;
  Z     PLS_INTEGER:=1 /* clave */ BEGIN
 /* agregando valores a nuestro arreglo... */ FOR EMP IN CUR_EMPE LOOP
    EMPE(Z) := EMP;
    Z:=Z+1; /* incrementando la clave */
  END LOOP;
 /* mostrando valores del arreglo... */
  FOR   I IN 1..Z-1 LOOP
    DBMS_OUTPUT.PUT_LINE(EMPE(I).FIRST_NAME);
 /* add mas columnas de la tabla... 
    ej;
    dbms_output.put_line(empe(i).lastname);
    */
  END LOOP;
END;