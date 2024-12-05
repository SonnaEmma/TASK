  package de.hwg_lu.bwi520.jdbc;

import java.sql.Connection;
import java.sql.SQLException;

public class AppInstallTables {

	Connection dbConn;
	
	public static void main(String[] args) throws SQLException {
		AppInstallTables myApp = new AppInstallTables();
		myApp.dbConn = new PostgreSQLAccess().getConnection();
		myApp.doSomething();
	}

	public void doSomething() throws SQLException {
		this.executeUpdateWithoutParms("DROP TABLE IF EXISTS Bericht");
		this.executeUpdateWithoutParms("DROP TABLE IF EXISTS Anfrage");
		this.executeUpdateWithoutParms("DROP TABLE IF EXISTS Rueckgabe");
		this.executeUpdateWithoutParms("DROP TABLE IF EXISTS Ausleihen");
		this.executeUpdateWithoutParms("DROP TABLE IF EXISTS Gegenstaende");
		this.executeUpdateWithoutParms("DROP TABLE IF EXISTS Mitarbeiter");
		this.createTableMitarbeiter();
		this.insertDataMitarbeiter();
		this.createTableAnfrage();
		this.createTableGegenstaende();
		this.createTableAusleihen();
		this.createTableRueckgabe();
		this.insertDataGegenstaende();
		this.insertDataAnfragen();
		this.createTableBericht();
		
	
	}
	public void executeUpdateWithoutParms(String sql) throws SQLException{
		System.out.println(sql);
		this.dbConn.prepareStatement(sql).executeUpdate();
	}
	public void createTableMitarbeiter() throws SQLException {
		this.executeUpdateWithoutParms(
				"CREATE TABLE Mitarbeiter (" +
						"Personalnummer SERIAL NOT NULL primary key," +
                        "Vorname VARCHAR(100) NOT NULL," +
                        "Nachname VARCHAR(100) NOT NULL," +
                        "Email VARCHAR(100)NOT NULL," +
                        "Benutzername VARCHAR(100) NOT NULL unique," + 
                        "Password VARCHAR(255) NOT NULL," +
                        "Telefonnummer bigint NOT NULL," +  
                        "Rolle VARCHAR(50) NOT NULL, " +
                        "Abteilung VARCHAR(100) NOT NULL," +
                        "active  boolean not null default true," +
                        "admin  boolean not null default false)"
                       
		);		
	}
	
	public void insertDataMitarbeiter() throws SQLException {
		this.executeUpdateWithoutParms(
			"INSERT INTO Mitarbeiter (Vorname, Nachname, Email, Benutzername, Password, Telefonnummer, Rolle, Abteilung, admin) VALUES " +
		 	"('test', 'admin', 'test.admin@elalogroup.de', 'test.admin', 'geheim123', 06212002, 'Super Techniker', 'IT', TRUE), " +
			"('test', 'tech', 'test.tech@elalogroup.de', 'test.tech', 'password123', 06212003, 'Techniker', 'IT', FALSE), " +
			"('test', 'mit', 'test.mit@elalogroup.de', 'test.mit', 'security', 06212004, 'Mitarbeiter', 'HR', FALSE), " +
			"('Nina', 'Becker', 'nina.becker@elalogroup.de', 'nina.becker', 'passw0rd890', 06212012, 'Mitarbeiter', 'HR', FALSE), " +
			"('Stefan', 'Meier', 'stefan.meier@elalogroup.de', 'stefan.meier', 'simplepass', 06212015, 'Mitarbeiter', 'Marketing', FALSE)"
			);
		
	}
	
	public void createTableAnfrage() throws SQLException {
		this.executeUpdateWithoutParms(
				"CREATE TABLE ANFRAGE (" +
                        "Anfrage_id SERIAL NOT NULL PRIMARY KEY," +
                        "Anfragetype varchar(30) NOT NULL," +
                        "Kategorie varchar(70) NOT NULL," +
                        "Beschreibung TEXT NOT NULL," +                    
                        "Festellungsdatum varchar(30) NOT NULL," +  
                        "erstellt_am TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,"+
                        "Status VARCHAR(30) not null default 'Reported'," +
                        "Personalnummer int not null," +
                        "last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP," +
                        "Foreign key (Personalnummer) references mitarbeiter(Personalnummer))"
           
                       
		);
	}
	
	
	public void createTableGegenstaende() throws SQLException {
		this.executeUpdateWithoutParms(
			    "CREATE TABLE Gegenstaende (" +
			    "Produktnummer SERIAL NOT NULL PRIMARY KEY, " +
			    "Name VARCHAR(100) NOT NULL, " +
			    "Beschreibung TEXT NOT NULL, " +
			    "Verfuegbarkeit BOOLEAN NOT NULL DEFAULT TRUE, " +
			    "Status VARCHAR(100) NOT NULL DEFAULT 'verfuegbar'" +
			    ")"
			);
	
	}
	
