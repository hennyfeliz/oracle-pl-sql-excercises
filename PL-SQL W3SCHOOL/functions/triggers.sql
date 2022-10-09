/* 
   'databases trigger'

   Un activador de base de datos es un programa almacenado que se activa o ejecuta automáticamente cuando se producen algunos eventos. Un disparador puede ejecutarse en respuesta a cualquiera de los siguientes eventos:

   1. Una declaración de manipulación de base de datos (DML) como DELETE, INSERT o UPDATE. 

   2. Una declaración de definición de base de datos (DDL) como CREATE, ALTER o DROP.

   3. Una operación de base de datos como SERVERERROR, LOGON, LOGOFF, STARTUP o SHUTDOWN. Nota: Se puede definir un disparador en la tabla, vista, esquema o base de datos con la que está asociado el evento.

   'types of triggers'

   1. Activador de nivel de fila: se activa un evento a nivel de fila, es decir, para cada fila actualizada, insertada o eliminada. 
   
   2. Desencadenador de nivel de instrucción: se activa un evento a nivel de tabla, es decir, para cada instrucción SQL ejecutada.


   'WHERE'


   CREATE [OR REPLACE] TRIGGER trigger_name: crea un disparador con el nombre dado o sobrescribe un disparador existente con el mismo nombre.

   {BEFORE | AFTER | INSTEAD OF } – Especifica que el disparador sea disparado. es decir, antes o después de actualizar una tabla. INSTEAD OF se utiliza para crear un activador en una vista.
   
   {INSERT [OR] | UPDATE [OR] | DELETE} – Especifica el evento desencadenante. El activador se activa en todos los eventos de activación especificados.
   
   [OF col_name]: se usa con activadores de actualización. Se usa cuando queremos desencadenar un evento solo cuando se actualiza una columna específica.
   
   [ON table_name] – Especifica el nombre de la tabla o vista a la que está asociado el disparador.
   
   [REFERENCING OLD AS o NEW AS n]: se utiliza para hacer referencia a los valores antiguos y nuevos de los datos que se están modificando. De forma predeterminada, hace referencia a los valores como :old.column_name o :new.column_name. No se puede hacer referencia a los valores antiguos al insertar un registro y no se puede hacer referencia a los valores nuevos al eliminar un registro, porque no existen.
   
   [FOR EACH ROW]: se utiliza para especificar si un disparador debe activarse cuando cada fila se ve afectada (Disparador de nivel de fila) o solo una vez cuando se ejecuta la instrucción sql (Disparador de nivel de tabla).
   CUÁNDO (condición): solo es válido para activadores de nivel de fila. El activador se activa solo para las filas que cumplen la condición especificada.


 */

CREATE [OR REPLACE] TRIGGER trigger_name 
 {BEFORE | AFTER | INSTEAD OF } 
 {INSERT [OR] | UPDATE [OR] | DELETE} 
 [OF col_name] 
 ON table_name 
 [REFERENCING OLD AS o NEW AS n] 
 [FOR EACH ROW] 
 WHEN (condition)  
 BEGIN 
   --- sql statements  
 END; 

 /* ejemplo de datos existentes 'emplooyes' table 
   
   EMP_ID	  NAME      AGE	   ADDRESS	SALARY
   1	      Shveta   	23	   Delhi	  50000
   2	      Bharti	  22	   Karnal 	52000
   3	      Deepika	  24	   UP	      54000
   4	      Richi	    25	   US	      56000
   5	      Bharat	  21	   Paris	  58000
   6	      Sahdev	  26	   Delhi	  60000

 */

/* 
  another funciones with triggers

  este trigger muestra la diferencia entre los salarios nuevos y viejos, y se activa
 */

CREATE OR REPLACE TRIGGER show_salary_difference
BEFORE DELETE OR INSERT OR UPDATE ON employees
FOR EACH ROW
WHEN (NEW.EMP_ID > 0)
DECLARE
   sal_diff number;
BEGIN
   sal_diff := :NEW.salary  - :OLD.salary;
   dbms_output.put_line('Old salary: ' || :OLD.salary);
   dbms_output.put_line('New salary: ' || :NEW.salary);
   dbms_output.put_line('Salary difference: ' || sal_diff);
END;

/* borrar trigger */
DROP TRIGGER trigger_name;

