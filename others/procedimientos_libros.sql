set serveroutput on;

/* Creando un procedimiento llamado 'aumento_precio', que ejecuta un descuento a una tabla de libros...' */

create or replace procedure aumento_precio
as
  begin
    update libros set precio = precio + (precio * .01); /* el descuento es de .01% */
end aumento_precio;

execute aumento_precio;

