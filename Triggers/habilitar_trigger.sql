/* trigger a deshabilitar... */

create or replace trigger tr_aumento_sueldo
before update of sueldo
ono empleados
for each row
  begin 
    insert into control values(user, sysdate, :old.documento, :old.sueldo, :new.sueldo);
  end tr_aumento_sueldo;



/* viendo tabla de control */
select * from control;
select * from empleados;

/* truncando las tablas... */
truncate table control;
truncate table empleados;

/* viendo todos los triggers... */

select trigger_name, triggering_event, table_name, status from triggers
where table_name = 'empleados';/* EMPLEADOS */

/* salida: todos los trigger con esta condicion... */



/* deshabilitando trigger... */
alter trigger tr_aumento_sueldo disable;

/* NO SE EJECUTARA EL TRIGGER, YA QUE LO DESHABILITAMOS... ASI QUE LOS EVENTOS NO SE EJECUTARAN... */

update empleados set sueldo = 1000 where documento = '23812312';

/* salida del trigger: (nada) */

/* activar trigger nuevamente... */
alter trigger tr_aumento_sueldo enable;

/* despues de volver a activar nuevamente el trigger, volveran a ejecutarse los eventos administrados en el mismo... */


