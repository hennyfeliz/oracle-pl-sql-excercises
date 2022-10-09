/* while loop */


DECLARE  
  num NUMBER := 1;  
BEGIN  
  WHILE num <= 10 /* importante poner <= para asegurar que llege a 10 la condicion... */
  LOOP    
    DBMS_OUTPUT.PUT_LINE(num);   
    num := num+1;
  END LOOP;  
END;


/* salida: 1 2 3 4 5... 10 */