package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.ConnessioneDB;
import model.Prestito;

public class prestitoDAO {
	public static boolean inserisciPrestito(Prestito p) {
	    boolean righeAggiornate = false;
	    try {
	        ConnessioneDB.connect();

	        String query = "INSERT INTO `biblioteca_ascoli`.`prestito` (idLibro, idUtente, restituito,data) VALUES (?, ?, 1,?)";
	        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	        ps.setInt(1, p.getIdLibro());
	        ps.setInt(2, p.getIdUtente());
	        ps.setString(3, p.getData());
	       

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
	public static List<Prestito> getPrestitiByUtente(int idUtente) {
        List<Prestito> prestiti = new ArrayList<>();
        try {
            ConnessioneDB.connect();

            String query = "SELECT * FROM `biblioteca_ascoli`.`prestito` WHERE idUtente = ?";
            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
            ps.setInt(1, idUtente);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idLibro = rs.getInt("idLibro");
                int idPrestito = rs.getInt("idPrestito");
                String data = rs.getString("data");
                int restituito = rs.getInt("restituito");
                boolean restituitoB=false;
                if(restituito==1) {
                restituitoB=false;
                }
                else {
                	restituitoB=true;
                }

                Prestito prestito = new Prestito(idPrestito, idLibro, idUtente, restituitoB, data);
                prestito.setDataRestituzione(prestito.getDataRestituzione());
                prestiti.add(prestito);
            }

            rs.close();
            ps.close();
            ConnessioneDB.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return prestiti;
    }
	public static boolean restituisciPrestito(int idPrestito, String dataRestituzione) {
        boolean righeAggiornate = false;
        try {
            ConnessioneDB.connect();

            String query = "UPDATE `biblioteca_ascoli`.`prestito` SET restituito = 0, dataRestituzione = ? WHERE idPrestito = ?";
            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
            ps.setString(1, dataRestituzione);
            ps.setInt(2, idPrestito);

            int righeaggiornate = ps.executeUpdate();
            if (righeaggiornate > 0) {
                righeAggiornate = true;
            }

            ps.close();
            ConnessioneDB.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return righeAggiornate;
    }
	 public static String getDataRestituzioneById(int idPrestito) {
	        String dataRestituzione = null;
	        try {
	            ConnessioneDB.connect();

	            String query = "SELECT dataRestituzione FROM `biblioteca_ascoli`.`prestito` WHERE idPrestito = ?";
	            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	            ps.setInt(1, idPrestito);

	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                dataRestituzione = rs.getString("dataRestituzione");
	            }

	            rs.close();
	            ps.close();
	            ConnessioneDB.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return dataRestituzione;
	    }
	 public static List<Prestito> getPrestitiByAll( ) {
	        List<Prestito> prestiti = new ArrayList<>();
	        try {
	            ConnessioneDB.connect();

	            String query = "SELECT * FROM `biblioteca_ascoli`.`prestito`";
	            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	           

	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                int idLibro = rs.getInt("idLibro");
	                int idPrestito = rs.getInt("idPrestito");
	                String data = rs.getString("data");
	                int restituito = rs.getInt("restituito");
	                int idUtente=rs.getInt("idUtente");
	                System.out.println(idUtente);
	                boolean restituitoB=false;
	                if(restituito==1) {
	                restituitoB=false;
	                }
	                else {
	                	restituitoB=true;
	                }

	                Prestito prestito = new Prestito(idPrestito, idLibro, idUtente, restituitoB, data);
	                prestito.setDataRestituzione(prestito.getDataRestituzione());
	                prestiti.add(prestito);
	            }

	            rs.close();
	            ps.close();
	            ConnessioneDB.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return prestiti;
	    }
}
