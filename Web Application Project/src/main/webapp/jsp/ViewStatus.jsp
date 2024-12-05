<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TechnicalFailureBean"%>
<%@page import="de.hwg_lu.bwi520.beans.ChangeDataUserBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TaskBean"%>
<%@page import="de.hwg_lu.bwi520.beans.LoginBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MeldungsBean"%>
<%@page import="de.hwg_lu.bwi520.beans.BenutzerBean"%>
<%@page import="de.hwg_lu.bwi520.beans.KontaktBean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Status</title>
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
<input type="hidden" name="personnalnummer" value="<%= myLog.getPersonalnummer()%>"> <br>
<%
	if (!myLog.isLoggedIn()) response.sendRedirect("./TaskView.jsp");
%>
<header id="main-content">
        <h1>Meine Anfrage</h1>
   </header>
<table class ="styled-table">
	<tr>
			<th>Anfrage_id<th/>
			<th>Anfrage_type<th/>
			<th>Anfrage_kategorie<th/>
			<th>Beschreibung<th/>
			<th>Festellungsdatum<th/>
			<th>Gesendet_am<th/>
			<th>Status<th/>
	<tr/>
	
	<%= myAnfrage.readAllAnfrageFromDB() %>

</table>
	
   		<button id="btn" class="btn btn-primary btn-block mb-4" onclick="window.print()">Ausdrucken</button>
 <button type="button" id="btn" class="btn btn-primary btn-block mb-4" name="backtosuper" onclick="window.location.href='MitarbeiterView.jsp';" >
  Return
</button>
       <footer>
        <p>&copy; 2024 TASK. All rights reserved.</p>
    </footer>

</body>
</html>