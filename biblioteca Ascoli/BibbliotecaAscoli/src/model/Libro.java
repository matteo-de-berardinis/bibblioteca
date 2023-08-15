package model;

public class Libro {
private int idLibro;
private String nomeLibro;
private String genere ;
private int copie;





public Libro( String nomeLibro, String genere, int copie) {
	super();
	this.idLibro = 0;
	this.nomeLibro = nomeLibro;
	this.genere = genere;
	this.copie = copie;
}
public int getIdLibro() {
	return idLibro;
}
public void setIdLibro(int idLibro) {
	this.idLibro = idLibro;
}
public String getNomeLibro() {
	return nomeLibro;
}
public void setNomeLibro(String nomeLibro) {
	this.nomeLibro = nomeLibro;
}
public String getGenere() {
	return genere;
}
public void setGenere(String genere) {
	this.genere = genere;
}
public int getCopie() {
	return copie;
}
public void setCopie(int copie) {
	this.copie = copie;
}
@Override
public String toString() {
	return "Libro [idLibro=" + idLibro + ", nomeLibro=" + nomeLibro + ", genere=" + genere + ", copie=" + copie + "]";
}



}
