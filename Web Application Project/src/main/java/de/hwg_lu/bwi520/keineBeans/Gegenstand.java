package de.hwg_lu.bwi520.keineBeans;

public class Gegenstand {

	int produktnummer;
	String name;
	String beschreibung;
	int ausleih_id;
	int r�ckgabe_id;
	boolean verf�gbarkeit;
	String status;
	
	public Gegenstand( int produktnummer, String name, String beschreibung, String status) {

		this.produktnummer=produktnummer;
		this.name=name;
		this.beschreibung=beschreibung;
		this.status=status;
		
	}
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBeschreibung() {
		return beschreibung;
	}

	public void setBeschreibung(String beschreibung) {
		this.beschreibung = beschreibung;
	}

	public int getAusleih_id() {
		return ausleih_id;
	}

	public void setAusleih_id(int ausleih_id) {
		this.ausleih_id = ausleih_id;
	}

	public int getR�ckgabe_id() {
		return r�ckgabe_id;
	}

	public void setR�ckgabe_id(int r�ckgabe_id) {
		this.r�ckgabe_id = r�ckgabe_id;
	}

	public boolean isVerf�gbarkeit() {
		return verf�gbarkeit;
	}

	public void setVerf�gbarkeit(boolean verf�gbarkeit) {
		this.verf�gbarkeit = verf�gbarkeit;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}



	public int getProduktnummer() {
		return produktnummer;
	}



	public void setProduktnummer(int produktnummer) {
		this.produktnummer = produktnummer;
	}

	
	
	
}
