package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.ConnessioneDB;

import model.Utente;

public class utenteDAO {

	public static boolean inserisciUtente(Utente u) {
	    boolean righeAggiornate = false;
	    try {
	        ConnessioneDB.connect();

	        String query = "INSERT INTO `biblioteca_ascoli`.`utente` (nome, email, password,tipo) VALUES (?, ?, ?,utente)";
	        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	        ps.setString(1, u.getNomeUtente());
	        ps.setString(2, u.getEmail());
	        ps.setString(3, u.getPassword());

	        int righeInserite = ps.executeUpdate();
	        if (righeInserite > 0) {
	            righeAggiornate = true;
	        }

	        ps.close();
	        ConnessioneDB.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return righeAggiornate;
	}

	public static List<Utente> listaUtenti() {
	    List<Utente> lista = new ArrayList<Utente>();
	    try {
	        ConnessioneDB.connect();

	        String query = "SELECT * FROM biblioteca_ascoli.utente";
	        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            String username = rs.getString("nome");
	            String email = rs.getString("email");
	            String password = rs.getString("password");
	            String tipo=rs.getString("tipo");
	            Utente utente = new Utente(email, password, username,tipo);
	            
	            utente.setIdUtente(rs.getInt("idUtente"));
	            lista.add(utente);
	        }

	        rs.close();
	        ps.close();
	        ConnessioneDB.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return lista;
	}
	public static Utente getUtenteById(int idUtente) {
	    Utente utente = null;
	    try {
	        ConnessioneDB.connect();

	        String query = "SELECT * FROM `biblioteca_ascoli`.`utente` WHERE idUtente = ?";
	        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	        ps.setInt(1, idUtente);

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            int id = rs.getInt("idUtente");
	            String nomeUtente = rs.getString("nome");
	            String email = rs.getString("email");
	            String password = rs.getString("password");
	            String tipo = rs.getString("tipo");

	            // Costruisci l'oggetto Utente con i dati ottenuti dal database
	            utente = new Utente( email, password, nomeUtente, tipo);
	        }

	        rs.close();
	        ps.close();
	        ConnessioneDB.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return utente;
	}
}
