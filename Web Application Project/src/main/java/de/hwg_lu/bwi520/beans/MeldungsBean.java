package de.hwg_lu.bwi520.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import de.hwg_lu.bwi520.jdbc.NoConnectionException;
import de.hwg_lu.bwi520.jdbc.PostgreSQLAccess;

public class MeldungsBean {
	String f�llePersonalid;
	
	
	String infoNewPassword;
	String infoMsg;
	String actionMsg;
	
	String meldung;
	String handeln;
	
	//Variable f�r die Methode 'getMessageChangeDataUser'
	String benutzer;
	
	public MeldungsBean() {
		this.setPortalWelcome();
		this.setMeldungUndHandeln();
		this.setUpdateChangePassword();
	}
	
	public String getMeldungHtml() {
		String html = "";
		html += "<h3 style= 'text-align: center;'>" + this.getInfoMsg() + "</h3>";
		html += "<h4 style= 'text-align: center;'>" + this.getActionMsg()+ "</h4>";
		return html;
	}
	
	public String getBestaetigungHtml() { 
		String html = "";
		html += "<h3 style= 'text-align: center;'>" + this.getMeldung() + "</h3>";
		html += "<h4 style= 'text-align: center;'>" + this.getHandeln()+ "</h4>";
		return html;
	}
	
	public String getMessageUpdatePassword() { 
		String html = "";
		html += "<h3 style= 'text-align: center;'>" + this.getInfoNewPassword() + "</h3>";
		//html += "<h4 style= 'text-align: center;'>" + this.getHandeln()+ "</h4>";
		return html;
	}
	
	public String getAktiveUser() {	
		String html="";
		html += "<h3 style= 'text-align: center;'>" + "Hier werden aktive Benutzer in der Tabelle angezeigt" + "</h3>";
		return html;	
	}
	
	public void setLoginFailed() {
		this.setInfoMsg("Ihre Anmeldung ist fehlgeschlagen");
		this.setActionMsg("Bitte versuchen Sie es noch einmal oder nehmen Sie Kontakt mit dem Admin auf.");
	};
	public void setLogoutSuccessful() {
		this.setInfoMsg("Sie haben sich abgemeldet.");
		this.setActionMsg("Zur weiteren Benutzung melden Sie sich bitte wieder an.");
	};
	
	public void setPortalWelcome() {
		this.setInfoMsg("Willkommen am Portal!");
		this.setActionMsg("Bitte melden Sie sich an, wenn Sie bereits �ber ein Konto verf�gen.");
	};
	
	public void setNeueUserAnlegen() {
		this.setInfoMsg("Willkomen bei der Registrierung");
		this.setActionMsg("F�llen Sie bitte die Felder richtig aus.");
		
	}
	
	public void setRegSuccessful(String username) {
		this.setInfoMsg("Account " + username + " erfolgreich angelegt");
		this.setActionMsg("Geben Sie bitte dem betroffenen User Bescheid, dass er sich jetzt anmelden kann");
	};
	public void setAccountAlreadyExists(String username, String email) {
		this.setInfoMsg("Benutzer " + username + " mit der Email: "+  email +" existiert bereits");
		this.setActionMsg("Bitte �berpr�fen Sie nochmal Ihre Angaben");
	};
	public void setDBError() {
		this.setInfoMsg("Es ist ein Datenbankfehler aufgetreten");
		this.setActionMsg("Bitte wiederholen Sie den Vorgang");
	};

	
	public void setMessageGesendet() {
		this.setInfoMsg("Ihre Nachricht wurde gesendet. Der Admin wird sich bald mit Ihnen in Verbindung setzen.");
		this.setActionMsg("");
	};
	
	
	
	public void setMeldungUndHandeln() {
		this.setMeldung("Dr�cken Sie auf den linken Knopf, wenn Sie eine R�ckgabe durchf�hren wollen");
		this.setHandeln("Ausleihdauer betr�gt zwei Tage f�r jeden Gegenstand. Merken Sie sich die gew�nschte Produktnummer");
		
	}
	
	public void setAusleihenErfolgreich() throws NoConnectionException, SQLException {
		
		GegenstandBean newGegenstand = new GegenstandBean();
		boolean kannAusleihen = newGegenstand.checkIfUserOffeneAusleihenHat(getPersonalIDFeld());
		
		 if (!kannAusleihen) {
			 this.setMeldung("Ausleihen nicht m�glich, weil Sie noch offene Ausleihen haben");
			 this.setHandeln("F�hren Sie zuerst die R�ckgabe dieses Gegenstandes durch.");
		        return;
		        
		    }else {
			this.setMeldung("Ausleihen erfolgreich durchgef�hrt!");
			this.setHandeln("Gehen sie jetzt zur Abholung Ihres Gegenstandes in den Lager und behalten Sie bitte die Produktnummer im Kopf");
		 }
	}
	
	public void setR�ckgabeErfolgreich() {
		this.setMeldung("R�ckgabe erfolgreich durchgef�hrt!");
		this.setHandeln("Bringen Sie jetzt den Gegenstand in den Lager zur�ck");
		
	}
	
	public void setUpdateChangePassword() {
		this.setInfoNewPassword("Jetzt k�nnen Sie Ihr Passowort aktualisieren");
		
	}
	
	public void setUpdateChangePasswordSuccessful() {
		this.setInfoNewPassword("Ihr Passwort wurde erfolgreich ge�ndert. "
				+ "Dr�cken Sie bitte auf Abbrechen, um aufs Profil weitergeleitet zu werden ");
		
	}

	
	public String getMessageChangeDataUser() {
		return "Nun wollen Sie die Daten von '" + this.getBenutzer() + "' �ndern";
	};

	
	//Damit die Personalnummer in der Methode setAusleihenErfolgreich genutzt werden kann.
	public int getPersonalIDFeld() throws NoConnectionException, SQLException {

	    String sql = "SELECT personalnummer FROM mitarbeiter WHERE benutzername=? and active =true";
	    int pers_id=0;

	    try (Connection conn = new PostgreSQLAccess().getConnection();
	         PreparedStatement prep = conn.prepareStatement(sql)) {
	        
	        prep.setString(1, this.f�llePersonalid);
	        
	        try (ResultSet dbRes = prep.executeQuery()) {
	            if (dbRes.next()) {
	            	pers_id = dbRes.getInt("personalnummer");
	            }
	        }
	    }

	    return pers_id;
	}
	
	public String getF�llePersonalid() {
		return f�llePersonalid;
	}

	public void setF�llePersonalid(String f�llePerspnalid) {
		this.f�llePersonalid = f�llePerspnalid;
	}
	
	
	
	public String getInfoMsg() {
		return infoMsg;
	}

	public void setInfoMsg(String infoMsg) {
		this.infoMsg = infoMsg;
	}

	public String getActionMsg() {
		return actionMsg;
	}

	public void setActionMsg(String actionMsg) {
		this.actionMsg = actionMsg;
	}

	public String getBenutzer() {
		return benutzer;
	}

	public void setBenutzer(String benutzer) {
		this.benutzer = benutzer;
	}

	public String getMeldung() {
		return meldung;
	}

	public void setMeldung(String meldung) {
		this.meldung = meldung;
	}

	public String getHandeln() {
		return handeln;
	}

	
	public void setHandeln(String handeln) {
		this.handeln = handeln;
	}

	public String getInfoNewPassword() {
		return infoNewPassword;
	}

	public void setInfoNewPassword(String infoNewPassword) {
		this.infoNewPassword = infoNewPassword;
	}

	
}
