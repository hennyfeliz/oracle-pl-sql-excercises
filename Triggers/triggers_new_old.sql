
/* 

  # TRIGGER NEW

 */


/* creando la tabla 'books' */

create table books(
  nombre varchar2(30),
  precio number(10)
);

/* creando trigger */

create or replace trigger first_trigger
before insert
on books
  for each row /* para cada fila... */
    begin
      if(:new.precio<=2300) then
        inser into ofertas values(:new.codigo, :new.precio, user, sysdate);
      end if;
    end first_trigger;



/* ejecutando evento... */

insert into books values('the quijote', 2000);

/* salida: undefine */

insert into books values('the quijote', 1200);

/* salida: insertando a la tabla de 'ofertas'... 

  data:

  1. codigo del libro.
  2. precio del libro.
  3. usuario.
  4. fecha.

  */

/* 

  # TRIGGER OLD

 */

/* trigger con verbo 'old'... 
este trigger controla la actualizacion de los precios dentro de la tabla 'books'...*/

create or replace trigger tr_update_books
before update of precio
on books
  for each row
    begin
      if(:old.precio<=300) and (:new.precio>=300) then
      delete from ofertas where codigo = :old.codigo;
      end if;
        if(:old.precio>=300) and (:new.precio<=300) then
          insert into ofertas values(:new.codigo, :new.precio, user, sysdate);
        end if;
    end tr_update_books;

/* funcioanmiento */

select * from books;

update books set precio = 25 where codigo = 120;

update books set precio = 60 where codigo = 120;

/* salida:
  codigo precio usuario    fecha

  120    25     oracle_us  14-mar-21 15:23:23
  se borra debido a las condicionales...
 */ 
