package ar.edu.unlp.info.oo1.ejercicio24;

public class Vehiculo {
	private Conductor conductor;
	private String descripcion;
	private int capacidadPasajeros;
	private int añoFabricacion;
	private double valorMercado;
	
	public Vehiculo(Conductor conductor, String descripcion, int capacidadPasajeros, int añoFabricacion,double valorMercado) {
		super();
		this.conductor = conductor;
		this.descripcion = descripcion;
		this.capacidadPasajeros = capacidadPasajeros;
		this.añoFabricacion = añoFabricacion;
		this.valorMercado = valorMercado;
	}
	
	public Conductor getDueñoAuto() {
		return this.conductor;
	}
	
	public double getValorMercado() {
		return this.valorMercado;
	}
	
	public int getAñoFabricacion() {
		return this.añoFabricacion;
	}

	public Conductor getConductor() {
		return conductor;
	}

	public void setConductor(Conductor conductor) {
		this.conductor = conductor;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getCapacidadPasajeros() {
		return capacidadPasajeros;
	}

	public void setCapacidadPasajeros(int capacidadPasajeros) {
		this.capacidadPasajeros = capacidadPasajeros;
	}

	public void setAñoFabricacion(int añoFabricacion) {
		this.añoFabricacion = añoFabricacion;
	}

	public void setValorMercado(double valorMercado) {
		this.valorMercado = valorMercado;
	}
	
	
	
	
}
