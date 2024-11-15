package ar.edu.unlp.info.oo1.ejercicio25;

import java.time.LocalDate;

public class Vacunacion extends ServicioMedico{
	
	private String nombreVacuna;
	private double costoVacuna;
	
	public Vacunacion(Mascota mascota, LocalDate fehcaInicio, Veterinario veterinario, String nombreVacuna,
			double costoVacuna) {
		super(mascota, fehcaInicio, veterinario);
		this.nombreVacuna = nombreVacuna;
		this.costoVacuna = costoVacuna;
	}
	
	public double calcularCostoServicio() {
		return super.calcularCostoServicio() + this.costoVacuna;
	}
	
	public double getCostoMateriales() {
		return 500;
	}
	
	
	
	
	
}
