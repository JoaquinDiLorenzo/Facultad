package ar.edu.unlp.info.oo1.ejercicio23;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


public class Cliente extends Persona{
	private List<Pedido> pedidos;

	public Cliente(String nombre, String direccion) {
		super(nombre, direccion);
		this.pedidos = new LinkedList<>();
	}
	
	public void agregarPedido(Pedido p) {
		pedidos.add(p);
	}
	
	public void crearPedido(Pago formaPago, Envio envio, Producto producto, int cantidad) {
		if (producto.hayDisponibilidad(cantidad)) {
			producto.descontarStock(cantidad);
			Pedido nuevoPedido = new Pedido(this, formaPago, envio, producto, cantidad);
			pedidos.add(nuevoPedido);
		}
	}
	
	public Map<String,Integer> getCantPedidosCategoria() {
		Map<String,Integer> mapCat = new HashMap<String, Integer>();
		for(Pedido p: pedidos) {
			if (mapCat.containsKey(p.getCategoriaProducto())) {
				mapCat.put(p.getCategoriaProducto(), mapCat.get(p.getCategoriaProducto() + p.getCantidad()));
			} else {
				mapCat.put(p.getCategoriaProducto(), p.getCantidad());
			}
		}
		return mapCat;
	}

}
