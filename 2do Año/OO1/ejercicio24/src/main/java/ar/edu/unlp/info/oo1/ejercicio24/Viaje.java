package ar.edu.unlp.info.oo1.ejercicio24;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.LinkedList;
import java.util.List;


public class Viaje {
	private String origen;
	private String destino;
	private double costoTotal;
	private Vehiculo vehiculo;
	private LocalDate fechaViaje;
	private List<Usuario> pasajeros;
	
	public Viaje(String origen, String destino, double costoTotal, Vehiculo vehiculo, LocalDate fechaViaje) {
		this.origen = origen;
		this.destino = destino;
		this.costoTotal = costoTotal;
		this.vehiculo = vehiculo;
		this.fechaViaje = fechaViaje;
		this.pasajeros = new LinkedList<>();
		this.agregarPasajero(vehiculo.getDueñoAuto());
	}
	
	private boolean hayCapacidad() {
		return pasajeros.size() < vehiculo.getCapacidadPasajeros();
	}
	
	private boolean sePuedeRealizar(LocalDate fecha) {
		long diasDif=ChronoUnit.DAYS.between(fecha, fechaViaje);
		return diasDif>=2 && this.hayCapacidad();
	}
	
	public void agregarPasajero(Usuario pasajero) {
		if (this.sePuedeRealizar(LocalDate.now())) pasajeros.add(pasajero);
	}
	
	public void procesarViaje() {
		double costoPorIntegrante = costoTotal / pasajeros.size();
		pasajeros.stream().forEach(p -> p.cobrarViaje(costoPorIntegrante));
	}
	
	public boolean menos30Dias(LocalDate fecha) {
		return ChronoUnit.DAYS.between(fechaViaje, fecha) <= 30;
	}
	
	
	
}
