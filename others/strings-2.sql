set serveroutput on;

declare

  saludo varchar2(12) := 'Hola a todos';

begin
  /* Funcion para hacer grande todas las letras del string UPPER */
  dbms_output.put_line(UPPER(saludo));

  /* Funciona para hacer pequeña las letras del string LOWER*/
  dbms_output.put_line(LOWER(saludo));

  /* Funciona para traer la primera letra del string INITCAP*/

  dbms_output.put_line(INITCAP(saludo));

  /* Busca una cantidad de caracteres del string especifica [Parecido al 'Slice' de JS]...*/

  dbms_output.put_line(SUBSTR(saludo, 1, 5));

  /* Busca a partir del 4to caracter...*/
  dbms_output.put_line(SUBSTR(saludo, 4));

  /* Busca en que posicion esta la letra dentro del string... */
  dbms_output.put_line(INSTR(saludo, 'o'));


end;