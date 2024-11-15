package ar.edu.unlp.info.oo1.ejercicio25;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Veterinario {
	private String nombre;
	private LocalDate fechaIngreso;
	private double honorarios;
	
	public Veterinario(String nombre, LocalDate fechaIngreso, double honorarios) {
		super();
		this.nombre = nombre;
		this.fechaIngreso = fechaIngreso;
		this.honorarios = honorarios;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public LocalDate getFechaIngreso() {
		return fechaIngreso;
	}
	public void setFechaIngreso(LocalDate fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}
	public double getHonorarios() {
		return honorarios;
	}
	public void setHonorarios(double honorarios) {
		this.honorarios = honorarios;
	}
	
	public long getAñosAntiguedad() {
		return ChronoUnit.YEARS.between(fechaIngreso, LocalDate.now());
	}
	
}
