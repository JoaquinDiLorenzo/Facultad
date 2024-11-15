package ar.edu.unlp.info.oo1.ejercicio23;

public class Producto {
	private String nombre;
	private String categoria;
	private double precio;
	private int cantDisponibles;
	
	public double getPrecio() {
		return this.precio;
	}
	
	public boolean hayDisponibilidad(int cant) {
		return (this.cantDisponibles >= cant);
	}
	
	public void descontarStock(int cant) {
		this.cantDisponibles = this.cantDisponibles - cant;
	}
	
	public String getCategoria() {
		return this.categoria;
	}
	
}
