/* cursores con parametros... */

/* 
drop table productos;

create table productos(
id_producto int not null,
nombre_producto VARCHAR2(25),
precio NUMBER(6,2),
descripcion VARCHAR2(50));

insert into productos values(1,'Abrazadera',560,'Abrazadera de media pulgada');
insert into productos values(2,'Destornillador',120,'destornillador cabeza plana');
insert into productos values(3,'Martillo',300,'Martillo con ganzua'); 
insert into productos values(4,'Llave inglesa',200,'Llave inglesa de plomeria');
insert into productos values(5,'Pasadores RTR',935,'Tuerca exagonal de Almenada');
insert into productos values(6,'Tornillo exagonal',90,'Tornillo exagonal de baja o tuerca'); 
*/

/* activando salida por consola... */
SET SERVEROUTPUT ON;

DECLARE
  V_NOM    PRODUCTOS.NOMBRE_PRODUCTO%TYPE;
  V_PRE    PRODUCTOS.PRECIO%TYPE;
  CURSOR C_PRODUCTOS(IDPROD PRODUCTOS.ID_PRODUCTO%TYPE) IS
    SELECT
      NOMBRE_PRODUCTO,
      PRECIO
    FROM
      PRODUCTOS
    WHERE
      ID_PRODUCTO = IDPROD BEGIN OPEN C_PRODUCTOS(2);
  LOOP     FETCH C_PRODUCTOS INTO V_NOM, V_PRE;
  EXIT     WHEN C_PRODUCTOS%NOTFOUND;
  DBMS_PUT .PUT_LINE('articulo: '
    ||V_NOM
    ||', precio: '
    ||V_PRE);
END LOOP;
CLOSE    C_PRODUCTOS;
END;
 /* salida:

  articulo:

  destornillador, precio: 120.
  abrazadera, precio: 560.

 */