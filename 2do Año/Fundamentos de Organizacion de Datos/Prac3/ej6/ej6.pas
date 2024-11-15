program Prac3Ej6;
type
    prenda = record
        cod_prenda:integer;
        desc:string;
        colores:string;
        tipo_prenda:string;
        stock:integer;
        precio_unitario:integer;
    end;

    file_mae = File of prenda;
    file_det = File of Integer;

procedure bajaLogica(var mae:file_mae; var det:file_det);
var
    regM:prenda;
    regD:integer;
    esta:boolean;
begin
    reset(mae);
    reset(det);
    while not eof(det) do begin
        read(det, regD);
        esta := false;
        while not eof(mae) and not esta do begin
            read(mae, regM);
            if regM.cod_prenda = regD then begin
                regM.stock := regM.stock * -1;
                seek(mae, filepos(mae) - 1);
                write(mae, regM);
                esta := true; 
            end;
        end;
        seek(mae,0);
    end;
    close(mae);
    close(det);
end;

procedure efectivizarBajas(var mae:file_mae;var nue:file_mae);
var
    regM:prenda;
begin
    reset(mae);
    rewrite(nue);
    while not eof(mae) do begin
        read(mae,regM);
        if (regM.cod_prenda > 0) then
            write(nue, regM);
    end;
    close(mae);
    close(nue);
end;

var
    mae,nue:file_mae;
    det:file_det;
begin
    Assign(mae, 'Maestro');
    Assign(nue, 'Nuevo');
    Assign(det, 'Detalle');
    bajaLogica(mae,det);
    efectivizarBajas(mae,nue);
    Erase(mae);
    rename(nue,'Maestro');
end.