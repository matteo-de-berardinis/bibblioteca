package model;

import java.util.List;

public class Biblioteca {
	private int id;
	private String nome;
	private List<Libro> lista;

////costruttore 

	public Biblioteca(int id, String nome, List<Libro> lista) {
		super();
		this.id = id;
		this.nome = nome;
		this.lista = lista;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Libro> getLista() {
		return lista;
	}

	public void setLista(List<Libro> lista) {
		this.lista = lista;
	}

	@Override
	public String toString() {
		return "Biblioteca [id=" + id + ", nome=" + nome + ", lista=" + lista + "]";
	}

}
