package ar.edu.unlp.info.oo1.ejercicio1;

public class Retweet implements Publicacion{
	private Tweet origen;

	public Retweet(Tweet origen) {
		this.origen = origen;
	}

	@Override
	public String getUserName() {
		return origen.getUsuario().getScreenName();
	}
	
	
	
}
