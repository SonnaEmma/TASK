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
        <h1>Benutzer Verwaltung</h1>
  
  
   </header>
   
      <nav>
		<ul>
	            	<!--  <li><a href="#">Berichte verwalten</a></li>
	            	<li><a href="#">Inventurmanagement</a></li> -->
	            	<!--  <li><a href="BenutzerView.jsp">Neue Benutzer anlegen</a></li> -->
	            	<li><form action="../jsp/TaskAppl.jsp" method="get" > <input type="submit" id="btn" class="btn btn-primary btn-block mb-4" name= "btnNeueUser" 
	      value="User anlegen"/> </form></li>
	            	<li><a href="InaktiveUserView.jsp">Inaktive Benutzer anzeigen</a></li>
	   </ul>
	        	<!--  <ul>
	            	<li><button onclick="loadContent('berichte')">Berichte verwalten</button></li>
			        <li><button onclick="loadContent('inventur')">Inventurmanagement</button></li>
			        <li><button onclick="loadContent('benutzer')">Benutzer verwalten</button></li>
			        <li><button onclick="loadContent('registrieren')">Benutzer anlegen</button></li>
	        	</ul> --> 
	    	</nav>
       <!-- Verstecktes Profilmenü -->
     
     
      
      <jsp:getProperty name="myMel" property="aktiveUser" />
      
      <form action="../jsp/TaskAppl.jsp" method="get">
    	<table class="styled-table">
			  <tr>
			  	<th>Personalnummer</th>
			    <th>Vorname</th>
			    <th>Nachname</th>
			    <th>Benutzername</th>
			    <th>Email</th>
			    <th>Rolle</th>
			    <th> <!-- <a href="./TaskAppl.jsp?action=refresh&">Refresh</a> --></th>
			  </tr>
			  <jsp:getProperty name="myUser" property="alleBenutzer" />
		</table> <br> <br>
		<input type='submit' name='zurueck' id="btn" class="btn btn-primary btn-block mb-4" value='Zurück' class="inputlogin">
	   </form>
	   
</body>
</html>