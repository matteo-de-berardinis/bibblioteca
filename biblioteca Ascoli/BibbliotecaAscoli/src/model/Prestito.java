package model;

public class Prestito {
private int idPrestito;
private int idLibro;
private int idUtente;
private boolean restituito;
private String data;
private String dataRestituzione;


//costruttore con tutto 

public Prestito(int idLibro, int idUtente) {
	super();
	this.idLibro = idLibro;
	this.idUtente = idUtente;
	this.restituito=false;
	this.data=null;
}
public Prestito(int idPrestito, int idLibro, int idUtente, boolean restituito, String data) {
	super();
	this.idPrestito = idPrestito;
	this.idLibro = idLibro;
	this.idUtente = idUtente;
	this.restituito = restituito;
	this.data = data;
	this.dataRestituzione=null;
}
public Prestito(int idPrestito, int idLibro, int idUtente, boolean restituito) {
	super();
	this.idPrestito = idPrestito;
	this.idLibro = idLibro;
	this.idUtente = idUtente;
	this.restituito = restituito;
}

public String getDataRestituzione() {
	return dataRestituzione;
}
public void setDataRestituzione(String dataRestituzione) {
	this.dataRestituzione = dataRestituzione;
}
public String getData() {
	return data;
}
public void setData(String data) {
	this.data = data;
}
public int getIdPrestito() {
	return idPrestito;
}
public void setIdPrestito(int idPrestito) {
	this.idPrestito = idPrestito;
}
public int getIdLibro() {
	return idLibro;
}
public void setIdLibro(int idLibro) {
	this.idLibro = idLibro;
}
public int getIdUtente() {
	return idUtente;
}
public void setIdUtente(int idUtente) {
	this.idUtente = idUtente;
}
public boolean isRestituito() {
	return restituito;
}
public void setRestituito(boolean restituito) {
	this.restituito = restituito;
}


}
