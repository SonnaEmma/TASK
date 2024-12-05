package de.hwg_lu.bwi520.keineBeans;

public class Bericht {
    
    private int berichtId;
    private int anfrageId;
    private int technikerId;
    private String datum;
    private String loesungsDetails;

    // Constructor
    public Bericht(int berichtId, int anfrageId, int technikerId, String datum, String loesungsDetails) {
        this.berichtId = berichtId;
        this.anfrageId = anfrageId;
        this.technikerId = technikerId;
        this.datum = datum;
        this.loesungsDetails = loesungsDetails;
    }

    // Getter and Setter methods
    public int getBerichtId() {
        return berichtId;
    }

    public void setBerichtId(int berichtId) {
        this.berichtId = berichtId;
    }

    public int getAnfrageId() {
        return anfrageId;
    }

    public void setAnfrageId(int anfrageId) {
        this.anfrageId = anfrageId;
    }

    public int getTechnikerId() {
        return technikerId;
    }

    public void setTechnikerId(int technikerId) {
        this.technikerId = technikerId;
    }

    public String getDatum() {
        return datum;
    }

    public void setDatum(String datum) {
        this.datum = datum;
    }

    public String getLoesungsDetails() {
        return loesungsDetails;
    }

    public void setLoesungsDetails(String loesungsDetails) {
        this.loesungsDetails = loesungsDetails;
    }
}
