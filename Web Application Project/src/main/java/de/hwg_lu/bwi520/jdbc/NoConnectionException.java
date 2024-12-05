package de.hwg_lu.bwi520.jdbc;

import java.sql.SQLException;

@SuppressWarnings("serial")
public class NoConnectionException extends SQLException {
	
	public NoConnectionException(){
		super("Erzeugung der JDBC-Connection ist fehlgeschlagen");
	}
	public NoConnectionException(String msg){
		super(msg);
	}
	
}
