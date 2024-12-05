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
<title>Passwortänderung</title>
<script type="text/javascript" src="../js/Task.js" ></script>
<link rel="stylesheet" type="text/css" href="../css/Task.css">
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
        <h1>Änderung des Passworts</h1>
     
   </header>


  <div class="tab-content custom-tab-content">
	  <div
	    class="tab-pane fade show active"
	    id="pills-login"
	    role="tabpanel"
	    aria-labelledby="tab-login"
	    style= 'text-align: center;'
	  >
	  
		<h3 style= "text-align: center;"> <jsp:getProperty property="messageUpdatePassword" name="myMel"/> </h3>
		
			
		   <form action="../jsp/TaskAppl.jsp" method="get" onsubmit="return checkInput(this)">
		      
				<!-- Password input -->
				
		      <div data-mdb-input-init class="form-outline mb-4" style="text-align:center">
		      
		      Altes Passwort:  <input type="text" class="form-control custom-input" name="changePassord" value='<jsp:getProperty name="myLog" property="altesPasswort"/>' required /> <br>
		      Neues Passwort:  <div id="errorNewPassword" class="fehlerfeld" ></div>
		      <input type="text" class="form-control custom-input" name="newPassword" value='' required onkeyup="checkNewPassword(this.value)"/>
		     <input type="submit" data-mdb-ripple-init id="btn" class="btn btn-primary btn-block mb-3" name="btnAktualisierenPasswort" value="Ändern" onclick="setButtonClicked(this.name)"/> 
		        
		      </div>
	
			</form>
			 <form action="../jsp/TaskAppl.jsp" method="get" >
				<input type="submit" data-mdb-ripple-init id="btn" class="btn btn-primary btn-block mb-3" name="abbrechenPasswort" value="Abbrechen" /> 
			</form>
		</div>
	</div>

	
	<footer>
        <p>&copy; 2024 TASK. All rights reserved.</p>
    </footer>
</body>
</html>