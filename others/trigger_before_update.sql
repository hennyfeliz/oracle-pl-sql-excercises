



/* creando trigger que cuando se haga alguna actualizacion dentro de la tabla 'alumnos' se guardara el usuario y la fecha del usuario que la hizo... */

create or replace trigger updating_event
before update
on alumnos
  for each row
    begin
      insert into control values(user, sysdate);

    end updating_event;


execute updating_event;

/* ejecutando actualizacion para activar trigger... */

update alumnos set note = note + note * 0.1 where seccion = 'clase a';
/* aumentar nota al estudiante donde la seccion sea la 'clase a'... */

/* salida:
  usuario       date
  curso_plsql   02-jun-2022


  si ajustamos la salida de la fecha:

  data
  02-jun-2022 15:23:34 (hora)...

 */