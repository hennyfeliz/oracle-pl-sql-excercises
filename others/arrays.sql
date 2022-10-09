set serveroutput on;

declare 

  /* Creando un arreglo con 5 elementos de texto con 20 espacios maximos... */
  type a_paises is varray(5) := varchar2(20);

  nombre a_paises;

begin

  /* Rellenando el arreglo */
  nombre := a_paises('Argentina', 'Brasil', 'Rep. Dominicana');

  /* Salida:

    nombre Argentina
    nombre Brasil
    nombre Rep. Dominicana
   */

  for elem in  1..5 loop
    dbms_output.put_line('nombre' || nombre(elem));
  end loop;

end;