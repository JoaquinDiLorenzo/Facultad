package ar.edu.unlp.info.oo1.ejercicio25;

import java.time.LocalDate;
import java.util.List;


public class Mascota {
	private String nombre;
	private LocalDate fechaNacimiento;
	private List<Servicio> servicios;
	
	public Mascota(String nombre, LocalDate fechaNacimiento, List<Servicio> servicios) {
		super();
		this.nombre = nombre;
		this.fechaNacimiento = fechaNacimiento;
		this.servicios = servicios;
	}
	
	public LocalDate darAltaConsultaMedica(Veterinario v) {
		servicios.add(new ConsultaMedica(this, LocalDate.now(), v));
		return LocalDate.now();
	}
	
	public LocalDate darAltaVacunacion(Veterinario v, String nombreV, Double costo) {
		servicios.add(new Vacunacion(this, LocalDate.now(), v, nombreV, 100));
		return LocalDate.now();
	}
	
	public LocalDate darAltaGuarderia(int cantDias) {
		servicios.add(new Guarderia(this,LocalDate.now(),10));
		return LocalDate.now();
	}
	
	public boolean utilizo5MasServicios() {
		return servicios.size() >= 5;
	}
	
	
	
	
}
