package ar.edu.unlp.info.oo1.ejercicio20;

import java.time.LocalDate;

public class ReciboSueldo {
	private String nombre_empleado;
	private String apellido_empleado;
	private int CUIL;
	private int anitguedad;
	private LocalDate fecha_generacion;
	private double montoTotal;
	
	public ReciboSueldo(String nombre_empleado, String apellido_empleado, int CUIL, int anitguedad, double sueldo_base) {
		this.nombre_empleado = nombre_empleado;
		this.apellido_empleado = apellido_empleado;
		this.CUIL = CUIL;
		this.anitguedad = anitguedad;
		this.fecha_generacion = LocalDate.now();
		this.montoTotal = sueldo_base + calcularExtraPorAntiguedad(sueldo_base, anitguedad);
	}


	private double calcularExtraPorAntiguedad(double basico, int años) {
		if (años >= 5 && años<10) {
			return basico * 0.30;
		} else if (años >= 10 && años<15) {
			return basico * 0.50;
		} else if (años >= 15 && años<20) {
			return basico * 0.70;
		} else if (años >= 20) {
			return basico;
		}
		return 0;
	}


	public String getNombre_empleado() {
		return nombre_empleado;
	}


	public void setNombre_empleado(String nombre_empleado) {
		this.nombre_empleado = nombre_empleado;
	}


	public String getApellido_empleado() {
		return apellido_empleado;
	}


	public void setApellido_empleado(String apellido_empleado) {
		this.apellido_empleado = apellido_empleado;
	}


	public int getCUIL() {
		return CUIL;
	}


	public void setCUIL(int cUIL) {
		CUIL = cUIL;
	}


	public int getAnitguedad() {
		return anitguedad;
	}


	public void setAnitguedad(int anitguedad) {
		this.anitguedad = anitguedad;
	}


	public LocalDate getFecha_generacion() {
		return fecha_generacion;
	}


	public void setFecha_generacion(LocalDate fecha_generacion) {
		this.fecha_generacion = fecha_generacion;
	}


	public double getMontoTotal() {
		return montoTotal;
	}


	public void setMontoTotal(double montoTotal) {
		this.montoTotal = montoTotal;
	}
	
	
	
}
