package ar.edu.unlp.info.oo1.ejercicio25;

import java.time.LocalDate;

public class Guarderia extends Servicio{
	private int cantDias;

	public Guarderia(Mascota mascota, LocalDate fehcaInicio, int cantDias) {
		super(mascota, fehcaInicio);
		this.cantDias = cantDias;
	}

	public double calcularCostoServicio() {
		double costoTotal=500 * cantDias;
		if (this.getMascota().utilizo5MasServicios()) costoTotal = costoTotal * 0.9;
		return costoTotal;
	}

	

	
	
	
	
}
