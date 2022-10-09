/* bucle for */


DECLARE  
BEGIN  
  FOR var IN REVERSE 1..10
  LOOP    
    DBMS_OUTPUT.PUT_LINE(var);   
  END LOOP;  
END;

/* salida: 10 9 8 7... 1 */

/* with procedures... */

create or replace reverse_bucle(start in number, end in number)
as
  begin

    for elem in reverse start..end
    loop
      dbms_output.put_line(elem);
    end loop;

  end reverse_bucle;

execute reverse_bucle(12, 18);

/* 

  salida:  
  
  18 17 16 15 14 13 12
  
  */