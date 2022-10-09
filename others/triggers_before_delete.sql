

/* trabajando con la tabla de alumnos... */
select * from alumnos;
select * from control;

/* limpiar tablas */
truncate table alumnos;


/* creacion del trigger... */
create or replace trigger borrando_alumnos
before delete
on alumnos
  for each row
    begin
      insert into control values(user, sysdate);

    end borrando_alumnos;

/* ejecutando trigger haciendo un delete en la tabla 'alumnos'*/

delete from alumnos where curso = 5;/* borrando alumno donde el curso sea igual a 5 */


/* esto envia el usuario y la fecha que hizo este borrado a la tabla 'control' */


