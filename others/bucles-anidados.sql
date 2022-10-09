set serveroutput on;

declare 
  
  bucle1 number := 0;
  bucle2 number;

begin

  /* Datos primer bucle */
  loop
    dbms_output.put_line('------------------');
    dbms_output.put_line('valor de bucle externo = ' || bucle1);

    /* Datos segundo bucle */
    dbms_output.put_line('------------------');
    loop
      dbms_output.put_line('valor de bucle interno = ' || bucle2);
      bucle2 := bucle2 + 1
      exit then bucle2 = 5;
    end loop
  end loop;

  /* 
  
    Salida: 

    valor bucle externo = 0
    bucle interno; 0 1 2 3 4 

    valor bucle externo = 1
    bucle interno; 0 1 2 3 4 

    valor bucle externo = 2
    bucle interno; 0 1 2 3 4 

    valor bucle externo = 3
    bucle interno; 0 1 2 3 4 

    valor bucle externo = 4
    bucle interno; 0 1 2 3 4 

    valor bucle externo = 4
    bucle interno; 0 1 2 3 4 


   */

end;