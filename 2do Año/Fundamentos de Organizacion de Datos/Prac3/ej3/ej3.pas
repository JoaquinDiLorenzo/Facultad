program Prac3Ej3;
type
    novela = record
        cod:integer;
        genero:string;
        nombre:string;
        duracion:integer;
        director:string;
        precio:integer;
    end;

    archivoN = File of novela;

procedure leerNovela(var n: novela);
begin
    writeln('Ingrese codigo de la novela');
    readln(n.cod);
    if(n.cod <> -1) then
        begin
            writeln('Ingrese el genero de la novela');
            readln(n.genero);
            writeln('Ingrese el nombre de la novela');
            readln(n.nombre);
            writeln('Ingrese la duracion de la novela');
            readln(n.duracion);
            writeln('Ingrese el director de la novela');
            readln(n.director);
            writeln('Ingrese el precio de la novela');
            readln(n.precio);
        end;
end;

procedure crearArchivo(var arch:archivoN);
var
    n:novela;
begin
    rewrite(arch);
    n.cod:=0; n.genero:=''; n.nombre:=''; n.duracion:=0; n.director:=''; n.precio:=0;
    writeln(arch,n);
    leerNovela(n);
    while (n.cod <> -1) do
        begin
            writeln(arch,n);
            leerNovela(n);
        end;
    close(arch);
end;

procedure alta(var arch:archivoN);
var
    nuevo,i, elim:novela;
begin
    reset(arch);
    leerNovela(nuevo);
    readln(arch,i);
    if (i.cod < 0) then
        begin
          seek(arch, abs(i.cod)); //Abs saca valor absoluto
          readln(arch,elim);
          seek(arch, FilePos(arch)-1);
          writeln(arch, nuevo);
          seek(arch,0);
          writeln(arch,elim);  
        end
    else
        begin
            seek(arch,fileSize(arch));
            write(arch,nuevo);
        end;
    close(arch);
end;

procedure baja(var arch:archivoN);
var
    cod:integer;
    act,cab:novela;
begin
    reset(arch);
    write('Ingrese un cod a eliminar: ');
    readln(cod);
    readln(arch,cab);
    readln(arch,act);
    while (not eof(arch) and act.cod <> cod) do
        readln(arch,act);
    if (act.cod = cod) then
        begin
            seek(arch, FilePos(arch)-1);
            write(arch,cab); //Escribo la cabecera
            cab.cod := (FilePos(arch)-1) * -1;
            seek(arch,0);
            writeln(arch,cab);
        end
    else
        writeln('No se encontro la novela con ese codigo')
    close(arch);
end;

var
    archN:archivoN;
    opcion:integer;
begin
    Assign(archN, 'Archivo novelas');
    repeat
        writeln('MENU DE OPCIONES');
        writeln('Opcion 1: Crear el archivo');
        writeln('Opcion 2: Dar de alta una novela');
        writeln('Opcion 3: Modificar los datos de una novela');
        writeln('Opcion 4: Eliminar una novela');
        writeln('Opcion 5: Listar en un archivo de texto todas las novelas, incluyendo las borradas');
        writeln('Opcion 6: Imprimir archivo');
        writeln('Opcion 7: Salir del menu');
        readln(opcion);
        case opcion of
            1: crearArchivo(archN);
            2: alta(archN);
            3: modificarNovela(archN);
            4: baja(archN);
            5: pasarTxt(archN);
            6: imprimirArchivo(archN);
        else
            writeln('Opcion invalida');
        end;
    until (opcion <> 7)
end;