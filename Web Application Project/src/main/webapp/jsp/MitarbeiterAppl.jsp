<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TechnicalFailureBean"%>
<%@page import="de.hwg_lu.bwi520.beans.ChangeDataUserBean"%>
<%@page import="de.hwg_lu.bwi520.beans.KontaktBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TaskBean"%>
<%@page import="de.hwg_lu.bwi520.beans.LoginBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MeldungsBean"%>
<%@page import="de.hwg_lu.bwi520.beans.BenutzerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="portalview">
<jsp:useBean id="myAnfrage" class="de.hwg_lu.bwi520.beans.AnfrageBean" scope="session" />
<jsp:useBean id="myFailure" class="de.hwg_lu.bwi520.beans.TechnicalFailureBean" scope="session" />
<jsp:useBean id="myCDU" class="de.hwg_lu.bwi520.beans.ChangeDataUserBean" scope="session" />
<jsp:useBean id="myUser" class="de.hwg_lu.bwi520.beans.BenutzerBean" scope="session" />
<jsp:useBean id="myMel" class="de.hwg_lu.bwi520.beans.MeldungsBean" scope="session" />
<jsp:useBean id="myLog" class="de.hwg_lu.bwi520.beans.LoginBean" scope="session" />
<jsp:useBean id="myTask" class="de.hwg_lu.bwi520.beans.TaskBean" scope="session" />
<jsp:useBean id="myK" class="de.hwg_lu.bwi520.beans.KontaktBean" scope="session" />

<%

//Parameter für 'contact admin'
String name = request.getParameter("name");
String email = request.getParameter("email");
String message = request.getParameter("message");


String userid2 = request.getParameter("userid2");
String userid3 = request.getParameter("userid3");
String userid4 = request.getParameter("userid4");

//Parameter für Update von User-Daten
String firstNameChange= request.getParameter("firstNameChange");
String lastNameChange= request.getParameter("lastNameChange");
//String personalNummerasString= request.getParameter("idpersonalChange");
String usernameChange= request.getParameter("usernameChange");
String emailChange= request.getParameter("emailChange");
String phoneChangeasString= request.getParameter("telefonnummerChange");
String passwordChange= request.getParameter("passwordChange");
String rolleChange= request.getParameter("rolleChange");
String abteilungChange= request.getParameter("abteilungChange");

//submit-buttons
String btnBack = request.getParameter("backtosuper");
String btnSend = request.getParameter("btnSend");
String btnZurück = request.getParameter("backToVerwaltung");
String btnLöschen = request.getParameter("MessageLöschen");
String btnAktualisieren = request.getParameter("btnAktualisieren");
String btnAbbrechen = request.getParameter("btnbackTo");
String btnOK = request.getParameter("btnOK");
String btnSchließen = request.getParameter("btnSchließen");





String action = request.getParameter("action");

if(action ==  null) action="";
if(btnOK == null)btnOK="";
if(btnZurück == null) btnZurück ="";
if(btnSend == null) btnSend="";
if(btnBack == null) btnBack ="";
if(btnLöschen == null) btnLöschen ="";
if(btnAktualisieren  == null) btnAktualisieren="";
if(btnAbbrechen == null) btnAbbrechen="";


if(btnSend.equals("Message senden")){
	
	myK.setEmail(email);
	myK.setName(name);
	myK.setMessage(message);
	myK.merksAlles();
	
	myMel.setMessageGesendet();
	response.sendRedirect("./LoginView.jsp");
	
}else if(btnBack.equals("Zurück")){
	
	response.sendRedirect("./SuperTechnikerView.jsp");
	
}else if(btnZurück.equals("Zurück")){
	
	//myUser.getMitarbeiterFromDB();
	//myUser.getMitarbeiterInaktivFromDB();
	response.sendRedirect("./AccountManagementView.jsp");
	
}else if(btnLöschen.equals("Löschen")){
	
	myK.loescheAlles();
	response.sendRedirect("./BenachrichtigungView.jsp");
	
}
else if(action.equals("aktiv")){
	
	myUser.userStatusAktiv(userid3);
	response.sendRedirect("./InaktiveUserView.jsp");
	
}else if(action.equals("delete")){
	
	myUser.deleteOneAccount(userid4);
	response.sendRedirect("./InaktiveUserView.jsp");
	
}else if(action.equals("bearbeiten")){
	
	myMel.setBenutzer(userid2);
	myCDU.enterDataUser(userid2);
		
	response.sendRedirect("./ChangeDataUserView.jsp");
	
}else if(btnAktualisieren.equals("Aktualisieren")){

	
	int phone_numberChange = 0; 
	try{
		phone_numberChange = Integer.parseInt(phoneChangeasString);
	}catch(NumberFormatException nfe){
		nfe.printStackTrace();
	}
	
	
	myCDU.changeDataUser(firstNameChange, lastNameChange, emailChange, usernameChange, 
			passwordChange, phone_numberChange, rolleChange, abteilungChange);
	
	System.out.println("Vorname: " + firstNameChange);
	System.out.println("Nachname: " + lastNameChange);
	System.out.println("E-Mail: " + emailChange);
	System.out.println("Benutzername: " + usernameChange);
	System.out.println("Passwort: " + passwordChange);
	System.out.println("Telefonnummer: " + phone_numberChange);
	System.out.println("Rolle: " + rolleChange);
	System.out.println("Abteilung: " + abteilungChange);	
	
	myUser.getMitarbeiterFromDB();

	response.sendRedirect("./ChangeDataUserView.jsp");
	
}else if(btnAbbrechen.equals("Abbrechen")){
	
	response.sendRedirect("./AccountManagementView.jsp");
	
}else{
	myLog.setLoggedIn(false);
	response.sendRedirect("./TaskView.jsp");	
}



%>

</body>
</html>