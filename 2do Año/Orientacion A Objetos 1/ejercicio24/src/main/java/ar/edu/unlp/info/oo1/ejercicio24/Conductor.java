package ar.edu.unlp.info.oo1.ejercicio24;

import java.time.LocalDate;

public class Conductor extends Usuario{
	private Vehiculo vehiculo;


	public Conductor(String nombre, double saldo, Vehiculo vehiculo) {
		super(nombre, saldo);
		this.vehiculo = vehiculo;
	}
	
	public void setVehiculo(Vehiculo v) { //SOlo para Test
		this.vehiculo = v;
	}
	
	public double getBonificacion() {
		return vehiculo.getValorMercado() * 0.1;
	}
	
	public double getComision(double monto) {
		if (LocalDate.now().getYear() - vehiculo.getAñoFabricacion()  < 5) return monto * 0.01;
		return monto * 0.1;
	}

	
	
}
