package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.ConnessioneDB;
import model.Libro;
import model.Utente;

public class libroDAO {
	public static List<Libro> listaLibri() {
	    List<Libro> lista = new ArrayList<Libro>();
	    try {
	        ConnessioneDB.connect();

	        String query = "SELECT * FROM biblioteca_ascoli.libro";
	        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            String nome = rs.getString("nome");
	            String genere = rs.getString("genere");
	            int nCopie = rs.getInt("nCopie");
	            Libro l = new Libro(nome, genere, nCopie);
	            l.setIdLibro(rs.getInt("idLibro"));
	            lista.add(l);
	        }

	        rs.close();
	        ps.close();
	        ConnessioneDB.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return lista;
	}
	 public static Libro getLibroById(int idLibro) {
	        Libro libro = null;
	        try {
	            ConnessioneDB.connect();

	            String query = "SELECT * FROM `biblioteca_ascoli`.`libro` WHERE idLibro = ?";
	            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	            ps.setInt(1, idLibro);

	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                String nome = rs.getString("nome");
	                String genere = rs.getString("genere");
	                int nCopie = rs.getInt("nCopie");
	                libro = new Libro(nome, genere, nCopie);
	                libro.setIdLibro(idLibro);
	            }

	            rs.close();
	            ps.close();
	            ConnessioneDB.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return libro;
	    }
	 public static boolean sottraiCopiaLibro(int idLibro) {
	        boolean copiaSottratta = false;
	        try {
	            ConnessioneDB.connect();

	            String query = "UPDATE `biblioteca_ascoli`.`libro` SET nCopie = nCopie - 1 WHERE idLibro = ?";
	            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	            ps.setInt(1, idLibro);

	            int righeAggiornate = ps.executeUpdate();
	            if (righeAggiornate > 0) {
	                copiaSottratta = true;
	            }

	            ps.close();
	            ConnessioneDB.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        

	        return copiaSottratta;
	    }
	 public static boolean aggiungiCopiaLibro(int idLibro) {
	        boolean copiaSottratta = false;
	        try {
	            ConnessioneDB.connect();

	            String query = "UPDATE `biblioteca_ascoli`.`libro` SET nCopie = nCopie + 1 WHERE idLibro = ?";
	            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	            ps.setInt(1, idLibro);

	            int righeAggiornate = ps.executeUpdate();
	            if (righeAggiornate > 0) {
	                copiaSottratta = true;
	            }

	            ps.close();
	            ConnessioneDB.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        

	        return copiaSottratta;
	    }
	 public static String getNumeroCopieRimaste(int idLibro) {
	        String numeroCopieRimaste = null;
	        try {
	            ConnessioneDB.connect();

	            String query = "SELECT nCopie FROM `biblioteca_ascoli`.`libro` WHERE idLibro = ?";
	            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	            ps.setInt(1, idLibro);

	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                int nCopie = rs.getInt("nCopie");
	                numeroCopieRimaste = String.valueOf(nCopie);
	            }

	            rs.close();
	            ps.close();
	            ConnessioneDB.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return numeroCopieRimaste;
	    }
	 public static void creaLibro(String nome, String genere, int nCopie) {
		    try {
		        ConnessioneDB.connect();

		        String query = "INSERT INTO biblioteca_ascoli.libro (nome, genere, nCopie) VALUES (?, ?, ?)";
		        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
		        ps.setString(1, nome);
		        ps.setString(2, genere);
		        ps.setInt(3, nCopie);
		        ps.executeUpdate();

		        ps.close();
		        ConnessioneDB.close();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}
	 public static void modificaLibro(int idLibro, String nome, String genere, int copie) {
		    try {
		        ConnessioneDB.connect();

		        String query = "UPDATE `biblioteca_ascoli`.`libro` SET nome = ?, genere = ?, nCopie = ? WHERE idLibro = ?";
		        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
		        ps.setString(1, nome);
		        ps.setString(2, genere);
		        ps.setInt(3, copie);
		        ps.setInt(4, idLibro);

		        int rowsAffected = ps.executeUpdate();

		      

		        ps.close();
		        ConnessioneDB.close();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
	 }
		    public static List<Libro> cercaLibriPerTitolo(String titolo) {
		        List<Libro> risultati = new ArrayList<>();

		        try {
		            ConnessioneDB.connect();

		            String query = "SELECT * FROM libro WHERE nome LIKE ?";
		            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
		            ps.setString(1, "%" + titolo + "%");

		            ResultSet rs = ps.executeQuery();
		            while (rs.next()) {
		                int idLibro = rs.getInt("idLibro");
		                String nomeLibro = rs.getString("nome");
		                String genere = rs.getString("genere");
		                int copie = rs.getInt("nCopie");

		                Libro libro = new Libro( nomeLibro, genere, copie);
		                risultati.add(libro);
		            }

		            rs.close();
		            ps.close();
		            ConnessioneDB.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }

		        return risultati;
		    }
	 
		}


