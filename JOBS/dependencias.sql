/* UTILIZANDO 'HR DATABASE' */

/* viendo tablas de dependencias... */
select * from user_dependencies;

/* con filtro */
select * from user_dependencies where name = 'emplooyes';/* sin salida... */

select * from user_dependencies where name = 'EMP_DETAILS_VIEW';/* varios objetos... */

select * from user_dependencies where referenced_name = 'EMPLOOYES';/* varios registros... */

select * from user_objects;/* informacion sobre distintos objetos sobre nuestro esquema... */

select status, count(*) from user_objects group by status; /* imprime los estatus y la cantidad de estatus... */

/* CREACION DE TABLA DE PRUEBA... */
create tabla prueba(
  campo1 number,
  campo2 number
);

/* tabla creada correctamente... */

select * from user_objects where object_name like '%prueba%';/* devuelve los objetos creados con esta condicional... */

/* creacion de una vista. */
create or replace view v_prueba
as
  select campo1 from prueba;

/* nuevamente... */
select * from user_objects where object_name like '%prueba%';/* devuelve los objetos creados con esta condicional... */


/* alterando campo2 como tipo varchar... */
alter table prueba modify campo2 varchar2(200);

/* -> borrando columna 'campo1' */ 
alter table prueba drop column campo1;
/* de esta manera se cambia el estado a 'invalid'... */


/* CREACION DE PROCEDIMIENTO... */

create or replace procedure proc_01
is
  begin
    null;
  end;  

/* mostrando... */
select * from user_objects where object_name like '%proc%';/* lanza los procedimientos con estas caracteristicas... */


/* CREACION DE UN SEGUNDO PROCEDIMIENTO... */

create or replace procedure proc_02
is
  begin
    proc_01;
  end;/* creado correctamente... */

/* OJO: SI ALGO FALLA EN EL PRIMER PROCEDURE, LOS DOS ESTARAN EN ESTATUS 'INVALID'...*/

/* OBSEVACION: SI REPARAMOS EL PRIMER PROCEDIMIENTO PADRE, DEBEMOS TAMBIEN REPERAR LOS ELEMENOS HIJOS... */
alter procedure proc_02 compile;/* para volver a activar el estatus 'valid' del segundo procedimiento... */

/* COMPILE: FUNCIONA PARA TODO, MENOS PARA 'PACKAGES'.... */



