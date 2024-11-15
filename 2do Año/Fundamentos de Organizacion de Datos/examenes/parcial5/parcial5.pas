program parcial5;
type
    empleado = record
        dni:integer;
        nombre:string;
        apellido:string;
        edad:inteegr;
        domicilio:string;
        fecha:string;
    end;

    archEmpleados = File of empleado;

procedure agregarEmpleado(var arch:archEmpleados);
var
    e,cab,act:empleado;
begin
    reset(arch);
    leerEmpleado(e);
    readln(arch,cab);
    if (cab.dni < 0) then begin
        seek(arch, abs(cab.dni));
        readln(arch, cab);
        seek(arch, FilePos(arch)-1);
        writeln(arch,e);
        seek(arch,0);
        writeln(arch,cab);
    end else begin
        Seek(arch, FileSize(arch));
        writeln(arch,e);
    end;    
end;

procedure quitarEmpleado(var arch:archEmpleados);



var
    arch:archEmpleados;
begin
    Assign(arch, 'archivo');
    agregarEmpleado(arch);
end.