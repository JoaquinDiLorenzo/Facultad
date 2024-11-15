package ar.edu.unlp.info.oo1.ejercicio20;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ContratoPorHoraTest {
	ContratoPorHora contratoHora;
	
	@BeforeEach
	void setUp() {
		contratoHora = new ContratoPorHora(LocalDate.of(2020, 5, 8), 20, 8, LocalDate.of(2022, 9, 1));
	}
	
	@Test
	void testEstaActivo() {
		assertFalse(contratoHora.estaActivo());
		contratoHora.setFecha_fin(LocalDate.of(2025, 8, 25));
		assertTrue(contratoHora.estaActivo());
	}
	
	@Test
	void testMontoBasicoCobrar() {
		Empleado e = new Empleado("Joaquin", "Di Lorenzo", 215, LocalDate.now(), false, false);
		assertEquals(160, contratoHora.montoBasicoCobrar(e));
	}
	
	@Test
	void testDuracionAños() {
		assertEquals(2, contratoHora.duracionAños());
	}
}
