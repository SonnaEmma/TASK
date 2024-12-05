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
<title>Report Issue </title>
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
    <header id ="main-content">
        <h1>Anfrageformular</h1>
        
    </header>
    <div class="tab-content custom-tab-content">
	  <div
	    class="tab-pane fade show active"
	    id="pills-login"
	    role="tabpanel"
	    aria-labelledby="tab-login"
	  >
    <form id="dynamicForm" action="ReportIssueAppl.jsp" method="GET" onsubmit="return showAlert()">
        <input type="hidden" name="personnalnummer" value="<%= myLog.getPersonalnummer()%>"> <br>
        <h3>Wählen Sie den Typ der Meldung:</h3>
    <label>
        <input type="radio" name="requestType" value="Fehler" required> Fehler melden
    </label><br>
    <label>
        <input type="radio" name="requestType" value="Verbesserungsvorschlag"> Verbesserungsvorschlag
    </label><br><br>
	<label for="problemType">Handelt es sich um ein Problem mit:</label><br>
                <input type="radio" id="software" name="problemType" value="Software" required>
                <label for="software">Software</label><br>
                <input type="radio" id="hardware" name="problemType" value="Hardware">
                <label for="hardware">Hardware</label><br><br>

                <label for="problemDescription">Detaillierte Problembeschreibung:</label><br>
                <textarea id="problemDescription" name="beschreibung" rows="8" cols="38"  placeholder="detaillerte Bechreibung " required></textarea><br><br>

               <label for="datum">Feststellungsdatum am (Datum):</label>
        <input type="date" id="datum" name="festelltllungsdatum" 
               value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
        <br><br>
        
   
							<button type="button" id="btn" class="btn btn-primary btn-block mb-4" name="backtosuper" onclick="window.location.href='MitarbeiterView.jsp';" >
  Return </button>
							<input type ="reset" id="btn" class="btn btn-primary btn-block mb-4" name="backtosuper" name ="abrechen" value="Abbrechen">
								
									<button type="submit" id="btn" class="btn btn-primary btn-block mb-4" name="senden"
										value="Senden"  >Senden</button>
							

						
    </form>
    </div>
    </div>
    <script>
function showAlert() {
    alert("Anfrage erfolgreich gesendet");
    return true;  
}
</script>

<footer>
        <p>&copy; 2024 TASK. All rights reserved.</p>
    </footer> -->
</body>
</html>