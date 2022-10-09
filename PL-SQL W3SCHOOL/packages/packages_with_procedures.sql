

/* creando un paquete contenedor de procedures y este procedure (procedimiento almacenado) */

create or replace package paquete_contenedor body empleado_salario as
  procedure nuevo_procedimiento is
    emp_sal empleados.salario%TYPE;
    begin
      select salary into emp_sal from empleados where id = emp_id;
      dbms_output.put_line('salario: ' || emp_sal);
  end nuevo_procedimiento;
end paquete_contenedor;

