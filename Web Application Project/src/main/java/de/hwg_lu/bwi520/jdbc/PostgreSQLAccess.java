package de.hwg_lu.bwi520.jdbc;

import java.sql.SQLException;

public class PostgreSQLAccess extends JDBCAccess {

	public PostgreSQLAccess() throws NoConnectionException {
		super();
	}
	public void setDBParms(){
		dbDrivername = "org.postgresql.Driver";
		dbURL        = "<URL>";
		dbUser       = "<User>";
		dbPassword   = "<Password>";
		dbSchema     = "<schema>";
		
	}
	public void setSchema() throws NoConnectionException {
		this.setSchema(dbSchema);
	}
	public PostgreSQLAccess(String currentSchema) throws NoConnectionException, SQLException {
		super();
		this.createSchemaIfNotExists(currentSchema);
		this.setSchema(currentSchema);
	}
	public void createSchemaIfNotExists(String currentSchema) throws SQLException{
		String sql = "create schema if not exists " + currentSchema;
		System.out.println(sql);
		dbConn.prepareStatement(sql).execute();
		System.out.println("Schema " + dbSchema + " muesste jetzt existieren");
	}
	public void setSchema(String currentSchema) throws NoConnectionException {
		try{
			String sql = "SET SCHEMA '" + currentSchema + "'";
			System.out.println(sql);
			dbConn.createStatement().execute(sql);
			System.out.println("Schema " + currentSchema + " gesetzt");
		}catch(SQLException se){
			se.printStackTrace();
			throw new NoConnectionException();
		}
	}
	public static void main(String[] args) throws SQLException { 
		new PostgreSQLAccess().getConnection();
	}
}