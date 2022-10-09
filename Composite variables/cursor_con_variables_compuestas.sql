
declare
  cursor cu_productos is
  select * from productos;
  var_productos cu_productos%rowtype;
begin
  open cu_productos;
  loop
    fetch cu_productos into var_productos;
    exit when cu_productos%notfound;
    dbms_output.put_line(var_productos.codigo||' '||var_productos.nombre||' '|| var_productos.precio);
  end loop;
end;


/* salida:

  id    nombre    precio
  
  1     RTX 3080  1000.00
  2     i5-2358   230.00

 */
