set serveroutput on;

declare 

  /* Creando un arreglo con 5 elementos de texto con 20 espacios maximos... */
  type matriz_nombre is varray(5) := varchar2(20);

  /* Creand un arreglo con 5 elementos de enteros con las edades... */
  type matriz_edad is varray(5) := integer;

  nombre matriz_nombre;
  edad matriz_edad;

  total integer;

begin

  nombre:=matriz_nombre('roberto','henny','carlos','michael','ramon');

  edad:=matriz_edad(21, 33, 12, 22, 20);
  total:=nombre.count;

  for elem in 1..total loop
    dbms_output.put_line('nombre: ' || nombre(elem) || ', edad: ' || edad(elem));

  /* 
  
    Salida:
    
    nombre: roberto, edad: 21
    nombre: henny, edad: 33
    nombre: carlos, edad: 12
    nombre: michael, edad: 22
    nombre: ramon, edad: 20
   */
  

end;