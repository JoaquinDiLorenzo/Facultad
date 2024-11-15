package ar.edu.unlp.info.oo1.ejercicio25;

import java.time.LocalDate;

public abstract class ServicioMedico extends Servicio{
	
	private Veterinario veterinario;

	public ServicioMedico(Mascota mascota, LocalDate fehcaInicio, Veterinario veterinario) {
		super(mascota, fehcaInicio);
		this.veterinario = veterinario;
	}
	
	public double calcularCostoServicio() {
		int extraDomingo=0;
		if (this.esDomingo()) extraDomingo=200;
		return veterinario.getHonorarios() + getCostoMateriales() + extraDomingo;
	}
	
	public long getAñosAntiguedad() {
		return veterinario.getAñosAntiguedad();
	}
	
	public abstract double getCostoMateriales();

}
