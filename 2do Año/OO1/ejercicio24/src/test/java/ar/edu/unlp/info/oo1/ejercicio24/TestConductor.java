package ar.edu.unlp.info.oo1.ejercicio24;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class TestConductor {
	private Conductor c;
	private Vehiculo v = new Vehiculo(c,"desc",5,2022,10000);
	
	@BeforeEach
	void setUp() {
		c = new Conductor("Joaquin", 1000, v);
	}
	
	@Test
	void testBonificacion() {
		assertEquals(1000, c.getBonificacion());
	}
	
	@Test
	void testComision() {
		assertEquals(1, c.getComision(100));
		c.setVehiculo(new Vehiculo(c,"desc",5,2000,10000));
		assertEquals(10, c.getComision(100));
		
	}
	
}
