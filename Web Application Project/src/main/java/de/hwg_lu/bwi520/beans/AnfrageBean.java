package de.hwg_lu.bwi520.beans;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import de.hwg_lu.bwi520.jdbc.NoConnectionException;
import de.hwg_lu.bwi520.jdbc.PostgreSQLAccess;


public class AnfrageBean {

	int personalnummer;
//	int Anfrageid;
	String Anfragetype;
	String Kategorie;
	String  Beschreibung;
	String festellungsdatum;
//	String sendedatum;
	String Status;
	String personalidString;
	
	
	public String getPersonalidString() {
		return personalidString;
	}

	public void setPersonalidString(String personalidString) {
		this.personalidString = personalidString;
	}

	
	public AnfrageBean() {
	super();
	this.Anfragetype ="";
	this.Beschreibung ="";
	this.festellungsdatum ="";
	this.Kategorie =
	this.Status ="Reported";
	this.personalnummer=0;
	
}
	public  int personalidInt()throws NoConnectionException, SQLException {
		
		int x=0;
		String sql = "select personalnummer from Mitarbeiter "
							+ "where Benutzername =?";
		System.out.println(sql);
		PreparedStatement prep = new PostgreSQLAccess().getConnection().prepareStatement(sql);
		prep.setString(1,  this.personalidString);
		ResultSet dbRes = prep.executeQuery();
		while(dbRes.next()) { 
			x =dbRes.getInt("personalnummer");
		}
		return x;
	}
	public void insertAnfrage() throws NoConnectionException, SQLException {
	
		String sql= "insert into anfrage"
				+ "(anfragetype, Beschreibung, festellungsdatum, Kategorie, Status, personalnummer "
				+ ") "
				+ "values (?,?,?,?,?,?) ";
		System.out.println(sql);
		
		//JDBC: Connection, Statement-Objekt, Daten reinschreiben, execute
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, this.Anfragetype);
		prep.setString(2, this.Beschreibung);
		prep.setString(3, this.festellungsdatum);
		prep.setString(4, this.Kategorie);
		prep.setString(5, this.Status);
		prep.setInt(6, this.personalnummer);
		
		prep.executeUpdate();
		System.out.println("Anfrage  erfolgreich angelegt");
	}
	
	public String readAllAnfrageFromDB() throws NoConnectionException, SQLException {
		String html ="";
		String sql = "select Anfrage_id, Anfragetype, Kategorie, Beschreibung, Festellungsdatum, erstellt_am, Status "
							+ "from ANFRAGE "
							+ "where Personalnummer =?";
		System.out.println(sql);
		PreparedStatement prep = new PostgreSQLAccess().getConnection().prepareStatement(sql);
		prep.setInt(1,  this.personalidInt());
		ResultSet dbRes = prep.executeQuery();
		while(dbRes.next()) {
				int  Anfrage_id   = dbRes.getInt("Anfrage_id");
				String  Anfragetype   = dbRes.getString("Anfragetype").trim();
				String  Kategorie   = dbRes.getString("Kategorie").trim();
				String  Beschreibung   = dbRes.getString("Beschreibung").trim();
				String  Festellungsdatum   = dbRes.getString("Festellungsdatum").trim();
				String  erstellt_am   = dbRes.getString("erstellt_am").trim();
				String  Status   = dbRes.getString("Status").trim();
			html += "<tr>\r\n"
					+ "			<td>"+Anfrage_id+"<td/>\r\n"
					+ "			<td>"+Anfragetype+"<td/>\r\n"
					+ "			<td>"+Kategorie+"<td/>\r\n"
					+ "			<td>"+Beschreibung+"<td/>\r\n"
					+ "			<td>"+Festellungsdatum+"<td/>\r\n"
					+ "			<td>"+erstellt_am+"<td/>\r\n"
					+ "			<td>"+Status+"<td/>\r\n"
					+ "	<tr/>\r\n"
					+ "	";
		}
			return html;
		}
	
	
	

	public int getPersonalnummer() {
		return personalnummer;
	}
	public void setPersonalnummer(int personalnummer) {
		this.personalnummer = personalnummer;
	}
	public String getAnfragetype() {
		return Anfragetype;
	}
	public void setAnfragetype(String anfragetype) {
		Anfragetype = anfragetype;
	}
	public String getKategorie() {
		return Kategorie;
	}
	public void setKategorie(String kategorie) {
		Kategorie = kategorie;
	}
	public String getBeschreibung() {
		return Beschreibung;
	}
	public void setBeschreibung(String beschreibung) {
		Beschreibung = beschreibung;
	}
	public String getFestellungsdatum() {
		return festellungsdatum;
	}
	public void setFestellungsdatum(String festellungsdatum) {
		this.festellungsdatum = festellungsdatum;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}

	
	
}
