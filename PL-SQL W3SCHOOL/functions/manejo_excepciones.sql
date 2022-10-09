/* example */

DECLARE
   //Declaration section 
 BEGIN 
   //Exception section 
 EXCEPTION 
 WHEN ex_name1 THEN 
    //Error handling statements 
    /* cuando ocurre un error especifico que lo pudiesemos esperar, esta se manera con esta herramienta... */
 WHEN ex_name2 THEN 
    -Error handling statements 
 WHEN Others THEN 
   //Error handling statements 
END;

/* another example... */

DECLARE
   s_rollNo students.rollNo%type := 10;
   s_name students.name%type;
   s_address students.address%type;
BEGIN
   SELECT rollNo, name, address FROM students WHERE rollNo = s_rollNo;
   dbms_output.put_line(s_rollNo || ' ' || s_name || ' ' || s_address);
   EXCEPTION
   WHEN no_data_found THEN
      dbms_output.put_line('No such student!');
   WHEN others THEN
      dbms_output.put_line('Error!');
END;


/* 

  salida:

  'No such student!', manejo una excepcion porque no se encontraron los datos...
  (excepcion manejada en la linea 27 y 28...)

 */
