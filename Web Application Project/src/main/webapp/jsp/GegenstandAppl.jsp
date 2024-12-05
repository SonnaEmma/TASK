<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@page import="de.hwg_lu.bwi520.beans.GegenstandBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TechnicalFailureBean"%>
<%@page import="de.hwg_lu.bwi520.beans.ChangeDataUserBean"%>
<%@page import="de.hwg_lu.bwi520.beans.KontaktBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TaskBean"%>
<%@page import="de.hwg_lu.bwi520.beans.LoginBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MeldungsBean"%>
<%@page import="de.hwg_lu.bwi520.beans.BenutzerBean"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohne Titel </title>

</head>
<body id="portalview">
<jsp:useBean id="myObjekt" class="de.hwg_lu.bwi520.beans.GegenstandBean" scope="session" />
<jsp:useBean id="myAnfrage" class="de.hwg_lu.bwi520.beans.AnfrageBean" scope="session" />
<jsp:useBean id="myFailure" class="de.hwg_lu.bwi520.beans.TechnicalFailureBean" scope="session" />
<jsp:useBean id="myCDU" class="de.hwg_lu.bwi520.beans.ChangeDataUserBean" scope="session" />
<jsp:useBean id="myUser" class="de.hwg_lu.bwi520.beans.BenutzerBean" scope="session" />
<jsp:useBean id="myMel" class="de.hwg_lu.bwi520.beans.MeldungsBean" scope="session" />
<jsp:useBean id="myLog" class="de.hwg_lu.bwi520.beans.LoginBean" scope="session" />
<jsp:useBean id="myTask" class="de.hwg_lu.bwi520.beans.TaskBean" scope="session" />
<jsp:useBean id="myK" class="de.hwg_lu.bwi520.beans.KontaktBean" scope="session" />

<%
//Parameter
String produktnummer = request.getParameter("produktnummer");
String mitarbeiternummer = request.getParameter("mitarbeiternummer");
String produktnummerRückgabe = request.getParameter("produktnummerRueckgabe");
String mitarbeiternummerRückgabe = request.getParameter("mitarbeiternummerRueckgabe");

//String rueckgabedateasString = request.getParameter("rueckgabedate");
//String dateasString = request.getParameter("ausleihdate");


//Buttons sowie array
String objekt_nrString = request.getParameter("objekte");
String btnWeiter = request.getParameter("btnWeiter");
String zurueckObjekte = request.getParameter("zurueckObjekte");
String btnAbb = request.getParameter("btnAbb");
String btnAusleihen = request.getParameter("btnAusleihen");
String btnRückgabe = request.getParameter("btnRückgabe");
String btnZurueckObjekteSuper = request.getParameter("btnZurueckObjekteSuper");


if(zurueckObjekte == null) zurueckObjekte ="";
if (btnWeiter == null) btnWeiter = "";
if(btnAbb == null) btnAbb ="";
if(btnAusleihen == null) btnAusleihen="";
if(btnRückgabe == null) btnRückgabe="";
if(btnZurueckObjekteSuper == null) btnZurueckObjekteSuper="";
//if (objekte == null) objekte = new String[0];


if(btnWeiter.equals("Weiter")){
	
	int objekt_nr = 0; 
	try{
		objekt_nr = Integer.parseInt(objekt_nrString);
	}catch(NumberFormatException nfe){
		nfe.printStackTrace();
	}
	
	myObjekt.setObjekt_nr(objekt_nr);
	response.sendRedirect("./AusleihenView.jsp");
	
}else if(zurueckObjekte.equals("Zurück")){
	
	response.sendRedirect("./MitarbeiterView.jsp");
	
}else if(btnAusleihen.equals("Ausleihen")){
	
	int pers_nr = 0; 
	try{
		pers_nr = Integer.parseInt(mitarbeiternummer);
	}catch(NumberFormatException nfe){
		nfe.printStackTrace();
	}
	
	int objekt_nr = 0; 
	try{
		objekt_nr = Integer.parseInt(produktnummer);
	}catch(NumberFormatException nfe){
		nfe.printStackTrace();
	}
	
	System.out.println("Ausleihen erfolgreich durchgeführt!");
	myMel.setAusleihenErfolgreich();
	myObjekt.changeStatusAusgeliehene(pers_nr, objekt_nr);
	
	response.sendRedirect("./GegenstandView.jsp");
	
}else if(btnAbb.equals("Abbrechen")){
	
	response.sendRedirect("./GegenstandView.jsp");
	
}else if(btnRückgabe.equals("Abgeben")){
	
	int pers_nr = 0; 
	try{
		pers_nr = Integer.parseInt(mitarbeiternummerRückgabe);
	}catch(NumberFormatException nfe){
		nfe.printStackTrace();
	}
	
	int objekt_nr = 0; 
	try{
		objekt_nr = Integer.parseInt(produktnummerRückgabe);
	}catch(NumberFormatException nfe){
		nfe.printStackTrace();
	}
	
    System.out.println("Rückgabe erfolgreich durchgeführt!");
	myMel.setRückgabeErfolgreich();
	myObjekt.rueckgabeObjekt(objekt_nr, pers_nr);
	response.sendRedirect("./GegenstandView.jsp");
	
}else if(btnZurueckObjekteSuper.equals("Zurück")){
	
	response.sendRedirect("./SuperTechnikerView.jsp");

}else{

	myLog.setLoggedIn(false);
	response.sendRedirect("./TaskView.jsp");	
}



%>
</body>
</html> 