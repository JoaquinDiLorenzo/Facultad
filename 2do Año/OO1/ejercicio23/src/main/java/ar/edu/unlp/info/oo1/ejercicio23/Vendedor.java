package ar.edu.unlp.info.oo1.ejercicio23;

import java.util.LinkedList;
import java.util.List;

public class Vendedor extends Persona{
	private List<Producto> productosVenta;
	
	public Vendedor(String nombre, String direccion) {
		super(nombre, direccion);
		productosVenta = new LinkedList<>();
	}
	
	public void agregarProductoVenta(Producto p) {
		productosVenta.add(p);
	}
	
	
	
}
