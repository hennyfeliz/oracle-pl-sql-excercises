set serveroutput on;

declare

  valor number(2) := 10;

begin
  /* Salida:  10 11 12 13 14 15 16 17 18 19.  */
  while valor < 20 loop
    dbms_output.put_line('el valor es: ' || valor);
    valor := valor + 1;
  end loop;

end;
