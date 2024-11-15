program ej1;
type
	archivo_entero = File of integer;

procedure crearArchivos(var enteros:archivo_entero);
var
	nombre:string;
begin
	write('Ingrese el nombre del archivo: ');
	readln(nombre);
	assign(enteros,nombre);
	rewrite(enteros);
end;

procedure cargarDatos(var enteros:archivo_entero);
var
	nro:integer;
begin
	write('Ingrese un nro: ');
	readln(nro);
	while (nro<>30000) do
		begin
			write(enteros,nro);
			write('Ingrese un nro: ');
			readln(nro);
		end;
	close(enteros);
end;
	
var
	enteros: archivo_entero;
begin
	crearArchivos(enteros);
	cargarDatos(enteros);
end.
