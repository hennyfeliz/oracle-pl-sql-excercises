/* SELECT & UPDATE DENTRO DE CURSORES... */


set serveroutput on;

declare
  v_empleados empleados%rowtype;
begin
  for v_empleados in(select * from empleados) loop
    dbms_output.put_line(v_empleados.sueldo ||', '||v_empleados.nombre);
  end loop;
end;

select * from empleados;
/* salida:

  mostrara todos los sueldos y nombres de la tabla empleados...

  sueldo  nombre

  12309, roberto
  12349, francisco
  12892, maria
  49213, martha

 */


/* otro cursor... */

begin
  update empleados set sueldo = 20000
  where documento = '293812312';
  if sql%notfound then
    dbms_output.put_line('no existe registro a modificar...');
  end if;
end;

/* salida:

  si encuentra algun empleado con el 'documento' igual a '293812312', modificara el sueldo a 20000...

  sino encuentra ningun empleado con ese docuemento, dira: 'no existe registro a modificar...'.

 */
  

