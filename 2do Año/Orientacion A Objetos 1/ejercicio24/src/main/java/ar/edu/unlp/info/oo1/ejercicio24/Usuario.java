package ar.edu.unlp.info.oo1.ejercicio24;

public abstract class Usuario {
	private String nombre;
	private double saldo;
	
	public Usuario(String nombre, double saldo) {
		this.nombre = nombre;
		this.saldo = saldo;
	}

	public double getSaldo() {
		return saldo;
	}
	
	public void cobrarViaje(double monto) {
		this.saldo -=  monto - this.getBonificacion();
	}
	
	public void cargarSaldo(double monto) {
		this.saldo += monto - this.getComision(monto);
	}
	
	public abstract double getBonificacion();
	public abstract double getComision(double monto);
}
