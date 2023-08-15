package model;

public class Bibliotecario extends Utente  {

private int idBliblotecario;




public Bibliotecario(int idUtente, String email, String password, String nomeUtente, int idBliblotecario) {
	super( email, password, nomeUtente, nomeUtente);
	this.idBliblotecario = idBliblotecario;
}

public int getIdBliblotecario() {
	return idBliblotecario;
}

public void setIdBliblotecario(int idBliblotecario) {
	this.idBliblotecario = idBliblotecario;
}

@Override
public String toString() {
	return "Bibliotecario [idBliblotecario=" + idBliblotecario + "]";
}


}
