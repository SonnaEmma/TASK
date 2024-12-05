
<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TechnicalFailureBean"%>
<%@page import="de.hwg_lu.bwi520.beans.ChangeDataUserBean"%>
<%@page import="de.hwg_lu.bwi520.beans.KontaktBean"%>
<%@page import="de.hwg_lu.bwi520.beans.BenutzerBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MeldungsBean"%>
<%@page import="de.hwg_lu.bwi520.beans.LoginBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TaskBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Portal</title>
<link rel="stylesheet" type="text/css" href="../css/Task.css">
<script type="text/javascript" src="../js/Task.js" ></script>
</head>
<body id="portalview">
<jsp:useBean id="myAnfrage" class="de.hwg_lu.bwi520.beans.AnfrageBean" scope="session" />
<jsp:useBean id="myFailure" class="de.hwg_lu.bwi520.beans.TechnicalFailureBean" scope="session" />
<jsp:useBean id="myCDU" class="de.hwg_lu.bwi520.beans.ChangeDataUserBean" scope="session" />
<jsp:useBean id="myTask" class="de.hwg_lu.bwi520.beans.TaskBean" scope="session" />
<jsp:useBean id="myLog" class="de.hwg_lu.bwi520.beans.LoginBean" scope="session" />
<jsp:useBean id="myMel" class="de.hwg_lu.bwi520.beans.MeldungsBean" scope="session" />
<jsp:useBean id="myUser" class="de.hwg_lu.bwi520.beans.BenutzerBean" scope="session" />
<jsp:useBean id="myK" class="de.hwg_lu.bwi520.beans.KontaktBean" scope="session" />


<!-- <video autoplay muted loop id="myVideo">
  <source src="videohintergrund.mp4" type="video/mp4">
</video> -->
    <header>
        <h1>ELALO Group Portal</h1>

     </header>
    
   
    
<!-- Pills navs -->

<ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
  
  
   <li class="nav-item" role="presentation">
    <a class="nav-link custom-nav-link" href="#" onclick="showModal()">Admin kontaktieren</a>
   </li>
  
</ul>
<!-- Pills navs -->

<!-- Pills content -->
<div class="tab-content custom-tab-content">
  <div
    class="tab-pane fade show active"
    id="pills-login"
    role="tabpanel"
    aria-labelledby="tab-login"
  >
    <form action="../jsp/TaskAppl.jsp" method="get" onkeyup="checkFirstname(this.value)">
      	
		<div style="text-align: center;"> <jsp:getProperty property="meldungHtml" name="myMel"/></div>
			
      <!-- Username input -->
      <div data-mdb-input-init class="form-outline mb-4">
        <input type="text" id="loginUserame" class="form-control custom-input" name="usernameLog" value="" placeholder="Benutzername" required/>
       
      </div>

      <!-- Password input -->
      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="password" id="loginPassword" class="form-control custom-input" name="passwordLog" value="" placeholder="Passwort" required />
	        
			<!-- Kontakt zu Admin -->
	     <p class="fehlerfeld">Zugangsdaten vergessen? Bitte den Admin kontaktieren.</p>
	
	      <!-- Submit button -->
	      <input type="submit" id="btn" class="btn btn-primary btn-block mb-4" name= "losgehts" 
	      value="Los geht's" onclick="setButtonClicked(this.name)"> 
		</div>
      
    </form>
    
    <form action="../jsp/TaskAppl.jsp" method="get" > <input type="submit" id="btn" class="btn btn-primary btn-block mb-4" name= "backtotask" 
	      value="BackToTask"/> </form>
    
  </div>
     
      <!-- Formular für Kontakt zu Admin -->
    <div id="contactModal" class="modal">
	    <div class="modal-content">
	      <span class="close" onclick="closeModal()">&times;</span>
	      
	      <h2>Admin kontaktieren</h2>
		      <form action="../jsp/MitarbeiterAppl.jsp" method="get" onsubmit="return validateContactForm()">
		        <div class="form-outline mb-4">
		          <input type="text" id="contactName" class="form-control custom-input" name="name" placeholder="Dein Name" value="" required />
		        </div>
		        
		        <div class="form-outline mb-4">
		          <input type="email" id="contactEmail" class="form-control custom-input" name="email" placeholder="Deine Email" value="" required />
		        </div>
		        
		        <div class="form-outline mb-4">
		          <textarea id="contactMessage" class="form-control custom-input" name="message" placeholder="Deine Message, seien Sie bitte kurz." rows="10" required></textarea>
		        </div>
		        
		        <input type="submit" class="btn btn-primary btn-block mb-4" name="btnSend" value="Message senden" />
		        <button type="button" id="btn" class="btn btn-secondary btn-block mb-4" onclick="closeModal()">Abbrechen</button>
		      </form>
	    </div>
  </div>
     		
      
  </div>
  
  
  
  

<!-- Pills content -->

   <footer>
        <p>&copy; 2024 TASK. All rights reserved.</p>
    </footer>
    
</body>
</html>