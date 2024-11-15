package ar.edu.unlp.info.oo1.ejercicio25;

import java.time.LocalDate;

public class ConsultaMedica extends ServicioMedico{

	public ConsultaMedica(Mascota mascota, LocalDate fehcaInicio, Veterinario veterinario) {
		super(mascota, fehcaInicio, veterinario);
	}

	public double calcularCostoServicio() {
		return super.calcularCostoServicio() + this.getAñosAntiguedad() * 100;
	}
	
	public double getCostoMateriales() {
		return 300;
	}
	
	
	
	
}
