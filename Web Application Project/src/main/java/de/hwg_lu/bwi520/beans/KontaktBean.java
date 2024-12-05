package de.hwg_lu.bwi520.beans;

import java.util.HashMap;
//import java.util.Iterator;

public class KontaktBean {

	String email;
	String name;
	String message;
	HashMap<String, String> allesZusammen;


	public KontaktBean() {
		
		this.allesZusammen = new HashMap<String, String>();
		
	}
	
	public String getBisherigeBenachrichtigungen() {

		String html = "";
		for(String nextKey : this.allesZusammen.keySet()) {
			String nextValue = this.allesZusammen.get(nextKey);
			
			html += "Nachricht von " + nextKey + "<br> ";
			html += "<p>" + nextValue + "</p>";
		}
	
		return html;
	}
	
	
	public void merksAlles() {	
		this.allesZusammen.put(name, message);	
	}
	
	public void loescheAlles() {
		this.allesZusammen.clear();
	}	
	

	public String getName() {
		
		return name;
	}


	public void setName(String name) {
		this.name = name + " || Email: " + this.getEmail();
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public HashMap<String, String> getAllesZusammen() {
		return allesZusammen;
	}


	public void setAllesZusammen(HashMap<String, String> allesZusammen) {
		this.allesZusammen = allesZusammen;
	}
	
	
	
	

}
