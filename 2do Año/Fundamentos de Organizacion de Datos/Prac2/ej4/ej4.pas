program ej4;
const 
    valorAlto = 'ZZZ';
type
    provinciaM = record
        nombre:string;
        cantA:integer;
        total:integer;
    end;

    provinciaD = record
        nombre:string;
        codL:integer;
        cantA:integer;
        cantE:integer;
    end;

    maestro = File of provinciaM;
    detalle = File of provinciaD;

procedure leer(var det:detalle; var pD:provinciaD);
begin
    if not eof(det) then
        read(det,pD)
    else
        pD.nombre := valorAlto;
end;

procedure minimo(var det1,det2:detalle; var pD1,pD2,min:provinciaD);
begin
    if(pD1.nombre < pD2.nombre) then
        begin
            min := pD1;
            leer(det1,pD1);
        end
    else
        begin
            min:=pD2;
            leer(det2,pD2);
        end;
end;

procedure actualizar(var mae:maestro; var det1,det2:detalle);
var
    pM:provinciaM;
    pD1,pD2:provinciaD;
begin
    reset(mae); reset(det1); reset(det2);
    leer(det1, pD1); leer(det2, pD1);
    minimo(det1,det2,pD1,pD2,min);
    while (min.nombre <> valorAlto) do
        begin
            read(mae,pM);
            while (min.nombre <> pM.nombre) do
                read(mae,pM);
            while (min.nombre = pM.nombre) do
                begin
                    pM.cantA := pM.cantA + min.cantA;
                    pM.total := pM.total + min.cantE;
                    minimo(det1,det2,pD1,pD2,min);
                end;
            seek(mae, filePos(mae)-1);
            write(mae,pM);
        end;
    close(mae);
    close(det1);
    close(det2);
end;

var
    mae:maestro;
    det1,det2:detalle;
begin
    assign(mae,'Maestro');
    assign(det1,'Detalle1');
    assign(det2,'Detalle2');
    actualizar(mae,det1,det2);
end.