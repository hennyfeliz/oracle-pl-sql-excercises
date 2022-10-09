/* insercion de datos... */

drop table productos;

create table productos (
codigo int not null primery key,
nombre varchar2(100) not null,
precio number(6,2) not null,
codigo_fabricante int not null);

insert into productos values(1, 'Disco duro SATA· 1TB', 86.99, 5);
insert into productos values(2 , 'Memoria RAM DDR4 8GB', 120, 6);
insert into productos values(3, 'DISCO SSD 1 TB', 150.99, 4);
insert into productos values(4, 'GEFORCE GTX 1050Ti', 185, 7);
insert into productos values(5, 'GEFORCE GTX 1080TI', 755, 6);
insert into productos values(6, 'Monitor 24 LED Full HD', 202, 1);
insert into productos values(7, 'Monitor 27 LED Full HD', 245.99, 1);
insert into productos values(8, 'Portátil Yoga 520', 559, 2);
insert into productos values(9, 'Portátil Ideapd 320', 444, 2);
insert into productos values(10, 'Impresora HP Deskjet 3720', 59.99, 3);
insert into productos values(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);



/* inicio de ejercicio... */

set serveroutput on;

declare
  reg_productos product%rowtype;
begin
  select * into reg_productos from productos
  where codigo = 3;
  dbms_output.put_line('caract del producto...');
  dbms_output.put_line('codigo producto: '||reg.productos.codigo);
  dbms_output.put_line('articulo: '||reg_productos.nombre);
  dbms_output.put_line('precio: '||reg_productos.precio);
  dbms_output.put_line('serial: '||reg_productos.codigo_fabricante);
end;


/* otro ejemplo: copiando el registro de estudiantes...*/

set serveroutput on;

declare
  reg_estudiantes estudiantes%rowtype;
begin
  select * into reg_estudiantes from estudiantes where seccion_clase = 'clase a'
  dbms_out.put_line('nombre: '||reg_estudiantes.nombre);
  dbms_out.put_line('apellido: '||reg_estudiantes.apellido);
  dbms_out.put_line('numero: '||reg_estudiantes.numero);
  dbms_out.put_line('seccion: '||reg_estudiantes.seccion);

end;


