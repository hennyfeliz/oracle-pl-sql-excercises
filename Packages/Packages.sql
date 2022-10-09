/* PACKAGE 

  # composicion de un paquete

  public:
    variable
    procedure

  private:
    variable
    procedura B definition
      variable
    begin
    ...
    end;

 */

/* creacion del paquete [especificacion]*/

create or replace package the_products as
procedure caracteristicas(v_codigo productos.codigo%type);
end the_products;

/* salida: 'compilacion completa...' */

/* creacion del paquete [body]*/

create or replace package body the_products as procedure caracteristicas(v_codigo productos.codigo%type) is
  v_producto productos.nombre%type;
  v_precio productos.precio%type;
begin
  select nombre, precio into v_producto, v_precio from productos where codigo = v_codigo;
  dbms_output.put_line('articulo: '||v_producto);
  dbms_output.put_line('precio: '||v_precio);
  end caracteristicas;
end;

/* paquete compilado!... */

/* seccion de ejecucion... */

begin
  the_products.caracteristicas(3)
  end;

/* salida: 

  articulo      precio

  disco duro    230.00 (articulo con id_codigo = 3);

 */

/* OBJETO DENTRO DE 'PACKAGES' */

create or replace package the_products as
  procedure caracteristicas(v_codigo productos.codigo%type);
    function f_precio(v_codigo int)
  return number;

end the_products;

/* CONFIGURACION 'F_PRECIO' */
create or replace body the_products as procedure caracteristicas(v_codigo productos.codigo%type) is
  v_producto productos.nombre%type;
  v_precio productos.precio%type;
begin
  select nombre, precio into v_producto,v_precio from productos where codigo = v_codigo;
  dbms_output.put_line('articulo: '||v_producto);
  dbms_output.put_line('precio: '||v_precio);
  end caracteristicas;

  --------------------------------------

  function f_precio(v_codigo int)
  return number
    as
      v_precio number;
      begin
        select precio into v_precio from productos where codigo = v_codigo;
        return v_precio;
        end f_precio;
  end the_products;

/* *click on 'compile' button...* */


/* imprimiendo datos de la funcion dentro del paquete... */
select the_products.f_precio(4) as Precio from dual;

/* salida: 

  precio

  293.00 (codigo -> 4);

 */
