package ar.edu.unlp.info.oo1.ejercicio24;

import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;

public class Pasajero extends Usuario{

	private List<Viaje> viajesRealizados;
	
	public Pasajero(String nombre, double saldo) {
		super(nombre, saldo);
		this.viajesRealizados=new LinkedList<>();
	}
	
	public void registrarseAViaje(Viaje viaje) {
		if ((super.getSaldo() > 0) && (viaje.agregarPasajero(this))) {
			viajesRealizados.add(viaje);
		}
	}
	
	public int cantViajesRealizados() { //Metodo para Test
		return viajesRealizados.size();
	}
	
	public double getBonificacion() {
		if (viajesRealizados.size() != 0) {
			return 500;
		}
		return 0;
	}
	
	public double getComision(double monto) {
		for(Viaje v: viajesRealizados) {
			if (v.menos30Dias(LocalDate.now())) {
				return 0;
			}
		}
		return monto * 0.10;
	}
	
}
