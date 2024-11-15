program parcial3;
const ValorAlto = 9999;
type
    ventas = record
        cod_farmaco:integer;
        nombre:string;
        cantidad_vendida:integer;
        forma_pago:string;
    end;

    archVentas = File of ventas;
    vectorDetalle= archVentas;
    vectorRegistro = ventas;

procedure leer(var arch:archVentas; var v:ventas);
begin
    if not eof(arch) then
        readln(arch,v)
    else
        v.cod_farmaco;
end;

procedure minimo(var vR:vectorRegistro; var vD:vectorDetalle; var min:ventas);
var
    i,pos,minimo:integer;
begin
    minimo:=999999;
    for i=1 to 30 do begin
        if (vR[i].cod_farmaco < minimo) then
            pos:=i;
            minimo:=vR[i].cod_farmaco;
    end;
    min:= vR[pos];
    leer(vD[pos],vR[pos]);
end;

procedure moduloA(var vD:vectorDetalle);
var
    i:integer;
    vR:vectorRegistro;
    min:ventas;
    minCant,maxCod,cod_act,cant:integer;
begin
    minCant := -1;
    for i=1 to 30 do begin
        reset(vD[i]);
        leer(vD[i], vR[i]);
    end;
    minimo(vR,vD,min);
    while (min.cod_farmaco <> ValorAlto) do begin
        cod_act := min.cod_farmaco;
        cant := 0;
        while (min.cod_farmaco = cod_act) do begin
            cant := cant + min.cantidad_vendida;
            minimo(vR,vD,min);
        end;

        if (cant > minCant) then begin
            minCant := cant;
            maxCod := cod_act;
        end;

    end;

    writeln('l famraco con mas ventas fue: ', maxCod);

    for i=1 to 30 do begin
        close(vD[i]);
    end;

end;

procedure moduloC(var vD:vectorDetalle);
var
    textFile: Text;
    codAct:integer;
    fechaAct,nombreAct:string;
    tot:integer;
begin
    Assign(textFile, 'Texto');
    rewrite(textFile);
    for i=1 to 30 do begin
        reset(vD[i]);
        leer(vD[i], vR[i]);
    end;
    minimo(vR,vD,min);
    while (min.cod_act <> ValorAlto) do begin
        codAct := min.cod_act;
        fechaAct := min.fecha;
        nombreAct := min.nombre;
        tot:=0
        while (codAct = min.cod_act) and (fechaAct=min.fecha) do begin
            tot := tot + min.cantidad_vendida;
            minimo(vR,vD,min);
        end;
        writeln(textFile, codAct, nombreAct,fechaAct,tot);
    end;    
    for i=1 to 30 do begin
        close(vD[i]);
    end;
 
end;

var
    vD:vectorDetalle;
    i:integer;
begin
    for i=1 to 30 do 
        Assign(vD[i], 'Archivo'+i);
    moduloA(vD);
end.