/* Variables dentro de los procedimientos almacenados... */

/* Creando tabla para libros */
create table tabla1(
  titulo varchar(40);
  precio number(6,2);
);

/* Viendo los registros de la tabla de libros... */
select * from table1;


/* creando el procedimiento... */
create or replace procedure autor_libro(autor_titulo in varchar2)
as
  v_autor varchar2(20); /* variable dentro del procedimiento... */
  begin
    select autor into v_autor from libros where titulo = autor_titulo;
    insert into tabla1
    select titulo, precio from libros where autor = v_autor;
  end autor_libro;



execute autor_libro('el quijote');

/* 

  Contexto: inserta a una tabla dependiendo si el nombre existe en otra tabla...

 */

