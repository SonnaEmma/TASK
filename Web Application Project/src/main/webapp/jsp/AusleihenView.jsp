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
	//if (!myLog.isLoggedIn()) response.sendRedirect("./TaskView.jsp");
%> 
    <header id="main-content">
        <h1>Ausleihbestätigung </h1>
 
   </header>
   
   <!--  	<h3 style='text-align:center'>Um die Ausleihe zu bestätigen, müssen Sie jetzt ein paar Eingaben machen</h3> -->
   
   <form action="../jsp/GegenstandAppl.jsp" method="get">
    	<table class="styled-table">
			  <tr>
			  	<th>Produktnummer</th>
			  	<th>Name</th>
			  </tr>
			  <jsp:getProperty name="myObjekt" property="ausgeliehene" />
		</table> <br> <br>
		
		
		<div style='text-align:center'>
		Produknummer:<input type='number' name='produktnummer' id="kurz" class="form-control custom-input" placeholder= "Produktnummer" required readonly
		value='<jsp:getProperty name="myObjekt" property="objekt_nr" />'>
		Mitarbeiternummer:<input type='number' name='mitarbeiternummer' id="kurz" class="form-control custom-input" placeholder= "Personalnummer" readonly required 
		value='<jsp:getProperty name="myObjekt" property="personalIDFeld" />'>
		<!-- Ausleihdatum:<input type="date" name='ausleihdate' id="kurz" class="form-control custom-input" required > <br> -->
		
		<br> <input type='submit' id='btn' class='btn btn-primary btn-block mb-4' name='btnAusleihen' value= 'Ausleihen' />
		</div >
</form>

<div style='text-align:center'>
	<form action="../jsp/GegenstandAppl.jsp" method="get">
		<input type='submit' id='btn' class='btn btn-primary btn-block mb-4' name='btnAbb' value= 'Abbrechen' />
	</form> 
</div>   

   
	
</body>
</html>