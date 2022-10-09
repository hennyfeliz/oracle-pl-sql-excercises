/* with 'exit' */

DECLARE  
  num NUMBER := 1;  
BEGIN  
  LOOP    
    DBMS_OUTPUT.PUT_LINE(num);   
    IF num = 10 THEN
      EXIT;
    END IF;
    num := num+1;
  END LOOP;  
END;

/* salida: 1 2 3 4 5... 10 */



/* with then */

DECLARE  
  num NUMBER := 1;  
BEGIN  
  LOOP    
    DBMS_OUTPUT.PUT_LINE(num);   
    EXIT WHEN num = 10;
    num := num+1;
  END LOOP;  
END;

/* salida: 1 2 3 4 5... 10 */