package ar.edu.unlp.info.oo1.ejercicio20;

import java.time.LocalDate;

public abstract class Contrato {
	private LocalDate fecha_inicio;

	public Contrato(LocalDate fecha_inicio) {
		this.fecha_inicio = fecha_inicio;
	}
	
	public LocalDate getFecha_inicio() {
		return fecha_inicio;
	}

	public void setFecha_inicio(LocalDate fecha_inicio) {
		this.fecha_inicio = fecha_inicio;
	}

	public abstract int duracionAños();
	public abstract boolean estaActivo();
	public abstract double montoBasicoCobrar(Empleado e);
	
}
