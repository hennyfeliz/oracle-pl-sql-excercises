create or replace procedure ingreso_empleado(docu in char, nom in varchar2, ape in varchar2)
as
  begin
    insert into empleados values(docu, nom, ape)
  end ingreso_empleado;


execute ingreso_empleado('nuevo empleado', 'roberto','felipe');
/* registrando persona dentro de la tabla 'empleados' de la base de datos... */

/* 

  Salida: 'registro exitoso!...'

 */
 

/* Borrando el procedimiento... */
drop procedure ingreso_empleado;


