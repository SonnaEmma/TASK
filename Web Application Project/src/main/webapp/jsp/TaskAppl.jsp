<%@page import="de.hwg_lu.bwi520.beans.GegenstandBean"%>
<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TechnicalFailureBean"%>
<%@page import="de.hwg_lu.bwi520.beans.KontaktBean"%>
<%@page import="de.hwg_lu.bwi520.beans.ChangeDataUserBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="de.hwg_lu.bwi520.beans.BenutzerBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MeldungsBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TaskBean"%>
<%@page import="de.hwg_lu.bwi520.beans.LoginBean"%>

<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="myObjekt" class="de.hwg_lu.bwi520.beans.GegenstandBean" scope="session" />
<jsp:useBean id="myAnfrage" class="de.hwg_lu.bwi520.beans.AnfrageBean" scope="session" />
<jsp:useBean id="myFailure" class="de.hwg_lu.bwi520.beans.TechnicalFailureBean" scope="session" />
<jsp:useBean id="myK" class="de.hwg_lu.bwi520.beans.KontaktBean" scope="session" />
<jsp:useBean id="myCDU" class="de.hwg_lu.bwi520.beans.ChangeDataUserBean" scope="session" />
<jsp:useBean id="myMel" class="de.hwg_lu.bwi520.beans.MeldungsBean" scope="session" />
<jsp:useBean id="myLog" class="de.hwg_lu.bwi520.beans.LoginBean" scope="session" />
<jsp:useBean id="myTask" class="de.hwg_lu.bwi520.beans.TaskBean" scope="session" />
<jsp:useBean id="myUser" class="de.hwg_lu.bwi520.beans.BenutzerBean" scope="session" />



<%
//Parameter für Login
String usernameLog   = request.getParameter("usernameLog");
String passwordLog = request.getParameter("passwordLog");

String changeNewPassword = request.getParameter("newPassword");


//Parameter für Registrierung
String firstNameReg= request.getParameter("firstNameReg");
String lastNameReg= request.getParameter("lastNameReg");
//String personalNummerasString= request.getParameter("idpersonal");
String usernameReg= request.getParameter("usernameReg");
String emailReg= request.getParameter("emailReg");
String phoneasString= request.getParameter("telefonnummer");
String passwordReg= request.getParameter("passwordReg");
String rolle= request.getParameter("rolle");
String abteilung= request.getParameter("abteilung");


//Parameter für die Links
String userid = request.getParameter("userid");

//Submit-Buttons
String register= request.getParameter("btnReg");
String zurueck = request.getParameter("zurueck");
String zurueckLog = request.getParameter("btnZurueck");
String abmelden = request.getParameter("btnAbmelden");
String backToTask = request.getParameter("backtotask");
String neueUser = request.getParameter("btnNeueUser");
String action = request.getParameter("action");
String losgehts = request.getParameter("losgehts");
String btnProfilSuper = request.getParameter("btnProfilSuper");
String btnProfilTechniker = request.getParameter("btnProfilTechniker");
String btnZurueckTechniker = request.getParameter("btnZurueckTech");
String btnZurueckSuper = request.getParameter("btnZurueckSuper");
String btnAktualisierenPasswort = request.getParameter("btnAktualisierenPasswort");
String btnAktualisierenPasswort2 = request.getParameter("btnAktualisierenPasswort2");
String abbrechenPasswort = request.getParameter("abbrechenPasswort");
String abbrechenPasswortTech = request.getParameter("abbrechenPasswortTech");


String rolleZuordnung="";


if(losgehts == null) losgehts = "";
if(zurueck == null) zurueck ="";
if(abmelden == null) abmelden="";
if(neueUser == null) neueUser="";
//if(accountBearbeiten == null) accountBearbeiten="";
if(action ==  null) action="";
if(backToTask == null) backToTask="";
if(register == null) register="";
if(zurueckLog == null) zurueckLog="";
if(btnProfilSuper == null) btnProfilSuper="";
if(btnProfilTechniker == null) btnProfilTechniker="";
if(btnZurueckTechniker == null) btnZurueckTechniker="";
if(btnZurueckSuper == null) btnZurueckSuper="";
if(abbrechenPasswort == null) abbrechenPasswort="";
if(btnAktualisierenPasswort == null) btnAktualisierenPasswort="";
if(btnAktualisierenPasswort2 == null) btnAktualisierenPasswort2="";
if(abbrechenPasswortTech == null) abbrechenPasswortTech="";

