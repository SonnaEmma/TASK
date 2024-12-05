package de.hwg_lu.bwi520.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import de.hwg_lu.bwi520.jdbc.WrongAttributesException;
import de.hwg_lu.bwi520.jdbc.NoConnectionException;
import de.hwg_lu.bwi520.jdbc.PostgreSQLAccess;

public class TaskBean {
	
	//int personal_nr;
	String vorname;
	String nachname;
	String username;
	String email;
	int tel_nr;
	String passwort;
	String rolle;
	String abteilung;
	boolean active;
	boolean admin;
	
	
	public TaskBean() {
		
		//this.personal_nr=0;
		this.vorname="";
		this.nachname="";
		this.username="";
		this.email="";
		this.tel_nr=0;
		this.passwort="";
		this.rolle="";
		this.abteilung="";
		this.active = true;
		this.admin = false;
		
	}

	

public boolean insertAccountIfNotExists() throws NoConnectionException, SQLException {
	//true - Account wurde angelegt (gab es noch nicht)
	//false - Account existiert schon, konnte nicht angelegt werden
	this.prepareAttributesForDB();
	if (this.checkAccountExists()) {
		System.out.println("Account " + this.username + " existiert bereits");
		return false;
	} else {
		this.insertAccountNoCheck();
		return true;
	}
}


public void insertAccountNoCheck() throws NoConnectionException, SQLException {
	//in Datenbank-Tabelle Account
	//mit PreparedStatements
	
	String sql= "insert into mitarbeiter "
			+ "(vorname, nachname, email, benutzername, password, telefonnummer, rolle, "
			+ "abteilung) "
			+ "values (?,?,?,?,?,?,?,?)";
	System.out.println(sql);
	
	//JDBC: Connection, Statement-Objekt, Daten reinschreiben, execute
	Connection dbConn = new PostgreSQLAccess().getConnection();
	PreparedStatement prep = dbConn.prepareStatement(sql);
	
	//prep.setInt( this.personal_nr);
	prep.setString(1, this.vorname);
	prep.setString(2, this.nachname);
	prep.setString(3, this.email);
	prep.setString(4, this.username);
	prep.setString(5, this.passwort);
	prep.setInt(6, this.tel_nr);
	prep.setString(7, this.rolle);
	prep.setString(8, this.abteilung);
	
	prep.executeUpdate();
	System.out.println("Account erfolgreich angelegt");
	
	
}

	//Überprüfe ob ein Konto schon im System vorhanden ist.

public boolean checkAccountExists() throws NoConnectionException, SQLException {
	//kommt die personalnummer  bereits in der Tabelle Account vor?
	//true = Account existiert schon
	//false = Account existiert nicht
	String sql = "select personalnummer from mitarbeiter "
			+ "where benutzername = ? and email=?";
	System.out.println(sql);
	
	PreparedStatement prep = new PostgreSQLAccess().getConnection().prepareStatement(sql);
	prep.setString(1, this.username);
	prep.setString(2, this.email);
	return prep.executeQuery().next();
}
	
	
public void prepareAttributesForDB() throws SQLException {
	if (this.username.length() > 50) throw new WrongAttributesException ("Username darf hoechstens 50 Zeichen haben");
	if (this.passwort.length() > 70) throw new WrongAttributesException("Password darf hoechstens 70 Zeichen haben");
	//if (this.age < 0) throw new WrongAttributesException("Das Alter darf nicht kleiner als 0 sein");
	//if (this.age > 100) throw new WrongAttributesException("Das Alter darf nicht gr��er als 100 sein");
	if (this.email.length() > 256) throw new WrongAttributesException("Email-Adresse darf hoechstens 256 Zeichen haben");
}	





	

	/*public int getPersonal_nr() {
		return personal_nr;
	}


	public void setPersonal_nr(int personal_nr) {
		this.personal_nr = personal_nr;
	}*/




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



	public boolean isActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}


	public boolean isAdmin() {
		return admin;
	}


	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	
}
