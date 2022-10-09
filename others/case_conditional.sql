/* creando una funcion que recive un entero por entrada y dependiendo de este numero devolvera un string (varchar) con en dia de la semana... */


create or replace function case_function(numbero int)
is
  dia varchar2(25);
  begin
    dia:='';
      case numbero
        when 1 then dia:='lunes';
        when 2 then dia:='martes';
        when 3 then dia:='miercoles';
        when 4 then dia:='jueves';
        when 5 then dia:='viernes';
        when 6 then dia:='sabado';
        when 7 then dia:='domingo';
        else dia:='no es numero correcto...'
      end case;
        return dia;
  end;



dbms_output.put_line(case_function(5));
/* salida: viernes */

dbms_output.put_line(case_function(19));
/* salida: 'no es numero correcto...' */

select case_function(3) as "dia de la semana" from dual;

/* 
  salida:

  dia de la semana
  'miercoles'.

 */



create or replace function date_function(fecha date)
return varchar2
is
  mes varchar2(20);
  trimestre number;
begin
  mes:=extract(month from fecha);
  trimestre:=0;

  case mes
    when 1 then trimestre:=1;
    when 2 then trimestre:=1;
    when 3 then trimestre:=1;
    when 4 then trimestre:=2;
    when 5 then trimestre:=2;
    when 6 then trimestre:=2;
    when 7 then trimestre:=3;
    when 8 then trimestre:=3;
    when 9 then trimestre:=3;
    else trimestre:=4;
  end case;
    return trimestre;
  end;


select date_function(to_date('04/03/2002','dd/mm/yyyy')) from dual;

/* salida: 1 */

select date_function(to_date('23/08/2006','dd/mm/yyyy')) from dual;

/* salida: 3 */

