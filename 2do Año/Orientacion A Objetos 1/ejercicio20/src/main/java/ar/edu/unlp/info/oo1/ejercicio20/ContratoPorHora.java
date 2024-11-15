package ar.edu.unlp.info.oo1.ejercicio20;

import java.time.LocalDate;
import java.time.Period;

public class ContratoPorHora extends Contrato{
	private double valor_hora;
	private int cant_horas_trabajdas;
	private LocalDate fecha_fin;
	
	public ContratoPorHora(LocalDate fecha_inicio, double valor_hora, int cant_horas_trabajdas, LocalDate fecha_fin) {
		super(fecha_inicio);
		this.valor_hora = valor_hora;
		this.cant_horas_trabajdas = cant_horas_trabajdas;
		this.fecha_fin = fecha_fin;
	}
	
	public void setFecha_fin(LocalDate fecha_fin) {
		this.fecha_fin = fecha_fin;
	}

	@Override
	public boolean estaActivo() {
		return (fecha_fin.isAfter(LocalDate.now()));
	}

	@Override
	public double montoBasicoCobrar(Empleado e) {
		return this.valor_hora * this.cant_horas_trabajdas;
	}

	@Override
	public int duracionAños() {
		return Period.between(super.getFecha_inicio(), fecha_fin).getYears();
	}
	
}
