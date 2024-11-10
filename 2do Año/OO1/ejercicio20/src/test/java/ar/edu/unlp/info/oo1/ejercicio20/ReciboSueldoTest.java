package ar.edu.unlp.info.oo1.ejercicio20;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReciboSueldoTest {
	ReciboSueldo recibo;
	
	@BeforeEach
	void setUp() {
		recibo = new ReciboSueldo("Joaquin", "Di Lorenzo", 251, 1, 100); //1 año y 100 sueldo base
	}
	
	@Test
	void testCalcularExtraPorAntiguedad() {
		assertEquals(100, recibo.getMontoTotal());
		
		recibo = new ReciboSueldo("Joaquin", "Di Lorenzo", 251, 8, 100);
		assertEquals(130, recibo.getMontoTotal());
		
		recibo = new ReciboSueldo("Joaquin", "Di Lorenzo", 251, 12, 100);
		assertEquals(150, recibo.getMontoTotal());
		
		recibo = new ReciboSueldo("Joaquin", "Di Lorenzo", 251, 17, 100);
		assertEquals(170, recibo.getMontoTotal());
		
		recibo = new ReciboSueldo("Joaquin", "Di Lorenzo", 251, 22, 100);
		assertEquals(200, recibo.getMontoTotal());
	}
}
