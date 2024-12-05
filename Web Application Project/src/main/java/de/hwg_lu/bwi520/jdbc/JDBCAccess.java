package de.hwg_lu.bwi520.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public abstract class JDBCAccess {

	Connection dbConn;
	String dbDrivername;
	String dbURL;
	String dbUser;
	String dbPassword;
	String dbSchema;
	public JDBCAccess() throws NoConnectionException{
		this.setDBParms();
		this.createConnection();
		this.setSchema();
	}
	public abstract void setDBParms();

	public void createConnection() throws NoConnectionException{
		try{
			Class.forName(dbDrivername);
			System.out.println("JDBC-Treiber erfolgreich geladen");
		
			dbConn = DriverManager.getConnection(
												dbURL,
	
												dbUser,
												dbPassword
												);
			System.out.println("Datenbankverbindung erfolgreich angelegt");
		}catch(Exception e){
			e.printStackTrace();
			throw new NoConnectionException();
		}
	}
	public abstract void setSchema() throws NoConnectionException;

	public Connection getConnection() throws NoConnectionException {
		return dbConn;
	}
}