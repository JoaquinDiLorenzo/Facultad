program ej1;
const
    cod_alto = 999;
type   
    ingresos = record  
        cod:integer;
        nombre: string;
        monto:real;
    end;

procedure leer(var det:Text; var ing:ingresos);
begin
    if not eof(det) then
        readln(det,ing.cod,ing.monto,ing.nombre)
    else
        ing.cod := cod_alto;
end;

procedure comprimir(var det:Text; var mae:Text);
var
    ing, comp:ingresos;
begin
    reset(det);
    rewrite(mae);
    leer(det, ing);
    while (ing.cod <> cod_alto) do
        begin
            comp := ing;
            comp.monto := 0;
            while (ing.cod = comp.cod) do
                begin
                    comp.monto := comp.monto + ing.monto;
                    leer(det,ing)
                end;
            writeln(mae,comp.cod,' ',comp.monto:0:2,comp.nombre);          
        end;
    close(det);
    close(mae);
end;

var
    det,mae: Text;
begin
    Assign(det, 'detalle.txt');
    Assign(mae, 'maestro.txt');
    comprimir(det,mae)
end.

