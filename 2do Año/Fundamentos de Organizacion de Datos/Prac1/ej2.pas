program ej2;
type
	archivo_entero = File of integer;
	
procedure iniciarArchivo(var enteros:archivo_entero);
var
	nom:string;
begin
	write('Ingrese el nombre del archivo');
	readln(nom);
	assign(enteros,nom);
	reset(enteros);
end;

procedure procesarArchivo(var enteros:archivo_entero);
var
	nro,cant,tot, menor:integer;
begin
	cant:=0;
	tot:=0;
	menor:=0;
	while (not eof(enteros))do
		begin
			read(enteros,nro);
			writeln(nro);
			cant:= cant + 1;
			tot := tot + nro;
			if (nro < 1500) then
				menor := menor + 1;
		end;
	writeln('Hay ', menor, ' numeros menores a 1500');
	writeln('El promedio de los numeros ingresados es de: ', (tot / cant));
end;
	
var
	enteros: archivo_entero;
begin
	iniciarArchivo(enteros);
	procesarArchivo(enteros);
end.