if(losgehts.equals("Los geht's")){
	myLog.setBenutzername(usernameLog);
	myLog.setPassword(passwordLog);
	myObjekt.setFüllePersonalid(usernameLog);
	myAnfrage.setPersonalidString(usernameLog);
	myMel.setFüllePersonalid(usernameLog);
	
	try{	
		boolean gefunden = myLog.checkUsernamePassword();
		
		
		if (gefunden){
			myLog.setLoggedIn(true);
			rolleZuordnung = myLog.checkRolle();
			
			// Retrieve Mitarbeiter_id and store it in the session
            int mitarbeiterId = myLog.getMitarbeiterId();
            session.setAttribute("Mitarbeiter_id", mitarbeiterId);
		
			if(rolleZuordnung.equals("Mitarbeiter")){
				
				response.sendRedirect("./MitarbeiterView.jsp");
				
			}else if(rolleZuordnung.equals("Techniker")){

				response.sendRedirect("./TechnikerView.jsp");
				
			}else if(rolleZuordnung.equals("Super Techniker")){

				response.sendRedirect("./SuperTechnikerView.jsp");
			}
			
		}else{
			myLog.setLoggedIn(false);
			myMel.setLoginFailed();
			response.sendRedirect("./LoginView.jsp");
		}
	}catch(SQLException se){
		se.printStackTrace();
		response.sendRedirect("./LoginView.jsp");
	}
}else if(register.equals("User anlegen")){
	
	int phonenumber = 0; 
	try{
		phonenumber = Integer.parseInt(phoneasString);
	}catch(NumberFormatException nfe){
		nfe.printStackTrace();
	}
	
	myTask.setVorname(firstNameReg);
	myTask.setNachname(lastNameReg);
	myTask.setEmail(emailReg);
	myTask.setUsername(usernameReg);
	myTask.setPasswort(passwordReg);
	myTask.setTel_nr(phonenumber);
	myTask.setRolle(rolle);
	myTask.setAbteilung(abteilung);
	
	try{	
		boolean hatGeklappt = myTask.insertAccountIfNotExists();
		if (hatGeklappt) myMel.setRegSuccessful(usernameReg);
		else myMel.setAccountAlreadyExists(usernameReg, emailReg);
	}catch(SQLException se){
		se.printStackTrace();
		myMel.setDBError();
	}
	
	myUser.getMitarbeiterFromDB();
	response.sendRedirect("./RegistrierungView.jsp");
	
}else if(zurueck.equals("Previous")){
	
	response.sendRedirect("./AccountManagementView.jsp");	
	
}else if(zurueck.equals("Zurück")){
	
	response.sendRedirect("./SuperTechnikerView.jsp");
}else if(abmelden.equals("Abmelden")){
	myLog.setLoggedIn(false);
	myMel.setLogoutSuccessful();
	response.sendRedirect("./LoginView.jsp");
	
}else if(zurueckLog.equals("Previous")){
	
	
	response.sendRedirect("./AccountManagementView.jsp");
	
}else if(neueUser.equals("User anlegen")){
	
	myMel.setNeueUserAnlegen();
	response.sendRedirect("./RegistrierungView.jsp");
	
}
else if(backToTask.equals("BackToTask")){
	
	response.sendRedirect("./TaskView.jsp");
	
}else if(action.equals("inaktiv")){
	
	myUser.userStatusInaktiv(userid);

	response.sendRedirect("./AccountManagementView.jsp");
	
}else if (action.equals("viewReports")) {
    try {
        myFailure.getFailureFromDB();
           request.setAttribute("failureList", myFailure.failureList);
           request.getRequestDispatcher("ReportsView.jsp").forward(request, response);
       } catch (Exception e) {
           e.printStackTrace();
       }
   }else if (action.equals("viewReports2")) {
	    try {
	        myFailure.getFailureFromDB();
	           request.setAttribute("failureList", myFailure.failureList);
	           request.getRequestDispatcher("ReportsView2.jsp").forward(request, response);
	       } catch (Exception e) {
	           e.printStackTrace();
	       }
	   }  else if (action.equals("updateStatus")) {
        int anfrageId = Integer.parseInt(request.getParameter("anfrageId"));
        String newStatus = request.getParameter("newStatus");
        try {
            // Update the status in the database
            myFailure.updateStatus(anfrageId, newStatus);
            
            // Ensure the list is refreshed 
            myFailure.getFailureFromDB(); 
            
            // Forward the request to the JSP with the fresh data
            request.setAttribute("failureList", myFailure.failureList);
            request.getRequestDispatcher("ReportsView.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }  else if (action.equals("updateStatus.")) {
        int anfrageId = Integer.parseInt(request.getParameter("anfrageId"));
        String newStatus = request.getParameter("newStatus");
        try {
            // Update the status in the database
            myFailure.updateStatus(anfrageId, newStatus);
            
            // Ensure the list is refreshed 
            myFailure.getFailureFromDB(); 
            
            // Forward the request to the JSP with the fresh data
            request.setAttribute("failureList", myFailure.failureList);
            request.getRequestDispatcher("ReportsView2.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else if ("documentResolution".equals(action)) {
        int anfrageId = Integer.parseInt(request.getParameter("anfrageId"));
        int mitarbeiterId = Integer.parseInt(request.getParameter("Mitarbeiter_id"));
        String loesungsDetails = request.getParameter("loesungsDetails");
        

        try {
            myFailure.documentResolution(anfrageId, loesungsDetails, mitarbeiterId);
            response.sendRedirect("./TechnikerView.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("./TechnikerView.jsp?success=false");
        }
    } else if ("documentResolution2".equals(action)) {
        int anfrageId = Integer.parseInt(request.getParameter("anfrageId"));
        int mitarbeiterId = Integer.parseInt(request.getParameter("Mitarbeiter_id"));
        String loesungsDetails = request.getParameter("loesungsDetails");
        

        try {
            myFailure.documentResolution(anfrageId, loesungsDetails, mitarbeiterId);
            response.sendRedirect("./SuperTechnikerView.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("./SuperTechnikerView.jsp?success=false");
        }
    }else if ("viewBerichte".equals(action)) {
         try {
             
             myFailure.getAllBerichte(); // Populate the list
             request.setAttribute("berichteList", myFailure.berichteList);
             request.getRequestDispatcher("./FixedReportsView.jsp").forward(request, response); //
         } catch (Exception e) {
             e.printStackTrace();
         }
                   
     }else if ("viewBerichte2".equals(action)) {
         try {
             
             myFailure.getAllBerichte(); // Populate the list
             request.setAttribute("berichteList", myFailure.berichteList);
             request.getRequestDispatcher("./FixedReportsView2.jsp").forward(request, response); 
         } catch (Exception e) {
             e.printStackTrace();
         }
                   
     }else if (btnProfilSuper.equals("Zum Profil")) {
	 
      response.sendRedirect("./SuperTechnikerView.jsp");
      
  }else if (btnZurueckSuper.equals("Zurueck")) {
	 
      response.sendRedirect("./SuperTechnikerView.jsp");
  }else if (btnZurueckTechniker.equals("Zurueck")) {
	 
      response.sendRedirect("./TechnikerView.jsp");
  }else if(btnProfilTechniker.equals("Zum Profil")){
	  
	  response.sendRedirect("./TechnikerView.jsp");
  }else if(btnAktualisierenPasswort.equals("Ändern")){
		
		myLog.updateNewPassword(changeNewPassword);
		myMel.setUpdateChangePasswordSuccessful();
		response.sendRedirect("./ChangePasswordView1.jsp");	

	}else if(btnAktualisierenPasswort2.equals("Ändern")){
		
		myLog.updateNewPassword(changeNewPassword);
		myMel.setUpdateChangePasswordSuccessful();
		response.sendRedirect("./ChangePasswordView2.jsp");	

	}else if(abbrechenPasswort.equals("Abbrechen")){
		
		response.sendRedirect("./MitarbeiterView.jsp");	
	}else if(abbrechenPasswortTech.equals("Abbrechen")){
		
		response.sendRedirect("./TechnikerView.jsp");	
	}
	else{
		myLog.setLoggedIn(false);
		response.sendRedirect("./TaskView.jsp");	
	}


%>

</body>
</html>