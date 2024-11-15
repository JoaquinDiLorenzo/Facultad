program ej6;
const
    valorAlto = 9999;
type
    info = record
        cod:integer;
        fecha:integer;
        tiempo:integer;
    end;

    usuario = record
        cod:integer;
        tiempo_total:integer;
    end;

    maestro = File of usuario;
    detalle = File of info;

    detalle_vec = array[1..5] of detalle;
    info_vec = array[1..5] of info;

procedure leer(var det:detalle; var inf:info);
begin
    if not eof(det) then
        read(det,inf)
    else
        inf.cod := valorAlto;
end;

procedure minimo(var regD:info_vec; var min:info; var det:detalle_vec);
var
    i,pos,minimo:integer;
begin
    minimo:= 99999;
    for i:=1 to 5 do
        if (regD[i].cod < minimo) then
            begin
                minimo := regD[i].cod;
                pos := i;
            end;
    min := regD[pos];
    leer(det[pos], regD[pos]);
end;
var
    mae:maestro;
    usu:usuario;
    det:detalle_vec;
    regD:info_vec;
    min:info;
    i:integer;
    
begin
    assign(mae,'/var/log/maestro');
    rewrite(mae);
    for i:=1 to 5 do
        begin
            assign(det[i],'detalle'+i);
            reset(det[i]);
            leer(det[i], regD[i]);
        end;
    minimo(regD,min,det);
    while (min.cod <> valorAlto) do
        begin
            usu.cod := min.cod;
            usu.tiempo_total := 0;
            while (min.cod = usu.cod) do
                begin
                    usu.tiempo_total := usu.tiempo_total + min.tiempo;
                    minimo(regD,min,det);
                end;
            writeln(mae,usu.cod,usu.tiempo_total);
        end;
    close(mae);
    for i:=1 to 5 do
        close(det[i]);
end.