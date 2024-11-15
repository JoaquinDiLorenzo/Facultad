program Prac3Ej1;
type
	empleado = record
		nro:integer;
		apellido: string;
		nombre: string;
		edad:integer;
		dni:integer;
	end;
	
	archivo = File of empleado;

procedure eliminarEmpleado(var arch:archivo; num:integer);
var
    ult,act:empleado;
begin
    reset(arch);
    Seek(arch, FileSize(arch)-1);
    readln(arch,ult);
    Seek(arch,0);
    readln(arch,act);
    while not eof(arch) and (act.num <> num) do 
        readln(arch,act);
    if (act.num = num) then begin
        Seek(arch, FilePos(arch)-1);
        writeln(arch,act);
        Seek(arch, FileSize(arch)-1);
        truncate(arch);
    end;
    
end;

var
    arch: archivo;
    num:integer;
begin
    Assign(arch, 'Archivo');
    writeln('Ingrese un nro de empleado a borrar:');
    readln(num);
    eliminarEmpleado(arch,num);
end.