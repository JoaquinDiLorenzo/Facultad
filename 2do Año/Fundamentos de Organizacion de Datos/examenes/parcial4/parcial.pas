program Parcial4;
type
    producto = record
        cod:integer;
        nombre:string;
        desc:string;
        precio_compra:integer;
        precio_venta:integer;
        ubicacion:string;
    end;

    archivoProd = File of producto;

procedure agregarProd(var arch:archivoProd);
var
    p:producto;
    indice:producto;
begin
    reset(arch);
    leerProd(p);
    if not existeProducto(arch,p.cod) then begin
        readln(arch,indice);
        if (indice.cod < 0) then begin
            Seek(arch, abs(indice.cod));
            readln(arch, indice);
            Seek(arch,FilePos(arch)-1);
            writeln(arch,p);
            Seek(arch,0);
            writeln(arch,indice);
        end else begin
            Seek(arch,FileSize(arch));
            writeln(arch,p);
        end;
    end;
    close(arch);
end;

procedure quitarEmpleado(var arch:archivoProd);
var
    p,indice,act:producto;
    prod_cod:integer;
begin
    reset(arch);
    readln(prod_cod);
    if not existeProducto(arch,prod_cod) then begin
        readln(arch,indice);
        readln(arch,act);
        while (act.cod <> prod_cod) do
            readln(arch,act);
        Seek(arch, FilePos(arch)-1);
        writeln(arch,indice);
        indice.cod := (FilePos(arch)-1)*-1;
        seek(arch,0);
        wirteln(arch,indice);
    end else
        writeln('No se encontro el archivo');
    close(arch);
end;

var
    arch:archivoProd;
begin
    Assign(arch, 'Archivo');
    agregarProd(arch);
end.