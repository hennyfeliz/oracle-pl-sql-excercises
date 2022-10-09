/* Busca todos los procedimientos */
select * from user_objects where object_type = 'PROCEDURE';

/* Busca los procedimientos de una manera personalizada... */
select * from user_procedures where object_name like '%saludo%';

/* Borrar procedimiento... */
drop procedure saludo;