program ej5;
const
    valorAlto=999;
type
    producto = record
        cod:integer;
        nombre:string;
        desc:string;
        stockD:integer;
        stockM:integer;
        precio:integer;
    end;

    venta = record
        cod:integer;
        cant:integer;
    end;

    maestro = File of producto;
    detalle = File of venta;

    detalle_vec = array[1..30] of detalle;
    venta_vec = array[1..30] of venta;

procedure leer(var det:detalle; var ven:venta);
begin
    if not eof(det) then
        readln(det,ven)
    else
        ven.cod := valorAlto;
end;

procedure minimo(var regD:venta_vec; var min:venta; var det:detalle_vec);
var
    i,pos,minimo:integer;
begin
    minimo := 99999;
    for i:=1 to 30 do
        begin
            if (regD[i].cod < minimo) then
                begin
                    minimo := regD[i].cod;
                    pos := i;
                end;
        end;
    min := regD[pos];
    leer(det[pos], regD[pos]);
end;


var
    mae:maestro;
    prod:producto;
    det:detalle_vec;
    regD:venta_vec;
    i:integer;
    min:venta;
begin
    for i:=1 to 30 do
        begin
            assign(det[1], 'detalle'+i);
            reset(det[i]);
            leer(det[i], regD[i]);
        end;
    assign(mae,'maestro');
    reset(mae);
    minimo(regD,min,det);
    while (min.cod <> valorAlto) do
        begin
            read(mae,prod);
            while (min.cod <> prod.cod) do
                read(mae,prod);
            while (min.cod = prod.cod) do
                begin
                    prod.stockD := prod.stockD - min.cant;
                    minimo(regD,min,det);
                end;
            seek(mae, filePos(mae)-1);
            write(mae,prod);
        end;
    close(mae);
    for i:=1 to 30 do
        close(det[i]);
end.