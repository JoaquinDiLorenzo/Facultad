package ar.edu.unlp.info.oo1.ejercicio1;

public class Tweet implements Publicacion{
	private String texto;
	private Usuario usuario;

	public Tweet(String texto, Usuario usuario) {
		this.texto = texto;
		this.usuario = usuario;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}

	@Override
	public String getUserName() {
		return usuario.getScreenName();
	}
	
	
	
	
	
	
	
	
	
}
