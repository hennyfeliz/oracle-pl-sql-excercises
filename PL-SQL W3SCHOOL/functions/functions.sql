/* PL-SQL functions */

CREATE [OR REPLACE] FUNCTION function_name [parameters] 
RETURN return_datatype;  
IS|AS
	//Declaration block /* Bloque de declaraciones... */
BEGIN  
	//Execution_block /* Bloque de ejecucion... */
	Return return_variable;  /* retorno... */
EXCEPTION  
	//Exception block  /* manejo de excepciones... */
	Return return_variable;  
END; 

/* creating a function... */

/* creando una funcion llamada 'getMultiplicate' con dos parametros enteros para devolver el resultado de su multiplicacion... */

create or replace function getMultiple(num1 in number, num2 in number)    
return number    
is     
  num3 number(8);    
begin    
  num3 :=num1*num2;    
  return num3;    
end;  

result :=  getMultiple(4, 5);
SELECT getMultiple(4, 5) FROM dual;
dbms_output.put_line(getMultiple(4, 5));/* esta sirve para imprimir directamente el resultado de la funcion... */

/* borrar funcion... */
DROP FUNCTION getMultiple; /* borrando 'getMultiple'... */


/* 

  salida:  

  dbms_output.put_line(getMultiplicate(3, 6));
  3 x 6 = 18...

  
*/