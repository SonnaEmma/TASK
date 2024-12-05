package de.hwg_lu.bwi520.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import de.hwg_lu.bwi520.jdbc.NoConnectionException;
import de.hwg_lu.bwi520.jdbc.PostgreSQLAccess;
import de.hwg_lu.bwi520.keineBeans.Gegenstand;

public class GegenstandBean {

	int objekt_nr;
	
	String füllePersonalid;
	
	
	Vector <Gegenstand> objekteTabelle;
	
	public GegenstandBean() throws NoConnectionException, SQLException {
		
		this.objekteTabelle= new Vector<Gegenstand> ();
		this.getObjekteFromDB();

	
	}
	
	public String getAusgeliehene() throws SQLException {
	   
	    String sql = "SELECT produktnummer, name FROM gegenstaende WHERE produktnummer=?";
	    System.out.println(sql);

	    Connection dbConn = new PostgreSQLAccess().getConnection();
	    PreparedStatement prep = dbConn.prepareStatement(sql);
	    String html = "";

	        prep.setInt(1, this.objekt_nr);
	        ResultSet dbRes = prep.executeQuery();
 
	        // Durchlaufen der Ergebnisse
	        while (dbRes.next()) {
	            int produktnummer = dbRes.getInt("produktnummer");
	            String name = dbRes.getString("name");
	            
	            html+= "<tr>\n";
	            html+= " <td>"+ produktnummer+"</td>";
	            html+= " <td>"+ name+"</td>";
	            html+= " </tr>";
	        }

	    return html;
	    
}
	
public boolean checkIfUserOffeneAusleihenHat(int mitarbeiterId) throws SQLException {
	    String sqlCheck = "SELECT COUNT(*) FROM ausleihen " +
	                      "WHERE mitarbeiterID = ? " +
	                      "AND ausleihID NOT IN (SELECT ausleihID FROM rückgabe)";
	    
	    Connection connection = new PostgreSQLAccess().getConnection();
	    PreparedStatement prepCheck = connection.prepareStatement(sqlCheck);
	    prepCheck.setInt(1, mitarbeiterId);
	    
	    ResultSet resultSet = prepCheck.executeQuery();
	    resultSet.next();
	    
	    int offeneAusleihen = resultSet.getInt(1);
	    
	    // Der Benutzer kann nur ausleihen, wenn keine offenen Ausleihen vorhanden sind
	    return offeneAusleihen == 0;
	}
	
public void changeStatusAusgeliehene(int mitarbeiter_id, int produktnummer) throws SQLException {

    // Prüfen, ob der Benutzer ausleihen kann, bevor die Ausleihe durchgeführt wird
    if (!checkIfUserOffeneAusleihenHat(mitarbeiter_id)) {
        System.out.println("Der Benutzer hat noch nicht zurückgegebene Ausleihen und kann daher nicht erneut ausleihen.");
        return;
    } else {

        String sqlUpdateGegenstand = "UPDATE gegenstaende SET verfuegbarkeit = false, status= 'Ausgeliehen' WHERE produktnummer = ?";
        String sqlInsertAusleihen = "INSERT INTO ausleihen (produktnummer, MitarbeiterID) VALUES (?, ?)";

        Connection connection = new PostgreSQLAccess().getConnection();
        try {
            // Update der Tabelle "Gegenstände"
            PreparedStatement prepUpdate = connection.prepareStatement(sqlUpdateGegenstand);
            prepUpdate.setInt(1, produktnummer);
            prepUpdate.executeUpdate();

            PreparedStatement prepInsert = connection.prepareStatement(sqlInsertAusleihen);
            prepInsert.setInt(1, produktnummer);
            prepInsert.setInt(2, mitarbeiter_id);
            prepInsert.executeUpdate();

            System.out.println("Der Status des Objektes wurde erfolgreich geändert und die Ausleihe erfasst.");
        } catch (SQLException e) {
	        throw e; // Fehler weitergeben
	    }

	    // Hauptspeicher bzw. Vector-Pflege
	    this.objekteTabelle.clear();
	    this.getObjekteFromDB();
	 }
}

public void rueckgabeObjekt(int produktnummer, int mitarbeiterId) throws SQLException {

    String sqlUpdateGegenstand = "UPDATE gegenstaende SET verfuegbarkeit = true, status = 'verfuegbar' WHERE produktnummer = ?";
    String sqlInsertRückgabe = "INSERT INTO rueckgabe (produktnummer, mitarbeiterID) VALUES (?, ?)";

    Connection connection = new PostgreSQLAccess().getConnection();

    // Update der Tabelle "Gegenstände" durchführen
    PreparedStatement prepUpdateGegenstand = connection.prepareStatement(sqlUpdateGegenstand);
    prepUpdateGegenstand.setInt(1, produktnummer);
    prepUpdateGegenstand.executeUpdate();

    // Einfügen des Rückgabeeintrags in die Tabelle "Rückgabe"
    PreparedStatement prepInsertRückgabe = connection.prepareStatement(sqlInsertRückgabe);
    prepInsertRückgabe.setInt(1, produktnummer);
    prepInsertRückgabe.setInt(2, mitarbeiterId);
    prepInsertRückgabe.executeUpdate();

    System.out.println("Der Gegenstand wurde erfolgreich zurückgegeben und in der Rückgabetabelle erfasst.");

    this.objekteTabelle.clear();
    this.getObjekteFromDB();

	}
	
public String getAlleObjekte () {
		
		String html="";
		
		for(Gegenstand myObjekt: this.objekteTabelle) {
			
	html+= "<tr>\n";
	html+= " <td>"+ myObjekt.getProduktnummer() +"</td>";
	html+= " <td>"+ myObjekt.getName() +"</td>";
	html+=	" <td>"+ myObjekt.getBeschreibung()  +"</td>";
	html+= "<td>"+ myObjekt.getStatus() +"</td>";
	
	html+= "<td>" + "<input type='radio' name='objekte' value='" + myObjekt.getProduktnummer() + "' required /> </td> ";
				
		}
		
		html +="</tr>";
		return html;
}
	
public void getObjekteFromDB() throws NoConnectionException, SQLException {
		String sql = "SELECT produktnummer, name, beschreibung, status from gegenstaende where verfuegbarkeit=true order by produktnummer asc";
		System.out.println(sql);
		ResultSet dbRes = new PostgreSQLAccess().getConnection().
							prepareStatement(sql).executeQuery();
		while (dbRes.next()) {
			this.objekteTabelle.add(
				new Gegenstand(	
					dbRes.getInt("produktnummer"),	
					dbRes.getString("name").trim(),
					dbRes.getString("beschreibung").trim(),
					dbRes.getString("status").trim()
					
				)
			);
		}
}
	
public int getPersonalIDFeld() throws NoConnectionException, SQLException {

    String sql = "SELECT personalnummer FROM mitarbeiter WHERE benutzername=? and active =true";
    int pers_id=0;

    try (Connection conn = new PostgreSQLAccess().getConnection();
         PreparedStatement prep = conn.prepareStatement(sql)) {
        
        prep.setString(1, this.füllePersonalid);
        
        try (ResultSet dbRes = prep.executeQuery()) {
            if (dbRes.next()) {
            	pers_id = dbRes.getInt("personalnummer");
            }
        }
    }

    return pers_id;
}


	
//Für die GegenstandUpdateView bei SuperTechniker

public String getAlleObjekteMitAusleihernInHtml() throws SQLException {
    StringBuilder htmlResult = new StringBuilder();

    htmlResult.append("<h3 style='text-align:center;'>Liste aller Gegenstaende und deren Ausleiher</h3>");
    htmlResult.append("<table border='1' class='styled-table'>");
    htmlResult.append("<tr><th>Produktnummer</th><th>Name</th><th>Beschreibung</th><th>Verfügbarkeit</th><th>Status</th>");
    htmlResult.append("<th>Ausleih ID</th><th>Leihdatum</th><th>Mitarbeiter ID</th><th>Vorname</th><th>Nachname</th><th>Email</th>");
    htmlResult.append("<th>Rückgabe ID</th><th>Rückgabedatum</th></tr>");

    String sql = """
        SELECT g.Produktnummer, g.Name, g.Beschreibung, g.Verfuegbarkeit, g.Status,
               a.AusleihID, a.Leihdatum, 
               m.Personalnummer AS MitarbeiterID, m.Vorname, m.Nachname, m.Email,
               r.RueckgabeID, r.Rueckgabedatum
        FROM Gegenstaende g
        LEFT JOIN Ausleihen a ON g.Produktnummer = a.Produktnummer
        LEFT JOIN Mitarbeiter m ON a.MitarbeiterID = m.Personalnummer
        LEFT JOIN Rueckgabe r ON g.Produktnummer = r.Produktnummer AND a.MitarbeiterID = r.MitarbeiterID
        """;

    Connection conn = new PostgreSQLAccess().getConnection();
    PreparedStatement prep = conn.prepareStatement(sql);
    ResultSet resultSet = prep.executeQuery();

    while (resultSet.next()) {
        int produktnummer = resultSet.getInt("Produktnummer");
        String name = resultSet.getString("Name");
        String beschreibung = resultSet.getString("Beschreibung");
        boolean verfuegbarkeit = resultSet.getBoolean("Verfuegbarkeit");
        String status = resultSet.getString("Status");

        htmlResult.append("<tr>");
        htmlResult.append("<td>").append(produktnummer).append("</td>");
        htmlResult.append("<td>").append(name).append("</td>");
        htmlResult.append("<td>").append(beschreibung).append("</td>");
        htmlResult.append("<td>").append(verfuegbarkeit ? "Ja" : "Nein").append("</td>");
        htmlResult.append("<td>").append(status).append("</td>");

        int ausleihID = resultSet.getInt("AusleihID");
        if (!resultSet.wasNull()) {
            String leihdatum = resultSet.getString("Leihdatum");
            int mitarbeiterID = resultSet.getInt("MitarbeiterID");
            String vorname = resultSet.getString("Vorname");
            String nachname = resultSet.getString("Nachname");
            String email = resultSet.getString("Email");

            htmlResult.append("<td>").append(ausleihID).append("</td>");
            htmlResult.append("<td>").append(leihdatum).append("</td>");
            htmlResult.append("<td>").append(mitarbeiterID).append("</td>");
            htmlResult.append("<td>").append(vorname).append("</td>");
            htmlResult.append("<td>").append(nachname).append("</td>");
            htmlResult.append("<td>").append(email).append("</td>");
        } else {
            htmlResult.append("<td colspan='6'>Nicht ausgeliehen</td>");
        }

        int rueckgabeID = resultSet.getInt("RueckgabeID");
        if (!resultSet.wasNull()) {
            String rueckgabedatum = resultSet.getString("Rueckgabedatum");
            htmlResult.append("<td>").append(rueckgabeID).append("</td>");
            htmlResult.append("<td>").append(rueckgabedatum).append("</td>");
        } else {
            htmlResult.append("<td colspan='2'>Noch nicht zurückgegeben</td>");
        }
        
        htmlResult.append("</tr>");
    }

    htmlResult.append("</table>");

    return htmlResult.toString();
}




public String getFüllePersonalid() {
	return füllePersonalid;
}

public void setFüllePersonalid(String füllePerspnalid) {
	this.füllePersonalid = füllePerspnalid;
}

public int getObjekt_nr() {
		return objekt_nr;
}

public void setObjekt_nr(int objekt_nr) {
		this.objekt_nr = objekt_nr;
}
	
	

}
