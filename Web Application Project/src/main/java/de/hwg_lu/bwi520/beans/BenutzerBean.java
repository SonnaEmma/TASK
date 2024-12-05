package de.hwg_lu.bwi520.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import de.hwg_lu.bwi520.jdbc.NoConnectionException;
import de.hwg_lu.bwi520.jdbc.PostgreSQLAccess;
import de.hwg_lu.bwi520.keineBeans.Benutzer;

public class BenutzerBean {
       
	Vector <Benutzer> benutzerTabelleInaktiv; //für inaktive User
	Vector <Benutzer> benutzerTabelleAktiv; //für aktive User
	 
public BenutzerBean() throws NoConnectionException, SQLException {
		this.benutzerTabelleAktiv= new Vector<Benutzer> ();
		this.getMitarbeiterFromDB(); //für aktive User
		
		this.benutzerTabelleInaktiv= new Vector<Benutzer> ();
		this.getMitarbeiterInaktivFromDB(); //für inaktive User
		
		
} 

	
//Ausgabe aller Benutzer die aktiv sind
public String getAlleBenutzer () {
		
		String html="";
		
		for(Benutzer myBenutzer: this.benutzerTabelleAktiv) {
			
	html+= "<tr>\n";
	html+= " <td>"+ myBenutzer.getPersonal_nr() +"</td>";
	html+=	" <td>"+ myBenutzer.getVorname()  +"</td>";
				html+= "<td>"+ myBenutzer.getNachname() +"</td>";
				html+= "<td>"+ myBenutzer.getUsername() +"</td>";
				html+= "<td>"+ myBenutzer.getEmail() 	+"</td>";
				html+= "<td>"+ myBenutzer.getRolle() 	+"</td>";
				html+= "<td>" + "<a href='./TaskAppl.jsp?action=inaktiv&"
				
								 + "userid=" + myBenutzer.getUsername() + "'> Deaktivieren </a> <br> <a href='./MitarbeiterAppl.jsp?action=bearbeiten&" + "userid2=" + myBenutzer.getUsername()+ "'> Bearbeiten </a>"
								+ " </td>";
		}
		
		html +="</tr>";
		return html;
}
	
	
//Benutzer auf "inaktiv" setzen wenn der nicht mehr im Unternehmen tätig ist.	
public void userStatusInaktiv(String usernameAktiv) throws SQLException {

		    String sql = "UPDATE Mitarbeiter SET active = false WHERE Benutzername = ?";
		    System.out.println(sql);

		    // Hier sollte eine Verbindung zur Datenbank geöffnet werden
		    try (Connection connection = new PostgreSQLAccess().getConnection();
		         PreparedStatement prep = connection.prepareStatement(sql)) {
		        
		        // Setze den Benutzernamen als Parameter für das PreparedStatement
		        prep.setString(1, usernameAktiv);

		        // Führe das Update-Statement aus
		        int rowsUpdated = prep.executeUpdate();
		        
		        if (rowsUpdated > 0) {
		            System.out.println("Der Status des Benutzers wurde erfolgreich geändert.");
		        } else {
		            System.out.println("Kein Benutzer mit diesem Benutzernamen gefunden.");
		        }
		    } catch (SQLException e) {
		        // Fehlerbehandlung
		        e.printStackTrace();
		        throw e; // Fehler weiterwerfen, damit sie außerhalb der Methode behandelt werden können
		    }
		 
		 // bis hierhin DB-Pflege
		 // jetzt noch Hauptspeicher bzw. Vector-Pflege
		 		this.benutzerTabelleInaktiv.clear();
		 		this.getMitarbeiterInaktivFromDB();
		 		//
		 		this.benutzerTabelleAktiv.clear();
				this.getMitarbeiterFromDB();
		 	
}
		

	
//zeige alle User an, die aktiv sind
public void getMitarbeiterFromDB() throws NoConnectionException, SQLException {
		this.benutzerTabelleAktiv.clear();
		
		String sql = "SELECT personalnummer, vorname, nachname, benutzername, email, rolle from mitarbeiter where active=true order by personalnummer asc";
		System.out.println(sql);
		ResultSet dbRes = new PostgreSQLAccess().getConnection().
							prepareStatement(sql).executeQuery();
		while (dbRes.next()) {
			this.benutzerTabelleAktiv.add(
				new Benutzer(
					dbRes.getInt("personalnummer"),
					dbRes.getString("vorname").trim(),
					dbRes.getString("nachname").trim(),
					dbRes.getString("benutzername").trim(),
					dbRes.getString("email"),
					dbRes.getString("rolle").trim()
				)
			);
		}
}
	


//Alle Methoden für die Verwaltung von inaktiven Usern
//Ausgabe aller Benutzer die inaktiv sind
public String getAlleBenutzerInaktiv () {
	
	String html="";
	
	for(Benutzer myBenutzer: this.benutzerTabelleInaktiv) {
		
html+= "<tr>\n";
html+= " <td>"+ myBenutzer.getPersonal_nr() +"</td>";
html+=	" <td>"+ myBenutzer.getVorname()  +"</td>";
			html+= "<td>"+ myBenutzer.getNachname() +"</td>";
			html+= "<td>"+ myBenutzer.getUsername() +"</td>";
			html+= "<td>"+ myBenutzer.getEmail() 	+"</td>";
			html+= "<td>"+ myBenutzer.getRolle() 	+"</td>";
			html+= "<td>" + "<a href='./MitarbeiterAppl.jsp?action=aktiv&"
			
							 + "userid3=" + myBenutzer.getUsername() + "'> Aktivieren </a>" + "<a href='./MitarbeiterAppl.jsp?action=delete&"
							 
							 + "userid4=" + myBenutzer.getUsername()+ "'> Loeschen </a>"
							 
							 + " </td>";
	}
	
	html +="</tr>";
	return html;
}


public void userStatusAktiv (String usernameAktiv) throws SQLException {

String sql = "UPDATE Mitarbeiter SET active = true WHERE Benutzername = ? ";

System.out.println(sql);
PreparedStatement prep = new PostgreSQLAccess().
			getConnection().
			prepareStatement(sql);
prep.setString(1, usernameAktiv);
prep.executeUpdate();

System.out.println("Der Status des Benutzers wurde erfolgreich geaendert.");

// bis hierhin DB-Pflege
// jetzt noch Hauptspeicher bzw. Vector-Pflege
		this.benutzerTabelleAktiv.clear();
		this.getMitarbeiterFromDB();
		//
		this.benutzerTabelleInaktiv.clear();
 		this.getMitarbeiterInaktivFromDB();

}




public void deleteOneAccount(String myBenutzername) throws SQLException {
	String sql = "delete from mitarbeiter where benutzername = ?";
	System.out.println(sql);
	PreparedStatement prep = new PostgreSQLAccess().
				getConnection().
				prepareStatement(sql);
	prep.setString(1, myBenutzername);
	prep.executeUpdate();
		// bis hierhin DB-Pflege
		// jetzt noch Hauptspeicher bzw. Vector-Pflege
	this.benutzerTabelleInaktiv.clear();
	this.getMitarbeiterInaktivFromDB();
}


//zeige alle User an, die inaktiv sind

public void getMitarbeiterInaktivFromDB() throws NoConnectionException, SQLException {
			String sql = "SELECT personalnummer, vorname, nachname, benutzername, email, rolle from mitarbeiter where active =false";
			System.out.println(sql);
			ResultSet dbRes = new PostgreSQLAccess().getConnection().
								prepareStatement(sql).executeQuery();
			while (dbRes.next()) {
				this.benutzerTabelleInaktiv.add(
					new Benutzer(
						dbRes.getInt("personalnummer"),
						dbRes.getString("vorname").trim(),
						dbRes.getString("nachname").trim(),
						dbRes.getString("benutzername").trim(),
						dbRes.getString("email"),
						dbRes.getString("rolle").trim()
					)
				);
			}
		}

}
