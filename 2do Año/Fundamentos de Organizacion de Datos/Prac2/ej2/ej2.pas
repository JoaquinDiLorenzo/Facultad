program ej2;
const
    valorAlto=9999;
type
    alumno = record
        cod:integer;
        apellido:string[25];
        nombre:string[25];
        cantCursadas:integer;
        cantFinal:integer;
    end;

    materia = record
        cod:integer;
        aprobo: string; // cursada o final
    end;

    maestro = File of alumno;
    detalle = File of materia;

procedure leer(var det:detalle; var mat:materia);
begin
    if not eof(det) then
        read(det,mat)
    else
        mat.cod := valorAlto;
end;

procedure actualizar(var mae:maestro; var det:detalle);
var
    mat:materia;
    alu:alumno;
begin
    reset(mae);
    reset(det);
    leer(det,mat); //Leo la materia del detalle
    while (mat.cod <> valorAlto) do
        begin
            read(mae,alu);
            while (mat.cod <> alu.cod) do //Busco el alumno que corresponda con la materia
                read(mae,alu);
            while (mat.cod = alu.cod) do
                begin
                    if (mat.aprobo = 'final') then //Realizo el inciso i e ii del punto a
                        begin
                            alu.cantFinal := alu.cantFinal + 1;
                            alu.cantCursadas := alu.cantCursadas - 1;
                        end
                    else
                        alu.cantCursadas := alu.cantCursadas + 1;
                    leer(det,mat); //Leo la proxima materia del archivo
                end;
            Seek(mae, filePos(mae)-1); //Retrocedo uno en el indice del archivo maestro para sobreescribir
            write(mae, alu); //Sobreescribo
        end;
    close(det);
    close(mae);
end;


procedure listar(var mae:maestro);
var
    texto: Text;
    alu:alumno;
begin
    Assign(texto, 'Listado.txt');
    rewrite(texto);
    reset(mae);
    while not eof(mae) do
        begin
            read(mae,alu);
            if (alu.cantFinal > alu.cantCursadas) then
                writeln(texto, alu.cod, ' ', alu.apellido, ' ', alu.nombre, ' ', alu.cantCursadas, ' ', alu.cantFinal);
        end;
    close(mae);
end;

var
    mae:maestro;
    det:detalle;
    opc:integer;
begin
    Assign(mae, 'Maestro');
    Assign(det, 'Detalle');
    repeat
        writeln('1. Actualizar');
        writeln('2. Listar alumnos mas finales que cursadas');
        writeln('3. Salir');
        readln(opc);
        case opc of
          1: actualizar(mae,det);
          2: listar(mae);
        end;
    until (opc = 3);
end.