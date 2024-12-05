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
	<h2 style="text-align:center"> Bestätigung der Datenänderung</h2> <br> 
   
    <!-- <jsp:getProperty property="meldungHtml" name="myMel"/> -->
    
    <p style="text-align:center"> Wollen Sie wirklich die Daten für den User <jsp:getProperty property="benutzer" name="myMel"/> ändern?</p>
    <p style="text-align:center">Wenn ja, drücken Sie bitte auf OK zum Bestätigen und direkt auf Ihr Profil weitergeleitet zu werden, sonst auf Schließen, um den Vorgang abzubrechen</p>
    
    <div>
	     <form action="../jsp/MitarbeiterAppl.jsp" method="get" >
	     
	      <input type="submit" data-mdb-ripple-init id="btn" class="btn btn-primary btn-block mb-3" name="btnOK" value="OK" /> 
	       <input type="submit" data-mdb-ripple-init id="btn" class="btn btn-primary btn-block mb-3" name="btnSchließen" value="Schließen" /> 
	     </form>
    </div>
    
   
   
    <footer>
        <p>&copy; 2024 TASK. All rights reserved.</p>
    </footer>
   
</body>
</html>