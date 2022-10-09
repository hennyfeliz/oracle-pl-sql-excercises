set serveroutput on;

/* Creando un procedimiento llamado 'saludo', que ejecuta una salida en consola de 'saludos...' */

create or replace procedure saludo
as
  begin
    dbms_output.put_line('saludos...');
  end saludo;

/* Ejecutando el procedimiento... */

begin
  saludo;
end;

/* Otras formas de ejecutar un procedimiento */

execute saludo;
