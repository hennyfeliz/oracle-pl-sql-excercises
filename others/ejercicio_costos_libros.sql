create or replace book_cost(value number)
return varchar
is
  cost varchar(20);
  begin
    cost:='';

    if value <= 400 then
      cost:='cheap';
    else
      cost:='expensive';
    end if;

    return cost;
  end;


select titulo, autor, precio, book_cost(precio) from libros;


/* 

  salida:

  esto vera si el libro de cada registro es mayor a 400, y agregara una columna con el nombre 'book_cost' donde dependiendo del costo dira 'cheap' si es menor de 400.
  'expensice' si es mayor de 400...

  titulo        autor     precio  book_cost

  'first book'  'autor1'  300     'cheap'
  'second book' 'autor2'  600     'expensive'
  'third book'  'autor3'  450     'expensive'

 */