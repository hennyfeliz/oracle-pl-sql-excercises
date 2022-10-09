/* TRANSACCIONES. */
drop table clientes;

create table clientes(
  id_cliente int not null,
  nombre varchar2(30),
  edad numeric(2),
  direccion varchar(60),
  salario number(6,2)
);

--SOLO HACER ESTOS INSERTS PRIMERO
insert into clientes values (1,'Ramon Rodriguez',32,'Calle primera numero 001',2000.00); 
insert into clientes values (2,'Jose Tomas',25,'Calle segunda numero 002',1500.00); 
insert into clientes values (3,'Ana Jimenez',23,'Calle tercera numero 003',2000.00); 
insert into clientes values (4,'Emilio Contreras',25,'Calle cuarta numero 004',6500.00); 
insert into clientes values (6,'Pedro Sandoval',22,'Calle quinta numero 005',4500.00); 


/* CUERPO */

select * from clientes;

/* ROLLBACK */
rollback;/* salida: rollback complete (vuelve la tabla al momento de su creacion...) */

/* COMMIT */
commit;/* salida: 'commit complete' */


--INSERTS 2
insert into  clientes values (7,'Esther Sanchez',27,'Calle sexta numero 006',5500.00 ); 
insert into  clientes values (8,'Antonio Peralta',21,'Calle septima numero 007',4500.00 ); 

/* guardando datos para futuros 'rollbacks' */
savepoint punto1;

update clientes set salario = salario + 100;

/* al hacer commit despues de un savepoint, este queda deshabilitado */
commit;

/* volviendo los datos a antes del update del aumento de salario (al savepoint punto1) */
rollback punto1;


