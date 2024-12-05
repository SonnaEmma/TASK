package de.hwg_lu.bwi520.keineBeans;



public class Failure {
	
	
	int anfrage_Id;
	String anfragetyp;
	String kategorie;
	String beschreibung;
	String datum;
	String status;
	int personalnummer;
	


	
	
	public Failure(int anfrage_Id, String anfragetyp, String kategorie, String beschreibung, String datum,
			String status, int personalnummer) {
		super();
		this.anfrage_Id = anfrage_Id;
		this.anfragetyp = anfragetyp;
		this.kategorie = kategorie;
		this.beschreibung = beschreibung;
		this.datum = datum;
		this.status = status;
		this.personalnummer = personalnummer;
	}
	public int getAnfrage_Id() {
		return anfrage_Id;
	}
	public void setAnfrage_Id(int anfrage_Id) {
		this.anfrage_Id = anfrage_Id;
	}
	public String getAnfragetyp() {
		return anfragetyp;
	}
	public void setAnfragetyp(String anfragetyp) {
		this.anfragetyp = anfragetyp;
	}
	public String getKategorie() {
		return kategorie;
	}
	public void setKategorie(String kategorie) {
		this.kategorie = kategorie;
	}
	public String getDatum() {
		return datum;
	}
	public void setDatum(String datum) {
		this.datum = datum;
	}
	public String getBeschreibung() {
		return beschreibung;
	}
	public void setBeschreibung(String beschreibung) {
		this.beschreibung = beschreibung;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPersonalnummer() {
		return personalnummer;
	}
	public void setPersonalnummer(int personalnummer) {
		this.personalnummer = personalnummer;
	}	

}
