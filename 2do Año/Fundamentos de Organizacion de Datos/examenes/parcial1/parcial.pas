program parcial;
const ValorAlto = 99999;
type
    reg = record
        año:integer;
        mes:integer;
        dia:integer;
        idUsuario:integer;
        tiempo:integer;
    end;

    archivo = File of reg;

procedure leer(var arch:archivo; var usuario:reg);
begin
    if not eof(arch) then
        readln(arch,usuario)
    else
        usuario.año := ValorAlto;
end;

function buscarAño(var arch:archivo;año:integer):integer;
var
    pos:integer;
    u:reg;
begin
    pos:=-1;
    leer(arch, u);
    while (u.año <> ValorAlto) and (u.año <> año) do
        leer(arch,u)
    if (u.año = año) then
        pos := FilePos(arch) - 1;
    buscarAño :=  pos;
end;


var
    arch:archivo;
    u:reg;
begin
    assign(arch, 'archivo');
    reset(arch);
    writeln('Ingrese que año desde buscar');
    readln(año);
    pos := buscarAño(arch,año);
    if (pos > -1) then begin
        seek(arch,pos);
        leer(arch,u);
        write('Año', año);
        tot := 0;
        while (u.año = año) do begin 
            writeln('Mes: ', u.mes);
            mes := u.mes;
            cantMes := 0;
            while (u.año = año) and (u.mes = mes) do begin
                writeln('Dia: ',u.dia);
                dia := u.dia;
                cantDia := 0;
                while (u.año = año) and (u.mes = mes) and (u.dia = dia) do begin
                    id = u.idUsuario;
                    cantId := 0;
                    while (u.año = año) and (u.mes = mes) and (u.dia = dia) and (u.idUsuario = id) do begin
                        cantId := cantId + u.tiempo;
                        leer(arch,u);
                    end;
                    writeln('idUsuario ', id, ' Tiempo total de acceso en el dia ', dia, 'mes ', mes ' es de ', cantId);
                    cantDia := cantDia + cantId;
                end;
                writeln('Tiempo total de acceso dia '. dia, ' mes ',mes, 'es de ' cantDia);
                cantMes := cantMes + cantDia;
            end;
            writeln('Total tiempo de acceso mes ', mes, 'es de ', cantMes);
            tot := tot + cantMes;
        end;
        writeln('Total tiempo de acceso año ', año, ' es: ', tot);
    end else
        writeln('Año no encontrado')
end;
