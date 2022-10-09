/* creando tabla para el caso.. */


create table control_empleados(
  usuario varchar2(20),
  fecha date,
  accion varchar2(20)
);

/* ademas de la tabla 'empleados'... */



create or replace trigger tr_control_empleados
before insert or update or delete
on empleados
  begin
    if inserting then
      inser into control_empleados values(user, sysdate, 'ingreso...');
    end if;
    if deleting then
      inser into control_empleados values(user, sysdate, 'borrando...');
    end if;
    if updating then
      inser into control_empleados values(user, sysdate, 'actualizando...');
    end if;
  end tr_control_empleados;


/* dependiendo del caso que active el trigger se ejecutara un caso que lleva un insert dentro de ella...*/




/* activando trigger con un query */

inser into empleados values(23012, 'gonzalez', 'jose','gerencia',2300);

/* 
  salida:

  usuario         fecha        accion
  curso_oracle    02-feb-23    'ingreso...'

 */

update empleados set sueldo = 2000 where documento = 'comprobed!';

/* 
  salida:

  usuario        fecha      accion
  curso_oracle   05-dec-12  'actualizando...'

 */

