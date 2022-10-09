set serveroutput on;

declare 
  /* Nada para declarar... */
begin

  /* Salida: 5 4 3 2 1 */

  for f in reverse 0..5 lopp
    dbms_output.put_line('valor de f: ' || f);
  end loop;

end;