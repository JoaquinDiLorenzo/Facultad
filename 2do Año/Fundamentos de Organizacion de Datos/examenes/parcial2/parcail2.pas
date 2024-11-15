program parcial2;
const ValorAlto = 9999;
type
    equipo = record
        cod_equipo:inetger;
        nombre:string;
        año:integer;
        cod_torneo:integer;
        goles_a_favor:integer;
        goles_en_contra:integer;
        puntos:integer;
    end;

    info_equipo = record
        cant_a_favor:integer;
        cant_en_contra:integer;
        dif_gol:integer;
        cant_ganados:integer;
        cant_perdidos:integer;
        cant_empatados:integar;
        cant_puntos:integer;
    end;

    archivo = File of equipo;

procedure corteDeControl(var arch:archivo);
var
    e:equipo;
    info:info_equipo;
begin
    leer(arch,e);
    while (e.año <> ValorAlto) do begin
        writeln('Año ',e.año);
        año_act:= e.año;
        cant_año:= 0;
        while (e.año = año_act) do begin
            writeln('Cod torneo ', e.cod_torneo);
            cod_torneo_act:= e.cod_torneo_act;
            cant_cod_torneo:=0;
            while (e.año = año_act) and (e.cod_torneo = cod_torneo_act) do begin
                writeln('Cod_equipo ', e.cod_equipo, ' nombre equipo ', e.nombre);
                cod_equipo_act := e.cod_equipo;
                cant_info:= info; //Info se deberia inicializar con todos los campos en 0
                while (e.año = año_act) and (e.cod_torneo = cod_torneo_act) and (e.cod_equipo = cod_equipo_act) do begin
                    info.cant_a_favor := info.cant_a_favor + e.goles_a_favor;
                    info.cant_en_contra := info.cant_en_contra + e.goles_en_contra;
                    info.dif_gol := info.dif_gol + (e.goles_a_favor - e.goles_en_contra);
                    info.can
                end;
            end; 
        end;
    end;
end;

var
    arch:archivo;
begin
    Assign(arch, 'Archivo');
    reset(arch);
    corteDeControl(arch);
end.    