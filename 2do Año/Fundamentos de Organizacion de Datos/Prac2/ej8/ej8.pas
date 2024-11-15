program ej8;
const
    valorAlto = 999;
type

    ventas = record
        cod:integer;
        nombre:string;
        apellido:string;
        año:integer;
        mes:integer;
        dia:integer;
        monto: integer;
    end;

    maestro = File of ventas;

procedure leer(var mae:maestro; var ven:ventas);
begin
    if not eof(mae) then
        read(mae,ven)
    else
        ven.cod := valorAlto;
end;

var
    mae:maestro;
    tot_ventas_empresa:integer;
begin
    assign(mae,'maestro');
    reset(mae);

    leer(mae,ven);
    tot_ventas_empresa := 0;
    while (ven.cod <> valorAlto) do 
        begin
            writeln('Nombre: ', ven.nombre, 'Apellido: ', ven.apellido);
            cod_act := ven.cod;
            while (cod_act = ven.cod) do
                begin
                    año_act := ven.año;
                    tot_año := 0;
                    while (cod_act = ven.cod) and (año_act = ven.año) do
                        begin
                            mes_act := ven.mes;
                            tot_mes := 0;
                            while (cod_act = ven.cod) and (año_act = ven.año) and (mes_act = ven.mes) do
                                begin
                                    tot_mes := tot_mes + ven.monto;
                                    leer(mae,ven);
                                end;
                            writeln('Mes: ', mes_act, ': ', tot_dia);
                            tot_año:= tot_año + tot_mes;
                        end;
                    writeln('Año: ', año_act, ': ' tot_año);
                    tot_ventas_empresa := tot_ventas_empresa + tot_año;
                end;    
        end;
    writeln('Total ventas empresa: ', tot_ventas_empresa);
end.
