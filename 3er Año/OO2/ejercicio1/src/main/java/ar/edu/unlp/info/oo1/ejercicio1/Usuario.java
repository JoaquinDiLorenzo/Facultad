package ar.edu.unlp.info.oo1.ejercicio1;

import java.util.LinkedList;
import java.util.List;

public class Usuario {
	private String screenName;
	private List<Publicacion> publicaciones;
	
	public Usuario(String screenName) {
		this.screenName = screenName;
		this.publicaciones = new LinkedList<Publicacion>();
	}
	
	public void agregarPublicacion(Publicacion p) {
		publicaciones.add(p);
	}
	
	public List<Publicacion> getPublicacion(){
		return publicaciones;
	}
	
	public String getScreenName() {
		return screenName;
	}
	
	public void eliminarTweets(String screenName) {
		publicaciones.removeIf(publicacion -> publicacion.getUserName().equals(screenName));
	}
	
}
