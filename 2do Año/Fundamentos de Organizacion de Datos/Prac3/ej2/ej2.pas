program Prac3Ej2;
type
    asistente = record
        nro:integer;
        apellido:string;
        nombre:string;
        mail:string;
        tel:integer;
        dni:integer;
    end;

    archivo = File of asistente;

procedure leerAsistente(var a:asitente);
begin
    writeln('Ingrese un numero del asistente');
    readln(a.nro);
    if(a.nro <> -1) then
        begin
            writeln('Ingrese el apellido del asistente');
            readln(a.apellido);
            writeln('Ingrese el nombre del asistente');
            readln(a.nombre);
            writeln('Ingrese el email del asistente');
            readln(a.mail);
            writeln('Ingrese el telefono del asistente');
            readln(a.tel);
            writeln('Ingrese el dni del asistente');
            readln(a.dni);
        end;
end;



procedure llenarArchivo(var arch:archivo);
var
    as:asistente;
begin
    rewrite(arch);
    leerAsistente(as);
    while (as.nro <> -1) do
        begin
            writeln(arch,as)
            leerAsistente(as);
        end;
    close(arch);
end;

procedure bajaLogica(var arch:archivo);
var
    a:asistente;
begin
    reset(arch);
    while not eof(arch) do
        begin
            readln(arch,a);
            if (a.nro < 1000) then
                begin
                    a.nombre := '@' + a.nombre;
                    seek(arch, FilePos(arch)-1);
                    writeln(arch, a);
                end;
        end;
    close(arch);
end;

var
    arch:archivo;
begin
    Assign(arch, 'Asistentes');
    llenarArchivo(arch);
    bajaLogica(arch);
end.