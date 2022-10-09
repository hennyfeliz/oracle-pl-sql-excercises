/* Select de tabla de empleados */
/* select * from empleados; */


/* Creando procedimiento para aumento de sueldo para empleados... */

create or replace procedure auemento_sueldo(anio in number, porcentaje in number)
as
  begin
    update empleados set sueldo = sueldo + (sueldo * porcentaje / 100) where (extract(year from current_date) -extract(year from fecha_ingreso))>anio;
  end;


execute auemento_sueldo(10, 20); /* 10 años y 20% de porcentaje como valores de entrada... */

select * from empleados;

/* a los empleados con mas de 10 años en la empresa se le agregara un aumento de sueldo del 20%... */
