/* # TRIGGER FOREACH ROW */

drop table empleados;


create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  seccion varchar2(20)
);

/* limpiar la tabla de control... */
truncate table control;


/* crea un insert debido a un evento por cada tabla... */
create or replace trigger ingresar_empleados
before insert
on empleados
  for each row
    begin
      insert into control values(user, sysdate);
    end ingresar_empleados;


/* inserts */

insert into empleados values(etc...);


/* 
  salida:
  
  un insert a la tabla empleados por cada tabla..
 */

/* borrar trigger */
drop trigger ingresar_empleados;


