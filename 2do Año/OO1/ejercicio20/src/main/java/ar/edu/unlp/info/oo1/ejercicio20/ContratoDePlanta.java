package ar.edu.unlp.info.oo1.ejercicio20;

import java.time.LocalDate;
import java.time.Period;

public class ContratoDePlanta extends Contrato{
	private double sueldo_mensual;
	private double monto_por_conyuge;
	private double monto_por_hijos;
	
	public ContratoDePlanta(LocalDate fecha_inicio, double sueldo_mensual, double monto_por_conyuge, double monto_por_hijos) {
		super(fecha_inicio);
		this.sueldo_mensual = sueldo_mensual;
		this.monto_por_conyuge = monto_por_conyuge;
		this.monto_por_hijos = monto_por_hijos;
	}
	
	
	
	@Override
	public boolean estaActivo() {
		return true;
	}

	@Override
	public double montoBasicoCobrar(Empleado e) {
		double monto = this.sueldo_mensual;
		if (e.isTiene_conyuge()) monto+=this.monto_por_conyuge;
		if (e.isTiene_hijos()) monto+=this.monto_por_hijos;
		return monto;
	}
	
	@Override
	public int duracionAños() {
		return Period.between(super.getFecha_inicio(), LocalDate.now()).getYears();
	}
	
	
}