	public void createTableAusleihen() throws SQLException {
		this.executeUpdateWithoutParms(
			    "CREATE TABLE Ausleihen (" +
			    "AusleihID SERIAL NOT NULL PRIMARY KEY, " +
			    "Produktnummer INT NOT NULL, " +
			    "MitarbeiterID INT NOT NULL, " +
			    "Leihdatum TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP, " +
			    "FOREIGN KEY (Produktnummer) REFERENCES Gegenstaende(Produktnummer), " +
			    "FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(Personalnummer)" +
			    ")"
			);

	
	}
	
	public void createTableRueckgabe() throws SQLException {
		this.executeUpdateWithoutParms(
			    "CREATE TABLE Rueckgabe (" +
			    "RueckgabeID SERIAL NOT NULL PRIMARY KEY, " +
			    "Produktnummer INT NOT NULL, " +
			    "MitarbeiterID INT NOT NULL, " +
			    "Rueckgabedatum TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP," +
			    "FOREIGN KEY (Produktnummer) REFERENCES Gegenstaende(Produktnummer), " +
			    "FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(Personalnummer)" +
			    ")"
			);

	
	}
	
	public void createTableBericht() throws SQLException {
		this.executeUpdateWithoutParms(
				"CREATE TABLE Bericht (" +
                        "	BerichtId SERIAL NOT NULL PRIMARY KEY,"
                        + "	anfrage_id INT NOT NULL,"
                        + "	Techniker_id INT NOT NULL,"
                        + "	Datum DATE NOT NULL DEFAULT CURRENT_DATE,"
                        + "	LoesungsDetails TEXT NOT NULL,"
                        + "	FOREIGN KEY (anfrage_id) REFERENCES Anfrage(anfrage_id),"
                        + "	FOREIGN KEY (Techniker_id) REFERENCES Mitarbeiter(Personalnummer))"
		);		
	}
	
	public void insertDataAnfragen() throws SQLException {
		this.executeUpdateWithoutParms(
			    "INSERT INTO ANFRAGE (Anfragetype, Kategorie, Beschreibung, Festellungsdatum, Status, Personalnummer) VALUES " +
			    "('Hardware', 'Fehler melden', 'Der Laptop startet nicht.', '2024-09-19', 'Reported', 3), " +
			    "('Software', 'Verbesserungsvorschlag', 'Neue Funktion für das CRM-System.', '2024-09-18', 'Reported', 3), " +
			    "('Hardware', 'Fehler melden', 'Monitor zeigt kein Bild.', '2024-09-17', 'Reported', 4), " +
			    "('Software', 'Fehler melden', 'Excel stÃ¼rzt ab, wenn groÃŸe Dateien geÃ¶ffnet werden.', '2024-09-16', 'Reported', 5)"
			);

	}

	
	public void insertDataGegenstaende() throws SQLException {
		this.executeUpdateWithoutParms(
			    "INSERT INTO Gegenstaende (Name, Beschreibung) VALUES " +
			    "('Laptop Dell XPS 13', 'Ultrabook mit 13 Zoll Display'), " +
			    "('MacBook Pro', 'Apple Laptop 16 Zoll'), " +
			    "('Surface Pro 7', 'Microsoft Tablet mit Tastatur'), " +
			    "('HP Spectre x360', 'Convertible Laptop 14 Zoll'), " +
			    "('Lenovo ThinkPad', 'Business Laptop 15 Zoll'), " +
			    "('iPad Pro', 'Apple Tablet 11 Zoll'), " +
			    "('Dell Monitor', '27 Zoll 4K Monitor'), " +
			    "('Logitech Maus MX', 'Kabellose Maus'), " +
			    "('HP Drucker', 'Multifunktionsdrucker'), " +
			    "('Samsung Galaxy S21', 'Smartphone'), " +
			    "('USB-C Dockingstation', 'USB-C Dockingstation für Laptops'), " +
			    "('Jabra Headset', 'Bluetooth Headset'), " +
			    "('Canon Kamera', 'Digitalkamera'), " +
			    "('Lenovo Tablet', 'Android Tablet 10 Zoll'), " +
			    "('Dell XPS Desktop', 'Desktop-PC')"
			);

	}
	
}
