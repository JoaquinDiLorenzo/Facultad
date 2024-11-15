package ar.edu.unlp.info.oo1.ejercicio20;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ContratoDePlantaTest {
	ContratoDePlanta contratoPlanta;
	
	@BeforeEach
	void setUp() {
		contratoPlanta = new ContratoDePlanta(LocalDate.of(2020, 2, 4), 100, 50, 20);
	}
	
	@Test
	void testEstaActivo() {
		assertTrue(contratoPlanta.estaActivo());
	}
	
	@Test
	void testMontoBasicoCobrar() {
		Empleado e = new Empleado("Joaquin", "Di Lorenzo", 215, LocalDate.now(), false, false);
		//Sin hijos ni conyuge
		assertEquals(100, contratoPlanta.montoBasicoCobrar(e));
		
		//Sin hijos con conyuge
		e.setTiene_conyuge(true);
		assertEquals(150, contratoPlanta.montoBasicoCobrar(e));
		
		//Con hijos y conyuge
		e.setTiene_hijos(true);
		assertEquals(170, contratoPlanta.montoBasicoCobrar(e));
		
		//Con hijos, sin conyuge
		e.setTiene_conyuge(false);
		assertEquals(120, contratoPlanta.montoBasicoCobrar(e));
	}
	
	@Test
	void testDuracionAños() {
		assertEquals(4, contratoPlanta.duracionAños());
	}
	
}
