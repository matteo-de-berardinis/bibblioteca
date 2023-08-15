package data;

import java.sql.Connection;
import java.sql.SQLException;

import com.mysql.cj.jdbc.MysqlDataSource;

public class ConnessioneDB {
	private static Connection con = null;
	//parametri di configurazione del DB
	private static final String NOME_DB = "biblioteca_ascoli";
	private static final int PORT = 3306;
	private static final String SERVER_NAME = "localhost";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "ruut";
	
	
	public static Connection getCon() {
		return con;
	}
		// metodo di connessione al db con i parametri corretti
		public static void connect() throws SQLException {
			if (con == null) {

				// oggeto di tipo MysqlDataSource per settare i parametri di configurazione
				MysqlDataSource dataSource = new MysqlDataSource();
				dataSource.setDatabaseName(NOME_DB);
				dataSource.setPortNumber(PORT);
				dataSource.setServerName(SERVER_NAME);
				dataSource.setUser(USERNAME);
				dataSource.setPassword(PASSWORD);

				con = dataSource.getConnection();

				System.out.println("Connessione avvenuta con il database : " + con.getCatalog());

			}

		}
		public static void close() throws SQLException {
			try {
				con.close();
				con = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
