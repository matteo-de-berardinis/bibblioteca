package model;

import java.util.List;

public class Utente {
	private int idUtente;
	private String email;
	private String password;
	private String nomeUtente;
	private List<Prestito>listaPrestiti;
	private String tipo;

	
	public Utente( String email, String password, String nomeUtente) {
		super();
	this.idUtente=0;
		this.email = email;
		this.password = password;
		this.nomeUtente = nomeUtente;
		this.listaPrestiti=null;
	
	}

	public Utente( String email, String password, String nomeUtente,String tipo) {
		super();
	this.idUtente=0;
		this.email = email;
		this.password = password;
		this.nomeUtente = nomeUtente;
		this.listaPrestiti=null;
		this.tipo=tipo;
	}

	public List<Prestito> getListaPrestiti() {
		return listaPrestiti;
	}

	public void setListaPrestiti(List<Prestito> listaPrestiti) {
		this.listaPrestiti = listaPrestiti;
	}

	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNomeUtente() {
		return nomeUtente;
	}

	public void setNomeUtente(String nomeUtente) {
		this.nomeUtente = nomeUtente;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	@Override
	public String toString() {
		return "Utente [idUtente=" + idUtente + ", email=" + email + ", password=" + password + ", nomeUtente="
				+ nomeUtente + "]";
	}

}
