program Prac3Ej4y5;
type
    reg_flor = record
        nombre:String[45];
        codigo:integer;
    end;

    tArchFlores = File of reg_flor;

procedure informar(var a:tArchFlores);
var
    act:reg_flor;
begin
    reset(a);
    while not eof(a) do
        begin
            readln(a,act);
            if (act.codigo > 0) then
                writeln(reg.nombre,' ',reg.codigo);
        end;
    close(a);
end;

procedure agregarFlor(var a:tArchFlores; nombre:string; codigo:integer);
var
    cab,nue,aux:reg_flor;
begin
    nue.nombre := nombre;
    nue.codigo := codigo;
    reset(a);
    readln(a,cab);
    if (cab.cod < 0) then
        begin
            seek(a, abs(cab.codigo));
            read(a, aux);
            seek(a, FilePos(a)-1);
            write(a,nue);
            seek(a, 0);
            write(a,aux);
        end
    else
        seek(a, FileSize(a));
        writeln(a,nue);
    close(a);
    informar(a);
end;

procedure eliminarFlor(var a:tArchFlores; flor:reg_flor);
var
    cab,act:reg_flor;
begin
    reset(a);
    read(a,cab); //Leo la cabecera actual
    read(a,act);
    while (not eof(a) and act.codigo <> flor.codigo) do
        read(a,act);
    if (act.codigo = flor.codigo) then
        begin
            seek(a,FilePos(a)-1);
            write(a,cab);
            cab.codigo = (FilePos(a)-1) * -1;
            seek(a,0);
            write(a,cab);
        end
    else
        writeln('No se encontroo una flor con ese codigo')
    close(a);
end;