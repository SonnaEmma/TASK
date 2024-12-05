<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TechnicalFailureBean"%>
<%@page import="de.hwg_lu.bwi520.beans.KontaktBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TaskBean"%>
<%@page import="de.hwg_lu.bwi520.beans.LoginBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MeldungsBean"%>
<%@page import="de.hwg_lu.bwi520.beans.BenutzerBean"%>
<%@page import="de.hwg_lu.bwi520.beans.ChangeDataUserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account-Manager</title>

<link rel="stylesheet" type="text/css" href="../css/Task.css">
<script type="text/javascript" src="../js/Task.js" ></script>
<script type="text/javascript" src="../js/HelloTask.js" ></script>
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
	if (!myLog.isLoggedIn()) response.sendRedirect("./TaskView.jsp");
%>

	<header id="main-content">
        <h1>Datenänderung von Benutzern</h1>
     
   </header>
   	
   	<form action="../jsp/TaskAppl.jsp" method="get" >
	   		<nav>
	   			 <input type="submit" data-mdb-ripple-init id="btn" class="btn btn-primary btn-block mb-3" name="btnProfilSuper" value="Zum Profil" />
	   		</nav>
   		</form>
   
  <div class="tab-content custom-tab-content">
	  <div
	    class="tab-pane fade show active"
	    id="pills-login"
	    role="tabpanel"
	    aria-labelledby="tab-login"
	  >
	  
		<h3 style= "text-align: center;"> <jsp:getProperty property="messageChangeDataUser" name="myMel"/> </h3>
		
		
	   <form action="../jsp/MitarbeiterAppl.jsp" method="get" onsubmit="return showAlert()">
	      
	
	      <!-- First Name input -->
	      
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text"  class="form-control custom-input" name="firstNameChange" value='<jsp:getProperty name="myCDU" property="vorname"/>' required />
	        
	      </div>
	
			
			<!-- Last Name input -->
			
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text" class="form-control custom-input" name="lastNameChange" value='<jsp:getProperty name="myCDU" property="nachname"/>'  required  />
	        
	      </div>
	      
			
	      
	      <!-- Username input -->
	   
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text" class="form-control custom-input" name="usernameChange" value='<jsp:getProperty name="myCDU" property="username"/>' required  />
	        
	      </div>
	
	      <!-- Email input -->
	  
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="email" class="form-control custom-input" name="emailChange" value='<jsp:getProperty name="myCDU" property="email"/>' required />
	       
	      </div>
	
	      <!-- Password input -->
	      
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text" class="form-control custom-input" name="passwordChange" value='<jsp:getProperty name="myCDU" property="passwort"/>' required />
	        
	      </div>
	   
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text" class="form-control custom-input" name="telefonnummerChange" value='<jsp:getProperty name="myCDU" property="tel_nr"/>' required />
	        
	      </div>
	      
	      
	      <div data-mdb-input-init class="form-outline mb-4">
	      
	      <select name="rolleChange" class="form-control custom-input">
	     	<option value="" disabled selected> <jsp:getProperty name="myCDU" property="rolle"/> Wählen Sie jetzt die richtige Rolle </option> 
	        <option value="Mitarbeiter">Mitarbeiter</option>
	        <option value="Techniker">Techniker</option>
	        <option value="Super Techniker">Super Techniker</option>
	        
	       </select> 
	       	        
	      </div>
	      
	    
	      <div data-mdb-input-init class="form-outline mb-4">
	       
	     <select name="abteilungChange" class="form-control custom-input">
	     	<option value="" disabled selected> <jsp:getProperty name="myCDU" property="abteilung"/> Wählen Sie jetzt die richtige Abteilung </option> 
	        <option value="IT">IT</option>
	        <option value="Finanz">Finanz</option>
	        <option value="Personal">Personal</option>
	        <option value="Controlling">Controlling</option>
	        <option value="Marketing">Marketing</option>
	        <option value="Vertrieb">Vertrieb</option>
	       </select>
	       
	       <!--   <input type="text" class="form-control custom-input" name="abteilungChange" value='<jsp:getProperty name="myCDU" property="abteilung"/>' required />
	        -->
	      </div>
	
	
	      <!-- Submit button -->
	      <input type="submit" data-mdb-ripple-init id="btn" class="btn btn-primary btn-block mb-3" name="btnAktualisieren" value="Aktualisieren" /> 
	      
    </form>
    
  
    <form action="../jsp/MitarbeiterAppl.jsp" method="get"> <input type="submit" id="btn" class="btn btn-primary btn-block mb-4" name= "btnbackTo" 
	      value="Abbrechen"/> </form>
    
  	</div>
  </div>
  
<script>
	function showAlert() {
	    alert("Daten wurden erfolgreich aktualisiert!");
	    return true;
		}
</script>
</body>
</html>