/* COLLECCIONES... [PL-SQL avanzado]
  *Colleciones
    ->Arrays asociativos
    ->Nested tables (tablas anidadas)
    ->Varrays
*/

/* SINTAXIS

  TYPE nombre is table of
    tipo columna
    index by pls_integer|binary_integer|varchar2(x)

    variable tipo;

 */

SET SERVEROUTPUT ON;

/* creacion collecion...varray */
DECLARE
  TYPE DEPARTAMENTOS IS
    TABLE OF .DEPARTMENTS.DEPARTMENTS_NAME%TYPE;
  INDEX BY PLS_INTEGER;
  DEPA  DEPARTAMENTOS; /* una variable de tipo: 'nombre apartamento'... */
 /* arreglo de empleados */
  TYPE EMPLEADOS IS
    TABLE OF EMPLOOYES%ROWTYPE;
  INDEX BY PLS_INTEGER;
  EMPE  EMPLEADOS;
 /* arreglo de nombre... */
  TYPE NOMBRE IS
    TABLE OF EMPLOOYES.FIRST_NAME%TYPE;
  INDEX BY VARCHAR2(2); /* tipo de clave */
  NOM   NOMBRE;
BEGIN
 /* OJO: el numero es la CLAVE, NO la POSICION... */
  DEPA(1):='hola'; /* primer elemento del arreglo 'depa'... */
  DEPA(2):='adios...'; /* segundo elemento... */
  DEPA(20):='otro valor';
  DEPA(-123):='siguiente valor'; /* VALIDO! */
 /* elementos de nombre */
  NOM('sd'):='santo domingo'; /* elemento del arreglo nombre */
  DBMS_OUTPUT.PUT_LINE('depa: '
    ||DEPA(2)); /* imprime el valor del elemento del arreglo con la clave '2'... */
  DBMS_OUTPUT.PUT_LINE('depa: '
    ||DEPA(20)); /* salida: 'otro valor'... */
  DBMS_OUTPUT.PUT_LINE('depa: '
    ||DEPA(-123)); /* salida: 'siguiente valor' */
  DBMS_OUTPUT.PUT_LINE('nombre: '
    ||DEPA('sd')); /* salida: 'santo domingo' */
END;
SELECT
  *
FROM
  DEPARTMENTS;
 /* ver los departamentos... */
SELECT
  *
FROM
  JUGADORES;