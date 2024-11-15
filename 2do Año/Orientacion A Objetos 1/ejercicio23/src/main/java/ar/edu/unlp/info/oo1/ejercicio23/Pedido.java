package ar.edu.unlp.info.oo1.ejercicio23;

public class Pedido {
	private Cliente cliente;
	private Pago formaPago;
	private Envio envio;
	private Producto producto;
	private int cantidad;
	
	public Pedido(Cliente cliente, Pago formaPago, Envio envio, Producto producto, int cantidad) {
		super();
		this.cliente = cliente;
		this.formaPago = formaPago;
		this.envio = envio;
		this.producto = producto;
		this.cantidad = cantidad;
	}
	
	public String getCategoriaProducto() {
		return producto.getCategoria();
	}
	
	public int getCantidad() {
		return this.cantidad;
	}
	
	public double getCostoTotal() {
		double costoFinal = this.formaPago.getPrecioFinal(cantidad * producto.getPrecio());
		return costoFinal;
	}
	
	
	
}
