/* cursores implicitos... */

/* 
 drop table empleados;

 create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  domicilio varchar2(30),
  seccion varchar2(20),
  sueldo number(8,2)
 );
 insert into empleados values('22222222','Acosta','Ana','Avellaneda 11','Secretaria',1800);
 insert into empleados values('23333333','Bustos','Betina','Bulnes 22','Gerencia',5000);
 insert into empleados values('24444444','Caseres','Carlos','Colon 333','Contabilidad',3000);
 insert into empleados values('32323255','Gonzales','Miguel','Calle 4ta No.90','Contabilidad',8000);
 insert into empleados values('56565555','Suarez','Tomas','Atarazana 78','Cobros',1500); 
*/
/* activando la salida por consola... */
set serveroutput on;

declare
  filas number(2);
begin
  update empleados
  set sueldo := sueldo +500 where sueldo >= 9000;
  if sql%notfount then
    dbms_output.put_line('no hay empleados disponibles...');
  elsif sql%found then
    filas:=sql%rowcount;
    dbms_output.put_line(filas || ': empleados actualizados...');
  end if;
end;

/* dependiendo si se encuentra al empleado se ejecutara el aumento de 500 donde el sueldo sea igual a 9000, y mostrara todas las filas actualizadas... */
