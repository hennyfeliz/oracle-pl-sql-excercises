set serveroutput on;

declare 
  
  /* Sin variables a declarar... */
begin

  /* Salida: 
  
    2x 1 = 2
    2x 2 = 4
    2x 3 = 6
    2x 4 = 8
    2x 5 = 10
    etc...
   */

  for f in 1..10 loop
    dbms_output.put_on('2x' || f || ' = ' || (f*2));
  end loop;

end;