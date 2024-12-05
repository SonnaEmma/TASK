package de.hwg_lu.bwi520.keineBeans;

public class Benutzer {

	
	int personal_nr;
	String vorname;
	String nachname;
	String username;
	String email;
	String tel_nr;
	String passwort;
	String rolle;
	String abteilung;
	
	
	public Benutzer(int personal_nr, String vorname ,String nachname, String username, String email, 
			/*String tel_nr, String passwort,*/ String rolle /*, String abteilung*/) {
		
		this.personal_nr=personal_nr;
		this.vorname=vorname;
		this.nachname=nachname;
		this.username=username;
		this.email= email;
		//this.tel_nr=tel_nr;
		//this.passwort=passwort;
		this.rolle=rolle;
		//this.abteilung=abteilung;
		
	}

	
	

	public int getPersonal_nr() {
		return personal_nr;
	}


	public void setPersonal_nr(int personal_nr) {
		this.personal_nr = personal_nr;
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


	public String getTel_nr() {
		return tel_nr;
	}


	public void setTel_nr(String tel_nr) {
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
