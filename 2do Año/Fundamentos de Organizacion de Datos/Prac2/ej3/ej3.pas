program ej3;
const
    valorAlto=999;
type
    productos = record
        cod:integer;
        nombre:string;
        precio:integer;
        stockA:integer;
        stockM:integer;
    end;

    venta = record
        cod:integer;
        cant:integer;
    end;

    maestro = File of productos;
    detalle = File of venta;

procedure leer(var det:detalle; var ven:venta);
begin
    if not eof(det) then
        read(det,ven)
    else
        ven.cod := valorAlto;
end;

procedure actualizar(var mae:maestro; var det:detalle);
var
    prod:producto;
    ven:venta;
begin
    reset(mae);
    reset(det);
    leer(det,ven);
    while (ven.cod <> valorAlto) do
        begin
            read(mae,prod);
            while (ven.cod <> prod.cod) do
                read(mae,prod);
            while (ven.cod = prod.cod) do
                begin
                    prod.stockA := prod.stockA - ven.cant;
                    leer(det,ven);
                end;
            Seek(mae, filePos(mae)-1);
            write(mae,prod);
        end;
    close(mae);
    close(det);
end;

procedure listar(var mae:maestro);
var
    texto:Text;
    prod:producto;
begin
    reset(mae);
    assign(texto, 'stock_minimo.txt');
    rewrite(texto);
    while not eof(mae) do
        begin
            read(mae, prod)
            if (prod.stockA < prod.stockM) then
                writeln(texto, prod.nombre);
        end;
    close(texto);
    close(mae);
end;

var
    mae:maestro;
    det:detalle;
begin
    assign(mae, 'Maestro');
    assign(det, 'Detalle');
    repeat
        writeln('1. Actualizar');
        writeln('2. Listar');
        writeln('3. Salir');
        readln(opc);
        case opc of
          1: actualizar(mae,det);
          2: listar(mae);
        end;
    until (opc = 3);
end.