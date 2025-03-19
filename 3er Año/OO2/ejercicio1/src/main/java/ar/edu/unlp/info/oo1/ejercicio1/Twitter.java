package ar.edu.unlp.info.oo1.ejercicio1;

import java.util.LinkedList;
import java.util.List;

public class Twitter {
	private List<Usuario> usuarios;

	public Twitter() {
		this.usuarios = new LinkedList<Usuario>();
	}

	public void agregarUsuario(Usuario u) {
		if (!existeUsuario(u)) {
			usuarios.add(u);
			System.out.print("Usuario agregado");
		} else {
			System.out.print("NO se pudo agregar el usuario, ya existe uno con ese screenName");
		}
	}
	
	public void eliminarUsuario(Usuario usuario) {
		usuarios.stream().forEach(u -> u.eliminarTweets(usuario.getScreenName())); //Elimina todos los tweets y retweets asociados al usuario
		usuarios.remove(usuario);
	}
	
	
	private boolean existeUsuario(Usuario usuario) {
		return usuarios.stream().anyMatch(u -> u.getScreenName().equals(usuario.getScreenName()));
	}
	
	
}
