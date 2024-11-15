program Prac3Ej8;
type
    dist = record
        nombre:string;
        año:integer;
        kernel:integer;
        cantDes:integer;
        desc:string;
    end;

    file_mae = File of dist;

function ExisteDistribucion(var mae:file_mae; nombre:string):boolean;
var
    regM:dist;
    encontre:boolean;
begin
    encontre:=false;
    reset(mae);
    while not eof(mae) and (not encontre) do begin
        readln(mae,regM);
        if (regM.nombre = nombre) then
            encontre := true;
    end;
    close(mae);
    ExisteDistribucion := encontre;
end;

procedure AltaDistribucion(var mae:file_mae);
var
    d,regM,indice,elim:dist;
begin
    leerDist(d);
    if (not ExisteDistribucion(mae,d.nombre)) then begin
        reset(mae);
        readln(mae,indice); 
        if (indice.cantDes<0) then begin
            seek(mae,abs(indice)); 
            readln(mae,elim); //Saco el elem para luego colocarl0 en el indice
            seek(mae,FilePos(mae)-1):
            writeln(mae,d);
            seek(mae,0);
            writeln(mae,elim);
        end 
        else begin
            seek(mae,FileSize(mae));
            writeln(mae,d);
        end;

        close(mae);
    end
    else
        writeln('ya existe la distribución.');
end;    

procedure BajaDistribucion(var mae:file_mae);
var
    nom:string;
    indice:dist;
begin
    readln(nom); //Lee el nombre de la distribucion
    if (not ExisteDistribucion(mae,nom)) then begin
        reset(mae);
        readln(mae,indice);
        readln(mae,act);
        while (not eof(mae)) and (act.nombre <> nom) do
            readln(mae,act);
        //Como seguro existe el elem
        seek(mae,FilePos(mae)-1);
        write(mae,cab);
        cab.cantDes := (FilePos(mae)-1) * -1; 
        seek(mae,0);
        write(mae,cab);
        close(mae);
    end 
    else
        writeln('Distribución no existente');
end;

var
    mae:file_mae;
begin
    Assign(mae,'Maestro');
end.