program algoritmos;
const
	valorAlto=9999;
type
	producto = record
		cod: integer;
		desc:string;
		pu:real;
		stock:integer;
	end;
	
	venta = record
		cod:string;
		cant_vendida: integer;
	end;
	
//MAESTRO DETALLE 1 | Cada elem maestro es alterado por un solo elem detalle
procedure MD1();
var
	mae:File of producto;
	det:File of venta;
	regm: producto;
	regd:venta;
begin
	Assign(mae,'Maestro');
	Assign(det,'Detalle');
	reset(mae);
	reset(det);
	while not eof(det) do
		begin
			read(det,regd);
			read(mae,regm);
			while (regd.cod <> regm.cod) do
				read(mae,regm);
			regm.stock := regm.stock - regd.cant_vendida;
			seek(mae, filePos(mae)-1);
			write(mae,regm);
		end;
	close(det);
	close(mae);
end;

procedure leer(var archivo: detalle; var dato: venta);
begin
	if not eof(archivo) then
		read(archivo, dato)
	else
		dato.cod := valorAlto;
end;

//MAESTRO DETALLE 2 | Cada elem maestro es alterado por uno o mas elem detalle
procedure MD1();
var
	mae:File of producto;
	det:File of venta;
	regm: producto;
	regd:venta;
begin
	Assign(mae,'Maestro');
	Assign(det,'Detalle');
	reset(mae);
	reset(det);
	leer(det,regd);
	while (regd.cod <> valorAlto) do
		begin
			read(mae,regm);
			while (regm.cod <> regd.cod) do
				read(mae,regm);
			while (regd.cod = regm.cod) do
				begin
					regm.stock := regm.stock - regd.cant_vendida;
					leer(det,regd);
				end;
			seek(mae,filePos(mae)-1);
			write(mae,regm);
			
		end;
	
	close(det);
	close(mae);
end;

procedure minimo(var r1,r2,r3:venta; var min:venta);
begin
	if (r1.cod < r2.cod) and (r1.cod < r3.cod) then
		min:=r1;
		leer(det1,r1)
	else
		if (r2.cod < r3.cod) then
			min:=r2;
			leer(det2,r2)
		else
			min:=r3;
			leer(det3,r3);
end;

//MAESTRO DETALLE 3 | Cada elem maestro es alterado por uno o mas elem detalle y hay 3 elem detalle
procedure MD1();
var
	mae:File of producto;
	det1,det2,det3:File of venta;
	regm: producto;
	regd1,regd2,regd3,min:venta;
begin
	Assign(mae,'Maestro');
	Assign(det1,'Detalle1'); Assign(det2,'Detalle1'); Assign(det3,'Detalle1');
	reset(det1); reset(det2); reset(det3);
	leer(det1,regd1); leer(det2,regd2); leer(det3,regd3);
	
	minimo(regd1,regd2,regd3,min);
	while (min.cod <> valorAlto) do
		begin
			read(mae,regm);
			while (regm.cod <> min.cod) do
				read(mae,regm);
			while (regm.cod = min.cod) do
				begin
					regm.stock := regm.stock - min.cant_vendida;
					minimo(regd1,regd2,regd3,min);
				end;
			seek(mae,filPos(mae)-1);
			write(mae,regm);
		end;
	close(mae);
	close(regd1); close(regd2); close(regd3);
end;


//CORTE DE CONTROL
const valorAlto='ZZZ';
type
	reg_venta = record
		vendedor:integer;
		monto:real;
		sucursal:string;
		ciudad:string;
		provincia:string;
	end;
	
	ventas  = File of reg_venta;
var
	reg:reg_venta;
	archivo:ventas;
	total,totProv,totCiudad,totSuc:integer;
	prov,ciudad,suc:string;

procedure leer(var archivo:ventas; var dato:reg_venta);
begin
	if not eof(archivo) then
		read(archivo,dato)
	else
		dato.provincia := valorAlto;
end;

begin
	assign(archivo, 'archivo_ventas');
	reset(archivo);
	
	total:=0; //total empresa
	leer(archivo,reg);
	while (reg.provincia <> valorAlto) do
		begin
			writeln('Provincia:', reg.provincia);
			prov := reg.provincia;
			totProv:=0;
			while (prov = reg.provincia) do
				begin
					writeln('Ciudad', reg.ciudad);
					ciudad := reg.ciudad;
					totCiudad :=0;
					while (prov = reg.provincia) and (ciudad = reg.ciudad) do
						begin
							writeln('Sucursal', reg.sucursal);
							suc := reg.sucursal;
							totSuc := 0;
							while (prov = reg.provincia) and (ciudad=reg.ciudad) and (suc = reg.sucursal) do
								begin
									write('Vendedor', reg.vendedor);
									totSuc:= totSuc + reg.monto;
									leer(archivo,reg);
								end;
							writeln('Total sucursal', suc);
							totCiudad := totCiudad + totSuc;
						end;
					writeln('Total Ciudad', totCiudad);
					totProv := totProv + totCiudad;
				end;
			writeln('Total provincia',totProv);
			total := total + totProv;
		end;
	writeln('Total empresa: ', total);
	close(archivo);
	
end;

