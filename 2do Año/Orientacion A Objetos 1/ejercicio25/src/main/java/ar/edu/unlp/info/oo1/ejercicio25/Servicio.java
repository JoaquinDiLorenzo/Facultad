package ar.edu.unlp.info.oo1.ejercicio25;

import java.time.LocalDate;

public abstract class Servicio {
	private Mascota mascota;
	private LocalDate fehcaInicio;
	
	public Servicio(Mascota mascota, LocalDate fehcaInicio) {
		super();
		this.mascota = mascota;
		this.fehcaInicio = fehcaInicio;
	}
	
	public boolean esDomingo() {
		return this.fehcaInicio.getDayOfWeek().getValue() == 7;
	}
	
	public Mascota getMascota() {
		return this.mascota;
	}

	public abstract double calcularCostoServicio();
	
}
