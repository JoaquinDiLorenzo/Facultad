program ej3;
type
	empleado = record
		nro:integer;
		apellido: string;
		nombre: string;
		edad:integer;
		dni:integer;
	end;
	
	archivo = File of empleado;
	
procedure leerEmpleado(var e:empleado);
begin
	writeln('----- NUEVO EMPLEADO -----');
	write('Apellido: ');
	readln(e.apellido);
	if (e.apellido <> 'fin') then
		begin
			write('Nombre: ');
			readln(e.nombre);
			write('Nro Empleado: ');
			readln(e.nro);
			write('Edad: ');
			readln(e.edad);
			write('Dni:: ');
			readln(e.dni);
		end;
end;

procedure crearArchivo(var arch:archivo);
var
	e:empleado;
begin
	rewrite(arch); //Nuevo archivo
	leerEmpleado(e);
	while (e.apellido <> 'fin') do
		begin
			write(arch,e);
			leerEmpleado(e);
		end;
	close(arch);
end;

procedure imprimir(e:empleado);
begin
	writeln('Nro: ',e.nro, ' Nombre: ', e.nombre, ' Apellido: ', e.apellido, ' Edad: ', e.edad, ' DNI: ', e.dni);
end;

procedure listarCriterio(var arch:archivo);
var
	e:empleado;
	igual:string;
begin
	reset(arch);
	write('Ingrese un nombre/apellido: ');
	readln(igual);
	while (not eof(arch)) do
		begin
			read(arch,e);
			if ((e.nombre = igual) or (e.apellido = igual)) then
				imprimir(e);
		end;
	close(arch);
end;

procedure listarTodo(var arch:archivo);
var
	e:empleado;
begin
	reset(arch);
	while (not eof(arch)) do
		begin
			read(arch,e);
			imprimir(e);
		end;
	close(arch);
end;

procedure listarMayores(var arch:archivo);
var
	e:empleado;
begin
	reset(arch);
	while (not eof(arch)) do
		begin
			read(arch,e);
			if (e.edad > 70) then
				imprimir(e);
		end;
	close(arch);
end;

procedure agregarEmpleado(var arch:archivo);
var
	e:empleado;
begin
	reset(arch);
	seek(arch, FileSize(arch)); //Me ubico al final del archivo
	leerEmpleado(e);
	while (e.apellido <> 'fin') do
		begin
			write(arch, e);
			leerEmpleado(e);
		end;
	close(arch);
end;

procedure modificarEdad(var arch:archivo);
var
	e:empleado;
	nro,edad:integer;
	ok:boolean;
begin
	reset(arch);
	write('Ingrese un nro de empleado: (con -1 se termina');
	readln(nro);
	while (nro <> -1) do
		begin
			ok:=true;
			while ((not eof(arch)) and (ok=true)) do
				begin
					read(arch,e);
					if (e.nro = nro) then
						begin
							write('Ingrese la edad para modificar: ');
							readln(edad);
							e.edad := edad;
							seek(arch, FilePos(arch)-1); //Vuevlo a la pos anterior para sobreescribir
							write(arch,e);
							ok:=false; //deja de buscar
						end;
				end;
			seek(arch,0); //Reinicio la pos en el archivo
			write('Ingrese un nro de empleado: (con -1 se termina');
			readln(nro);
		end;
end;

procedure exportarTodo(var arch:archivo);
var
	texto:Text;
	e:empleado;
begin
	reset(arch);
	Assign(texto, 'todos_empleados.txt');
	rewrite(texto);
	while not eof(arch) do
		begin
			read(arch,e);
			with e do
				write(texto, 'Apellido: ', apellido, ' Nombre: ', nombre, ' Nro: ', nro, ' Edad: ',edad, ' DNI: ', dni); 
		end;
	close(arch);
	close(texto);
end;

procedure exportarSolo(var arch:archivo);
var
	texto:Text;
	e:empleado;
begin
	reset(arch);
	Assign(texto, 'faltaDNIEmpleado.txt');
	rewrite(texto);
	while not eof(arch) do
		begin
			read(arch,e);
			if (e.dni <> 00) then
				with e do
					write(texto, 'Apellido: ', apellido, ' Nombre: ', nombre, ' Nro: ', nro, ' Edad: ',edad, ' DNI: ', dni); //Escribo en el archivo de texto
		end;
	close(arch);
	close(texto);
end;

procedure abrirArchivo(var arch:archivo);
var
	num:integer;
begin
	repeat
		writeln('---- Ingrese opcion -----');
		writeln('1: Listar Empleados');
		writeln('2: Listar TODOS los empleados');
		writeln('3: Listar mayores de 70');
		writeln('4: Salir');
		writeln('5: Agregar Empleado');
		writeln('6: Modificar Edad');
		writeln('7: Exportar Todo');
		writeln('8: Exportar DNI 00');
		readln(num);
		case num of
			1: listarCriterio(arch);
			2: listarTodo(arch);
			3: listarMayores(arch);
			5: agregarEmpleado(arch);
			6: modificarEdad(arch);
			7: exportarTodo(arch);
			8: exportarSolo(arch);
		end;
	until (num=4);
end;

var
	arch: archivo;
	num:integer;
	nom:string;
begin
	write('Ingrese un nombre de archivo: ');
	readln(nom);
	assign(arch,nom);
	repeat 
		writeln('---- Ingrese opcion -----');
		writeln('1: crear archivo');
		writeln('2: abrir archivo');
		writeln('3: salir');
		readln(num);
		case num of
			1: crearArchivo(arch);
			2: abrirArchivo(arch);
		end;
	until (num=3);
end.
