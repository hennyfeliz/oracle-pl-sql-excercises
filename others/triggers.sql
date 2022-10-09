/* borrando bases de datos pasadas */

drop table libros;
drop table control;

/* creando bases de datos nuevas */

create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar(20),
  precio number(6, 2)
);

create table control(
  usuario varchar(30),
  fecha date
);

/* triggers */

/* al momento en el que se haga un 'insert' en la tabla 'libros' comenzara el evento del trigger, esto desencadenara 'insert' a la tabla 'control' para ingresar el 'user' y el 'sysdate'... */

create or replace trigger tr_ingreso_libros
before insert
on libros
  begin
    insert into control values(user, sysdate);

  end tr_ingreso_libros;

/* examples... */

insert into libros values(100, 'uno','richard milley','planeta',24);

insert into libros values(230, 'dos','el alfa', '¿why are you gay?', 20);

/* #FORMATO HORA: CONFIGURACION...
  PREFERENCIAS -> BASE DE DATOS -> NLS -> FORMATO FECHA: FROM: 'DD-MON-RR' TO: 'DD-MON-RR, HH24:MI:SS'... nice!.

  FROM 09-ENE-21
  TO 09-ENE-21 17:23:20
 */

/* estos inserts activaran el trigger y se insertaran datos dentro de la tabla 'control' a la vez... */


/* busca los triggers de esta tabla... */
select * from user_triggers where triggers_name = 'tr_ingreso_libros';

