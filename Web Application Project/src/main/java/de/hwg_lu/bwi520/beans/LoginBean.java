package de.hwg_lu.bwi520.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import de.hwg_lu.bwi520.jdbc.NoConnectionException;
import de.hwg_lu.bwi520.jdbc.PostgreSQLAccess;

public class LoginBean {

	
	String password;
	boolean loggedIn;
	String benutzername;
	int personalnummer;
	
	public LoginBean() {
		
		this.benutzername ="";
		this.password="";
		this.personalnummer=0;
		
	}

	
public boolean checkUsernamePassword() throws NoConnectionException, SQLException {
		
		String sql= "select benutzername,personalnummer from mitarbeiter where benutzername=? and password=? and active =true";
		System.out.println(sql);
		
		PreparedStatement prep= new PostgreSQLAccess().getConnection().prepareStatement(sql);
		prep.setString(1, this.benutzername);
		prep.setString(2, this.password);
		ResultSet dbRes= prep.executeQuery();
		if(dbRes.next()) {
			benutzername   = dbRes.getString("benutzername").trim();
			personalnummer =dbRes.getInt("personalnummer");
			 
			return true;
		};
		
		return false;
	}
public String getInfoMitarbeiterhtml() throws NoConnectionException, SQLException {

    String sql = "SELECT vorname, nachname, benutzername, rolle FROM mitarbeiter WHERE benutzername=? AND password=? and active =true";
    String getData = "";

    try (Connection conn = new PostgreSQLAccess().getConnection();
         PreparedStatement prep = conn.prepareStatement(sql)) {
        
        prep.setString(1, this.benutzername);
        prep.setString(2, this.password);
        
        try (ResultSet dbRes = prep.executeQuery()) {
            if (dbRes.next()) {
            	getData += "<h3 style= 'text-align: center;'>" + dbRes.getString("vorname").trim() + " ";
            	getData += dbRes.getString("nachname").trim() + " ist angemeldet als '" + dbRes.getString("benutzername").trim() + "'  in der Rolle '" +dbRes.getString("rolle").trim();
            	getData += "' </h3>";
            }
        }
    }

    return getData;
}



public String checkRolle() throws NoConnectionException, SQLException {

    String sql = "SELECT rolle FROM mitarbeiter WHERE benutzername=? AND password=? and active =true";
    String checkRolle = "";

    try (Connection conn = new PostgreSQLAccess().getConnection();
         PreparedStatement prep = conn.prepareStatement(sql)) {
        
        prep.setString(1, this.benutzername);
        prep.setString(2, this.password);
        
        try (ResultSet dbRes = prep.executeQuery()) {
            if (dbRes.next()) {
                checkRolle = dbRes.getString("rolle").trim();
            }
        }
    }

    return checkRolle;
}

public String getAltesPasswort() throws NoConnectionException, SQLException {

    String sql = "SELECT password FROM mitarbeiter WHERE benutzername=? AND active =true";
    String altesPasswort = "";

    try (Connection conn = new PostgreSQLAccess().getConnection();
         PreparedStatement prep = conn.prepareStatement(sql)) {
        
        prep.setString(1, this.benutzername);
        
        try (ResultSet dbRes = prep.executeQuery()) {
            if (dbRes.next()) {
            	altesPasswort = dbRes.getString("password").trim();
            }
        }
    }
 
    return altesPasswort;
}

public void updateNewPassword(String altesPasswort) throws SQLException {
	String sql = "UPDATE Mitarbeiter SET password = ? WHERE Benutzername = ?";
	System.out.println(sql);
	PreparedStatement prep = new PostgreSQLAccess().
				getConnection().
				prepareStatement(sql);
	prep.setString(1, altesPasswort);
	prep.setString(2, this.benutzername);

	prep.executeUpdate();
	
}

public int getMitarbeiterId() throws NoConnectionException, SQLException {
    int mitarbeiterId = -1;
    String sql = "SELECT Personalnummer FROM mitarbeiter WHERE benutzername=? AND password=? and active = true";

    try (PreparedStatement prep = new PostgreSQLAccess().
      getConnection().
      prepareStatement(sql)) {

        prep.setString(1, this.benutzername);
        prep.setString(2, this.password);

        try (ResultSet dbRes = prep.executeQuery()) {
            if (dbRes.next()) {
                mitarbeiterId = dbRes.getInt("Personalnummer");
            }
        }
    }

    return mitarbeiterId;
}

public String getBenutzername() {
	return benutzername;
}

public void setBenutzername(String benutzername) {
	this.benutzername = benutzername;
}

public int getPersonalnummer() {
	return personalnummer;
}
public void setPersonalnummer(int personalnummer) {
	this.personalnummer = personalnummer;
}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isLoggedIn() {
		return loggedIn;
	}

	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}

}
