<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@page import="de.hwg_lu.bwi520.beans.GegenstandBean"%>
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
<title>Ausleihen </title>
<link rel="stylesheet" type="text/css" href="../css/Task.css">
<script type="text/javascript" src="../js/Task.js" ></script>
</head>
<body id="portalview">
<jsp:useBean id="myAnfrage" class="de.hwg_lu.bwi520.beans.AnfrageBean" scope="session" />
<jsp:useBean id="myObjekt" class="de.hwg_lu.bwi520.beans.GegenstandBean" scope="session" />
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
        <h1>Ausleihen von Gegenständen </h1>
  
  
   </header>
      	<h3 style='text-align:center'></h3>
   
   		<!-- <h3 style='text-align:center'></h3>  -->
<!-- Rückgabe-Button -->
<button id="rueckgabeButton" id="btn" class="btn btn-primary" onclick="toggleDiv()">Rückgabe</button>


<div id="rueckgabeDiv" style="text-align:center; display: none;">
   	 	


    <form action="../jsp/GegenstandAppl.jsp" method="get">
    	Produknummer:<input type='number' name='produktnummerRueckgabe' id="kurz" class="form-control custom-input" placeholder= "Produktnummer" required value=''>
    	Mitarbeiternummer:<input type='number' name='mitarbeiternummerRueckgabe' id="kurz" class="form-control custom-input" placeholder= "Personalnummer" required readonly
    	value='<jsp:getProperty name="myObjekt" property="personalIDFeld" />'>
    	<!-- Rückgabedatum:<input type="date" name='rueckgabedate' id="kurz" class="form-control custom-input" required > -->
        <input type="submit" id="btn" class="btn btn-primary btn-block mb-4" name="btnRückgabe" value="Abgeben" />
    </form> 
</div>

<!-- JavaScript zum Anzeigen des Div-Tags"rueckgabeButton"-->
<script>
function toggleDiv() {
    var rueckgabeDiv = document.getElementById('rueckgabeDiv');
    rueckgabeDiv.style.display = 'block'; // Div-Tag sichtbar machen
}
</script>

<jsp:getProperty property="bestaetigungHtml" name="myMel"/>

<form action="../jsp/GegenstandAppl.jsp" method="get">
    	<table class="styled-table">
			  <tr>
			  	<th>Produktnummer</th>
			  	<th>Name</th>
			    <th>Beschreibung</th>
			    <th>Status</th>    
			    <th></th>
			  </tr>
			  <jsp:getProperty name="myObjekt" property="alleObjekte" />
		</table> <br> <br>
		<input type='submit' id='btn' class='btn btn-primary btn-block mb-4' name='btnWeiter' value= 'Weiter' />
</form>
	  <form action="../jsp/GegenstandAppl.jsp" method="get">		
	  	<input type='submit' name='zurueckObjekte' id="btn" class="btn btn-primary btn-block mb-4" value='Zurück'>
	  </form> 
</body>
</html>