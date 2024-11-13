package ar.edu.unlp.info.oo1.ejercicio23;

public class RetirarDomicilio implements Envio{
	private String desde;
	private String hasta;
	
	public RetirarDomicilio(String desde, String hasta) {
		this.desde = desde;
		this.hasta = hasta;
	}

	public double getCostoEnvio() {
		return CalculadoraDeDistancia.distanciaEntre(desde, hasta) * 0.5;
	}
}
