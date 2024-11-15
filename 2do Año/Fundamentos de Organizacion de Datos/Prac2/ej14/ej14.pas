program ej14; //No se si está bien
const
    valorAlto = 9999;
type
    provincia = record
        cod_pvcia:integer;
        nombre_pvcia:string;
        cod_localidad:integer;
        nom_localidad:string;
        luz:integer;
        agua:integer;
        gas:integer;
        chapa:integer;
        sanitarios:integer;
    end;

    avances = record
        cod_pvcia:integer;
        cod_localidad:integer;
        luz:integer;
        agua:integer;
        gas:integer;
        construidas:integer;
        sanitarios:integer;
    end;

    maestro = File of provincia;
    vec_detalle = array[1..10] of File of avances;
    reg_detalle = array[1..10] of avances;

procedure leer(var det:File of avances; var a:avances);
begin
    if not eof(det) then
        read(det,a)
    else
        a.cod_pvcia:= valorAlto;
end;

procedure minimo(var vec_det:vec_detalle; var reg_det:reg_detalle; var min:avances);
var
    minimoProv,minimoLoc,i,pos:integer;
begin
    minimoProv:= 99999;
    minimoLoc := 99999;
    for i:=1 to 10 do begin
        if (reg_det[i].cod_pvcia < minimoProv) and (reg_det[i].cod_localidad < minimoLoc) then begin
            minimoProv := reg_det[i].cod_pvcia;
            minimoLoc:= reg_det[i].cod_localidad;
            pos := i;
        end;
    end;
    min := reg_det[pos];
    leer(vec_det[pos],reg_det[pos]);
end;

var
    mae:maestro;
    vec_det:vec_detalle;
    reg_det: reg_detalle;
    i:integer;
    prov:provincia;
    min:avances;
    cant:integer;
begin
    assign(mae, 'maestro');
    reset(mae);
    for i:= 1 to 10 do begin
        assign(vec_det[i],'detalle'+IntToStr(i));
        reset(vec_det[i]);
        leer(vec_det[i], reg_det[i]);
    end;
    cant:=0;
    minimo(vec_det,reg_det,min);
    while (min.cod_pvcia <> valorAlto) do begin
        read(mae,prov);
        while (prov.cod_pvcia <> min.cod_pvcia) or (prov.cod_localidad <> min.cod_localidad) do begin
            read(mae,prov);
        end;
        if (prov.cod_pvcia <> min.cod_pvcia) or (prov.cod_localidad <> min.cod_localidad) then begin
            prov.luz := prov.luz - min.luz;
            prov.agua := prov.agua - min.agua;
            prov.gas := prov.gas - min.gas;
            prov.sanitarios := prov.sanitarios - min.sanitarios;
            prov.chapa := prov.chapa - min.construidas;
            seek(mae, filepos(mae)-1);
            write(mae,prov);
            minimo(vec_det,reg_det,min);
        end;
    end;

end.