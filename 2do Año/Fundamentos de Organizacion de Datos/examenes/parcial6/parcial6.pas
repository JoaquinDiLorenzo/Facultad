program parcial6;
const ValorAlto= 9999;
type
    producto = record
        cod:integer;
        nombre:string;
        precio:integer;
        stock_act:integer;
        stock_min:integer;
    end;

    venta = record
        cod:integer;
        cant:integer;
    end;

    reg_maestro: File of producto;
    reg_detalle:File of venta;

    vec_archivos = array[1..20] of reg_detalle;
    vec_registros = array[1..20] of venta;

procedure minimo(var vec_ar:vec_archivos; var vec_reg:vec_registros;var min:venta);
var
    min,i,pos:integer;
begin
    min:=99999;
    for i=1 to 20 do begin
        if vec_reg[i].cod < min then begin
            pos:= i;
            min := vec_reg[i].cod;
        end;
    end;
    min:= vec_reg[pos];
    leer(vec_ar[pos], vec_reg[pos]);
end;

procedure leer(var arch:reg_detalle; var v:venta;);
begin
    if not eof(arch) then
        readln(arch,v);
    else
        v.cod:= ValorAlto;
end;

var
    i:integer;
    mae:reg_maestro;
    vec_ar:vec_archivos;
    vec_reg:vec_registros;
    min:ventas;
    prod:producto;
    texto:Text;
begin
    for i:=1 to 20 do begin
        Assign(vec_ar[i], 'Archivo '+i);
        reset(vec_ar[i]);
        leer(vec_ar[i], vec_reg[i]);
    end;
    Assign(texto, 'Texto.txt');
    rewrite(teto);
    Assign(mae, 'Maestro');
    reset(mae);

    minimo(vec_ar,vec_reg,min);
    while (min.cod <> ValorAlto) do begin
        readln(mae, prod);
        while (prod.cod <> min.cod) do 
            readln(mae,prod);
        cant:=0;
        while (prod.cod = min.cod) do begin
            cant := cant + min.cant;
            prod.stock_act := prod.stock_act - min.cant;
            minimo(vec_ar,vec_reg,min);
        end;

        if (cant * prod.precio > 10000) then
            with prod do writeln(texto, cod,nombre,precio,stock_act,stock_min);

        seek(arch, FilePos(arch)-1);
        writeln(mae, prod);

    end;

    close(texto);
    close(mae);
    for i:=1 to 20 do
        close(vec_ar[i]);

end.