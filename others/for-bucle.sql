set serveroutput on;

declare 
  
  numero number(2);  

begin

  /* Salida: 10 11 12 13 14 15 16 17 18 19 20 */

  for numero in 10.. 20 loop
    dbms_output.put_on('valor de numero ' || numero);
  end loop;

end;