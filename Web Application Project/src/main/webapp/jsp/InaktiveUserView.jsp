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
        <h1>Verwaltung von inaktiven Usern</h1>

  </header>
  	<form action="../jsp/TaskAppl.jsp" method="get" >
	   		<nav>
	   			 <input type="submit" data-mdb-ripple-init id="btn" class="btn btn-primary btn-block mb-3" name="btnProfilSuper" value="Zum Profil" />
	   		</nav>
   		</form>
  
    <!-- Alle inaktive User werden hier behandelt -->
	   
	<div id="benutzerModal" class="benutzer-modal">
		    <div class="benutzer-modal-inhalt">
		      	
		      	<h3 style="text-align: center;">Hier werden alle inaktiven Benutzer angezeigt</h3>
		      	
			      	<form action="../jsp/MitarbeiterAppl.jsp" method="get">
				    	<table class="styled-table">
							  <tr>
							  	<th>Personalnummer</th>
							    <th>Vorname</th>
							    <th>Nachname</th>
							    <th>Benutzername</th>
							    <th>Email</th>
							    <th>Rolle</th>
							    <th></th>
							  </tr>
							<jsp:getProperty name="myUser" property="alleBenutzerInaktiv" /> 
						</table> <br> <br>
						
						<input type='submit' name='backToVerwaltung' id="btn" class="btn btn-primary btn-block mb-4" value='Zurück' class="inputlogin">
		   			</form>
		     
		    </div>
  	</div>
	   

</body>
</html>