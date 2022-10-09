/* VALIDACION DE PAQUETES INVALIDOS... */

create or replace package nuevo_paquete
is
  function nueva_funcion return number;
    procedure nuevo_procedimiento;
    procedure segundo_procedimiento;/* volver a compilar paquete... */
  end;/* compilacion exitosa... */

select * from user_objects where object_name ='nuevo_paquete';/* lanza los paquetes con estas catacteristicas... */

/* BODY DEL PAQUETE [linea 12 - 31]*/
create or replace body nuevo_paquete
is
  function nueva_funcion return number is
    begin
      return 0;
    end;

procedure nuevo_procedimiento
is
  begin
    null;
    end;
/* segundo procedimiento... */
procedire segundo_procedimiento
is
  begin
    null;
    end;
end;/* end de creacion del BODY */
/* nuevo_procedimiento compilado exitosamene!... */

select * from user_objects where object_name ='nuevo_paquete';/* lanza status: 'invalid', ya que al actulizar el HEAD del paquete con un nuevo procedimiento, tambien debemos actilizar el body...

  salida:

  status: invalid.
*/

/* una vez agregado el segundo paquete al BODY y vuelvo a compilar, los status cambiaran a status: 'valid' */



