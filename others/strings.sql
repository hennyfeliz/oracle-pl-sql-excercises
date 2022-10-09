set serveroutput on;

declare

	nombre varchar2(20);
	direccion varchar2(30);
	detalles clob;
	eleccion char(1);

begin

	nombre := 'Pedro Perez';
	direccion := 'Calle primera n1';
	detalles := 'Detalle de la variable...
			todavia no ha terminado el detalle';
	eleccion := 'y';

	if eleccion = 'y' then
		dbms_output.put_line(nombre);
		dbms_output.put_line(direccion);
		dbms_output.put_line(detalles);
	end if;
end;