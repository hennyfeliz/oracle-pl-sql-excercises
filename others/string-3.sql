set serveroutput on;

declare
  saludo2 varchar2(300) := '####Hola a todos####';

begin

  /* Corta parte del string del lado derecho...
  Salida: '####Hola a todos'*/

  dbms_output.put_line(RTRIM(saludo2, '#'));

  /* Corta parte del string del lado izquierdo...
  Salida: 'Hola a todos####'*/

  dbms_output.put_line(LTRIM(saludo2, '#'));

  /* Corta parte del string de todos los lados...
  Salida: 'Hola a todos'*/

  dbms_output.put_line(TRIM('#', from saludo2));

end;