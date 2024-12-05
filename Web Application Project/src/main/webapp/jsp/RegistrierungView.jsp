<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TechnicalFailureBean"%>
<%@page import="de.hwg_lu.bwi520.beans.ChangeDataUserBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TaskBean"%>
<%@page import="de.hwg_lu.bwi520.beans.LoginBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MeldungsBean"%>
<%@page import="de.hwg_lu.bwi520.beans.BenutzerBean"%>
<%@page import="de.hwg_lu.bwi520.beans.KontaktBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account-Manager</title>

<link rel="stylesheet" type="text/css" href="../css/Task.css">
<script type="text/javascript" src="../js/Task.js" ></script>
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
        <h1>Anlegen von Benutzern</h1>
  
    
      <!--  <nav>
        <ul>
            <li><a href="task.jsp">Hime</a></li>
            <li><a href="about.jsp">Über uns</a></li>
            <li><a href="contact.jsp">Kontakt</a></li>
           <!--  <li class="profile-menu">
                <a href="PortalView.jsp" onclick="toggleProfileMenu()">
                    <img src="../img/profile icon.jpeg" alt="Profile Icon" class="profile-icon">
                    Abmelden
                </a>
               
            </li>
        </ul> 
    </nav> -->
  
   </header>
   
  <div class="tab-content custom-tab-content">
	  <div
	    class="tab-pane fade show active"
	    id="pills-login"
	    role="tabpanel"
	    aria-labelledby="tab-login"
	  >
	  
	   <jsp:getProperty property="meldungHtml" name="myMel"/>
	   <form action="../jsp/TaskAppl.jsp" method="get" onsubmit="return checkInput(this)">
	      
	
	      <!-- First Name input -->
	      <div id="errorFirstname" class="fehlerfeld"></div>
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text" id="registerFirstName" class="form-control custom-input" name="firstNameReg" value="" 
	        placeholder="First name" required onkeyup="checkFirstname(this.value)" />
	        
	      </div>
	
			
			<!-- Last Name input -->
			<div id="errorLastname" class="fehlerfeld"></div>
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text" id="registerLastName" class="form-control custom-input" name="lastNameReg" value="" 
	        placeholder="Last name" required  onkeyup="checkLastname(this.value)"/>
	        
	      </div>
	      
			<!-- Personal number input -->
			<!--   <div id="errorIDPersonal" class="fehlerfeld" ></div>
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="number" id="registerPersonalnummer" class="form-control custom-input" name="idpersonal" value="" 
	        placeholder="ID Personal" required onkeyup="checkIDPersonal(this.value)"/>
	        
	      </div> -->
	      
	      <!-- Username input -->
	      <div id="errorUsername" class="fehlerfeld"></div>
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text" id="registerUsername" class="form-control custom-input" name="usernameReg" value="" 
	        placeholder="Username" required onkeyup="checkUsername(this.value)" />
	        
	      </div>
	
	      <!-- Email input -->
	      <div id="errorEmail" class="fehlerfeld"></div>
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="email" id="registerEmail" class="form-control custom-input" placeholder="Email" name="emailReg" 
	        value="" required onkeyup="checkEmail(this.value)"/>
	       
	      </div>
	
	      <!-- Password input -->
	      <div id="errorPassword" class="fehlerfeld" ></div>
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text" id="registerPassword" class="form-control custom-input" name="passwordReg" value="" 
	        placeholder="Password" required onkeyup="checkPassword(this.value)" />
	        
	      </div>
	
	      <!-- Repeat Password input -->
	      <!-- <div id="errorPassword" class="fehlerfeld" ></div>
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text" id="registerRepeatPassword" class="form-control custom-input" name="passwordReg2" value="" 
	        placeholder="Repeat Password" required onkeyup="checkRepeatPassword(this.value)"/>
	      
	      </div> -->
	      
	      <div id="errorPhone" class="fehlerfeld"></div>
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="number" id="registerPhone" class="form-control custom-input" name="telefonnummer" value="" 
	        placeholder="Phone number" required onkeyup="checkPhone(this.value)"/>
	        
	      </div>
	      
	      
	      <div data-mdb-input-init class="form-outline mb-4">
	      
	      <select name="rolle" class="form-control custom-input">
	     	<option value="" disabled selected>Wählen Sie eine Rolle</option> 
	        <option value="Mitarbeiter">Mitarbeiter</option>
	        <option value="Techniker">Techniker</option>
	        <option value="Super Techniker">Super Techniker</option>
	        
	       </select> 
	      </div>
	      
	     
	      <div data-mdb-input-init class="form-outline mb-4">
	      
	      <select name="abteilung" class="form-control custom-input">
	     	<option value="" disabled selected>Wählen Sie die entsprechende Abteilung</option> 
	        <option value="IT">IT</option>
	        <option value="Finanz">Finanz</option>
	        <option value="Personal">Personal</option>
	        <option value="Controlling">Controlling</option>
	        <option value="Marketing">Marketing</option>
	        <option value="Vertrieb">Vertrieb</option>
	       </select>
	        
	      </div>
	
	
	      <!-- Submit button -->
	      <input type="submit" data-mdb-ripple-init id="btn" class="btn btn-primary btn-block mb-3" name="btnReg" value="User anlegen" 
	      									onclick="setButtonClicked(this.name)"/> 
	      
    </form>
  
    <form action="../jsp/TaskAppl.jsp" method="get"> <input type="submit" id="btn" class="btn btn-primary btn-block mb-4" name= "btnZurueck" 
	      value="Previous"/> </form>
    
  	</div>
  </div>
  
  
  <!-- <footer>
        <p>&copy; 2024 TASK. All rights reserved.</p>
    </footer> -->

</body>
</html>