/* 

  # ATRIBUTES...

  %found

  Devuelve TRUE si una instrucción INSERT, UPDATE o DELETE afectó a una o más filas o una instrucción SELECT INTO devolvió una o más filas. De lo contrario, devuelve FALSO.
  Example: SQL%FOUND

  %notfound

  Devuelve VERDADERO si una instrucción INSERTAR, ACTUALIZAR o ELIMINAR no afectó a filas, o si una instrucción SELECT INTO no devolvió filas. De lo contrario, devuelve FALSO.
  Example: SQL%NOTFOUND

  %isopen

  Siempre devuelve FALSO para cursores implícitos, porque Oracle cierra el cursor SQL automáticamente después de ejecutar su declaración SQL asociada.
  Example: SQL%ISOPEN

  %rowcount 

  Devuelve el número de filas afectadas por una instrucción INSERT, UPDATE o DELETE o devueltas por una instrucción SELECT INTO.
  Example: SQL%ROWCOUNT
 */


/* example... */


DECLARE  var_rows number(2);
BEGIN
  UPDATE employees 
  SET salary = salary + 2000;
  IF SQL%NOTFOUND THEN
    dbms_output.put_line('No record updated.');
  ELSIF SQL%FOUND THEN
    var_rows := SQL%ROWCOUNT;
    dbms_output.put_line(var_rows || ' records are updated.');
  END IF; 
END;

/* salida: Se actualizan 10 registros. */
/* si falla: No se actualizaron los registros... */


/* 
  ¿Cómo usar el cursor explícito?

  1. 'DECLARE': DECLARAR el cursor para la inicialización en la sección de declaración. 
  2. 'OPEN': ABRIR el cursor para asignación de memoria en la sección de ejecución.
  3. 'FETCH' el cursor para recuperar datos en la sección de ejecución. 
  4. 'CLOSE': CIERRE el cursor para liberar la memoria asignada en la sección de ejecución.
 */

/* Declarando el cursor  */
CURSOR cur_students IS
   SELECT rollNo, name, address FROM students;

/* Obteniendo el cursor: */
FETCH cur_students INTO s_rollNo, s_name, s_address;

/* Cerrando el cursor... */
CLOSE cur_students;


/* 

    # EXAMPLE


 */



/*  */
DECLARE
   s_rollNo students.rollNo%type;
   s_name students.name%type;
   s_address students.address%type;
   CURSOR cur_students is
      SELECT rollNo, name, address FROM students;
BEGIN
   OPEN cur_students;
   LOOP
      FETCH cur_students into s_rollNo, s_name, s_address;
      EXIT WHEN cur_students%notfound;
      dbms_output.put_line(s_rollNo || ' ' || s_name || ' ' || s_address);
   END LOOP;
   CLOSE cur_students;
END;

/* 
  salida: 

  1 Vivek UK 
  2 Anil Delhi 
  3 Mahesh Rajasthan     
  4 Vishal Delhi
  5 Binod UP  
  6 Sunil UP

 */