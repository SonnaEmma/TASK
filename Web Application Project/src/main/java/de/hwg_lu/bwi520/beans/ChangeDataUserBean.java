package de.hwg_lu.bwi520.beans;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import de.hwg_lu.bwi520.jdbc.NoConnectionException;
import de.hwg_lu.bwi520.jdbc.PostgreSQLAccess;

public class ChangeDataUserBean {
	

	String vorname;
	String nachname;
	String username;
	String email;
	int tel_nr;
	String passwort;
	String rolle;
	String abteilung;
	

	public ChangeDataUserBean() {
		//this.personal_nr=0;
		this.vorname="";
		this.nachname="";
		this.username=""; 
		this.email="";
		this.tel_nr=0;
		this.passwort="";
		this.rolle="";
		this.abteilung="";
	}

	
	public void enterDataUser(String benutzername) throws NoConnectionException, SQLException {
		String sql = "SELECT vorname, nachname, email, benutzername, password, telefonnummer, rolle, abteilung from mitarbeiter where "
				+ "active=true and benutzername=?";
		System.out.println(sql);

		PreparedStatement prep = new PostgreSQLAccess().
				 getConnection().
				 prepareStatement(sql);
		prep.setString(1, benutzername);
		
		 ResultSet dbRes = prep.executeQuery();
		 
		 	while(dbRes.next()) {
		 		//this.personal_nr = dbRes.getInt("personalnummer");
		 		this.vorname		= dbRes.getString("vorname");
		 		this.nachname		= dbRes.getString("nachname");
		 		this.email		= dbRes.getString("email");
		 		this.username		= dbRes.getString("benutzername");
		 		this.passwort		= dbRes.getString("password");
		 		this.tel_nr		= dbRes.getInt("telefonnummer");
		 		this.rolle		= dbRes.getString("rolle");
		 		this.abteilung		= dbRes.getString("abteilung");
		 	
		 	}
		
		 	System.out.println("Daten von " + benutzername + "werden gerade angezeigt");
		
	}
	
	public void changeDataUser (String changeVorname ,String changeNachname, String changeEmail, String changeUsername,  
			 String changePasswort, int changeTel_nr, String changeRolle, String changeAbteilung) throws SQLException {
		
		String sql = "UPDATE Mitarbeiter SET vorname=?, nachname=?, email=?, benutzername=?,"
				+ " password=?, telefonnummer=?, rolle=?, abteilung=? WHERE Benutzername = ?";
		
		System.out.println(sql);
		PreparedStatement prep = new PostgreSQLAccess().
					getConnection().
					prepareStatement(sql);
		
		prep.setString(1, changeVorname);
		prep.setString(2, changeNachname);
		prep.setString(3, changeEmail);
		prep.setString(4, changeUsername);
		prep.setString(5, changePasswort);
		prep.setInt(6, changeTel_nr);
		prep.setString(7, changeRolle);
		prep.setString(8, changeAbteilung);
		prep.setString(9, changeUsername);
		
		prep.executeUpdate();
		
		System.out.println("Daten des Benutzers wurden erfolgreich geändert.");
	}
	
	



	public String getVorname() {
		return vorname;
	}


	public void setVorname(String vorname) {
		this.vorname = vorname;
	}


	public String getNachname() {
		return nachname;
	}


	public void setNachname(String nachname) {
		this.nachname = nachname;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}



	public int getTel_nr() {
		return tel_nr;
	}


	public void setTel_nr(int tel_nr) {
		this.tel_nr = tel_nr;
	}


	public String getPasswort() {
		return passwort;
	}


	public void setPasswort(String passwort) {
		this.passwort = passwort;
	}


	public String getRolle() {
		return rolle;
	}


	public void setRolle(String rolle) {
		this.rolle = rolle;
	}


	public String getAbteilung() {
		return abteilung;
	}


	public void setAbteilung(String abteilung) {
		this.abteilung = abteilung;
	}

	
	
}
