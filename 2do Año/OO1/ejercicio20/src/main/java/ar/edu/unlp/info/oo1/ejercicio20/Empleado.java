package ar.edu.unlp.info.oo1.ejercicio20;

import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;

public class Empleado {
	private String nombre;
	private String apellido;
	private Integer CUIL;
	private LocalDate fecha_nacimiento;
	private boolean tiene_hijos;
	private boolean tiene_conyuge;
	private List<Contrato> contratos;
	
	
	public Empleado(String nombre, String apellido, Integer cUIL, LocalDate fecha_nacimiento, boolean tiene_hijos, boolean tiene_conyuge) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		CUIL = cUIL;
		this.fecha_nacimiento = fecha_nacimiento;
		this.tiene_hijos = tiene_hijos;
		this.tiene_conyuge = tiene_conyuge;
		this.contratos = new LinkedList<>();
	}

	private int calcularAntiguedad() {
		return contratos.stream()
					.mapToInt(e -> e.duracionAños())
					.sum();
	}
	
	private double caluclarMontoBasico() {
		double base=0;
		for (Contrato c:contratos) {
			if (c.estaActivo()) {
				base+= c.montoBasicoCobrar(this);
			}
		}
		return base;
	}
	
	public ReciboSueldo generarReciboSueldo() {
		
		return new ReciboSueldo(
				this.getNombre(), 
				this.getApellido(), 
				this.getCUIL(),
				this.calcularAntiguedad(),
				this.caluclarMontoBasico()
			);
	}
	
	public void agregarContrato(Contrato c) {
		contratos.add(c);
	}

	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public Integer getCUIL() {
		return CUIL;
	}


	public void setCUIL(Integer cUIL) {
		CUIL = cUIL;
	}


	public LocalDate getFecha_nacimiento() {
		return fecha_nacimiento;
	}


	public void setFecha_nacimiento(LocalDate fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}


	public boolean isTiene_hijos() {
		return tiene_hijos;
	}


	public void setTiene_hijos(boolean tiene_hijos) {
		this.tiene_hijos = tiene_hijos;
	}


	public List<Contrato> getContratos() {
		return contratos;
	}


	public void setContratos(List<Contrato> contratos) {
		this.contratos = contratos;
	}


	public boolean isTiene_conyuge() {
		return tiene_conyuge;
	}


	public void setTiene_conyuge(boolean tiene_conyuge) {
		this.tiene_conyuge = tiene_conyuge;
	}
	
}
