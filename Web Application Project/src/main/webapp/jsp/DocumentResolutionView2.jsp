<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@page import="de.hwg_lu.bwi520.beans.KontaktBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TaskBean"%>
<%@page import="de.hwg_lu.bwi520.beans.LoginBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MeldungsBean"%>
<%@page import="de.hwg_lu.bwi520.beans.BenutzerBean"%>
<%@page import="de.hwg_lu.bwi520.beans.ChangeDataUserBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TechnicalFailureBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="de.hwg_lu.bwi520.keineBeans.Failure" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Technician Dashboard</title>
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
<header><h2> Bericht</h2></header>
	 

<div >
	<form action="TaskAppl.jsp" method="post" onsubmit="return showAlert()">
	    <input type="hidden" name="action" value="documentResolution2"/>
	    
	    <label for="anfrageId">Anfrage wählen:</label>
	    <select name="anfrageId" required>
	   <% 
	            List<Failure> failureList = myFailure.getFailureList(); // Assume getFailureList fetches current failures
	            for (Failure failure : failureList) {
	        %>
	        <option value="<%= failure.getAnfrage_Id() %>"><%= failure.getAnfrage_Id() %>: <%= failure.getBeschreibung() %> (Reported: <%= failure.getDatum() %>)</option>
	        <% } %>
	    </select><br/>
	    
	    <input type="hidden" name="Mitarbeiter_id" value="<%= session.getAttribute("Mitarbeiter_id") %>"/>
	
	    <label for="loesungsDetails">Lösungsbeschreibung:</label><br/>
	    <textarea name="loesungsDetails" rows="5" cols="100" required></textarea><br/>
	
	    <input type="submit" id="btn" class="btn btn-primary btn-block mb-4" name="btnResolution2" value="Senden"/>
	</form>
	<form action="./TaskAppl.jsp" method="get" >
	   <input type="submit" data-mdb-ripple-init id="btn" class="btn btn-primary btn-block mb-3" name="btnZurueckSuper" value="Zurueck" />
	   			 
   	</form>
</div>
    <script>
function showAlert() {
    alert("erfolgreich dokumentiert");
    return true;  
}
</script>
</body>
</html>


