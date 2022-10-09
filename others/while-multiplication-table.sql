set serveroutput on;

declare

  numero number := 0;
  resultado number;

begin
  /* Salida:  
  
    3 x 1 = 3
    3 x 2 = 6
    3 x 3 = 9
    3 x 4 = 12
    3 x 5 = 15
  
   */
  while numero <= 5 loop
    resultado := 3 * numero;
    dbms_output.put_line('3x ' || numero || ' = ' || resultado);
    numero := numero + 1;
  end loop;

end;
