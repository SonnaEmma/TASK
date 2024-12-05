	<%@page import="de.hwg_lu.bwi520.beans.BenutzerBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TaskBean"%>
<%@page import="de.hwg_lu.bwi520.beans.LoginBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MeldungsBean"%>
<%@page import="de.hwg_lu.bwi520.beans.ChangeDataUserBean"%>
<%@page import="de.hwg_lu.bwi520.beans.KontaktBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TechnicalFailureBean"%>
<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>No Titel </title>
</head>
<body>
<jsp:useBean id="myAnfrage" class="de.hwg_lu.bwi520.beans.AnfrageBean" scope="session" />
<jsp:useBean id="myFailure" class="de.hwg_lu.bwi520.beans.TechnicalFailureBean" scope="session" />
<jsp:useBean id="myK" class="de.hwg_lu.bwi520.beans.KontaktBean" scope="session" />
<jsp:useBean id="myCDU" class="de.hwg_lu.bwi520.beans.ChangeDataUserBean" scope="session" />
<jsp:useBean id="myMel" class="de.hwg_lu.bwi520.beans.MeldungsBean" scope="session" />
<jsp:useBean id="myLog" class="de.hwg_lu.bwi520.beans.LoginBean" scope="session" />
<jsp:useBean id="myTask" class="de.hwg_lu.bwi520.beans.TaskBean" scope="session" />
<jsp:useBean id="myUser" class="de.hwg_lu.bwi520.beans.BenutzerBean" scope="session" />
<%
String  anfragetype  = request.getParameter("requestType");
String kategorie = request.getParameter("problemType");
String beschreibung = request.getParameter("beschreibung");
String festelltllungsdatum   = request.getParameter("festelltllungsdatum");
String senden   = request.getParameter("senden");
String  personalnummerString  = request.getParameter("personnalnummer");
if (senden == null) senden = "";

int personalnummer = 0;
try{
	personalnummer = Integer.parseInt(personalnummerString);
}catch(Exception nfe){
	nfe.printStackTrace();
}



if(senden.equals("Senden")){
	myAnfrage.setAnfragetype(anfragetype);
	myAnfrage.setKategorie(kategorie);
	myAnfrage.setBeschreibung(beschreibung);
	myAnfrage.setFestellungsdatum(festelltllungsdatum);
	myAnfrage.setPersonalnummer(personalnummer);
	
	myAnfrage.insertAnfrage();

	response.sendRedirect("ReportIssueView.jsp");
}else{
	myLog.setLoggedIn(false);
	response.sendRedirect("./TaskView.jsp");	
}




System.out.println(personalnummer);
System.out.println(anfragetype);
System.out.println(kategorie);
System.out.println(beschreibung);
System.out.println(festelltllungsdatum);
%>
</body>
</html>