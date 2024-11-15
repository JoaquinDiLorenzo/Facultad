program Prac3Ej6;
const COD_ELIMINADO=-1;
type
    aves = record
        cod:integer;
        especie:string;
        familia:string;
        desc:string;
        zona:string;
    end;

    file_mae = File of aves;

    lista = ^nodoLista;
    nodoLista = record
        elem: string;
        sig:lista;
    end;

procedure agregarAdelante(var l:lista; e:string);
var
    nue:lista;
begin
    new(nue);
    nue^.elem := e;
    if (l=nil) then 
        nue^.sig := nil
    else
        nue^.sig := l;
    l:=nue;
end;

procedure leerEspecies(var l:lista);
var
    e:string;
begin
    readln(e); //Lee la especie a eliminar
    while (e <> 'FIN') do begin
        agregarAdelante(l,e);
        readln(e);
    end;
end;

procedure bajaLogica(var mae:file_mae; l:lista); //Marco con -1 los archivos que hay que eliminar
var
    regM:aves;
begin
    reset(mae);
    while (l<>nil) do begin //Recorro la lista con especies a eliminar
        while not eof(mae) do begin
            read(mae,regM);
            if (regM.especie = l^.elem) then begin
                regM.cod := COD_ELIMINADO;
                seek(mae, FilePos(mae)-1);
                write(mae, regM);
            end;
        end;
        seek(mae,0);
        l := l^.sig;
    end;
    close(mae);
end;

procedure efectivizarBajas(var mae:file_mae);
var
    regM,ult:aves;
    pos:integer;
begin
    reset(mae);
    while not eof(mae) do begin
        read(mae,regM);
        if (regM.cod = -1) then begin //Archivo marcado como eliminado
            pos := FilePos(mae)-1; //Pos Actual
            seek(FileSize(mae)-1);
            read(mae,ult); //Leo ultimo registro
            seek(FilePos(mae)-1);
            truncate(mae); //Elimino el ultimo elemento
            seek(mae,pos); //Voy a la posicion donde me habia quedado
            write(mae,ult); //Agrego el ultimo elemento
        end;
    end;
    close(mae);
end;

var
    mae:file_mae;
    l:lista;
begin
    Assign(mae, 'Maestro');
    l:=nil;
    leerEspecies(l);
    bajaLogica(mae,l);
    efectivizarBajas(mae);
end.