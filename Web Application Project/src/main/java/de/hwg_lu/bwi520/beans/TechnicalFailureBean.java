package de.hwg_lu.bwi520.beans;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import de.hwg_lu.bwi520.jdbc.NoConnectionException;
import de.hwg_lu.bwi520.jdbc.PostgreSQLAccess;
import de.hwg_lu.bwi520.keineBeans.Bericht;
import de.hwg_lu.bwi520.keineBeans.Failure;

public class TechnicalFailureBean {

	
	public List<Failure> failureList; 
	public List<Bericht> berichteList;

	
	
    public TechnicalFailureBean() {
        // Initialize the list here
        this.failureList = new ArrayList<>();
        this.berichteList = new ArrayList<>();
    }
    
    public List<Failure> getFailureList() {
        return failureList;
    }
    public List<Bericht> getBerichteList() {
        return berichteList;
    }
	
	
    public void getFailureFromDB() throws NoConnectionException, SQLException {
    	
    	this.failureList.clear();
		String sql = "Select * from anfrage ORDER by last_updated DESC";
		System.out.println(sql);
		ResultSet dbRes = new PostgreSQLAccess().getConnection().
				prepareStatement(sql).executeQuery();		
		while (dbRes.next()) {
			this.failureList.add(
				new Failure(
				 dbRes.getInt("anfrage_Id"),
				 dbRes.getString("anfragetype"),
				 dbRes.getString("kategorie"),
				 dbRes.getString("beschreibung"),
				 dbRes.getString("festellungsdatum"),
				 dbRes.getString("status"),
				 dbRes.getInt("personalnummer")
				)
			);
		}

	}
	
	public void updateStatus(int anfrageId, String newStatus) throws NoConnectionException, SQLException{
		String sql = "update anfrage set status = ?, last_updated = NOW() where anfrage_Id = ?";
		System.out.println(sql);
		PreparedStatement prep = new PostgreSQLAccess().
				getConnection().
				prepareStatement(sql);
        prep.setString(1, newStatus);
        prep.setInt(2, anfrageId);
        prep.executeUpdate();		
		
	}
	
	public void getAllBerichte() throws SQLException, NoConnectionException {
    	this.berichteList.clear();
        String sql = "SELECT BerichtId, Anfrage_Id, Techniker_Id, Datum, Loesungsdetails FROM Bericht";

        ResultSet rs = new PostgreSQLAccess().getConnection().
				prepareStatement(sql).executeQuery();

         while (rs.next()) {
           this.berichteList.add(
			new Bericht(
            rs.getInt("BerichtId"),
            rs.getInt("Anfrage_Id"),
            rs.getInt("Techniker_Id"),
            rs.getString("Datum"),
            rs.getString("LoesungsDetails")
         )
      );

    }
  }
	
	public void documentResolution(int anfrageId, String loesungsDetails, int technikerId) throws SQLException, NoConnectionException {
	       
        // Insert the resolution details into the Bericht table
        String insertBerichtSQL = "INSERT INTO Bericht (Anfrage_Id, Techniker_Id, LoesungsDetails) VALUES (?, ?, ?)";
		PreparedStatement insertBerichtStmt = new PostgreSQLAccess().
				getConnection().
				prepareStatement(insertBerichtSQL);
		    
        insertBerichtStmt.setInt(1, anfrageId);
        insertBerichtStmt.setInt(2, technikerId);
        insertBerichtStmt.setString(3, loesungsDetails);

        int rowsInserted = insertBerichtStmt.executeUpdate();
        System.out.println("Inserted " + rowsInserted + " row(s) into Bericht.");
   
	}


}

