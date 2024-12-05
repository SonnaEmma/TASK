<%@page import="java.util.List"%>
<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@page import="de.hwg_lu.bwi520.beans.KontaktBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TaskBean"%>
<%@page import="de.hwg_lu.bwi520.beans.LoginBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MeldungsBean"%>
<%@page import="de.hwg_lu.bwi520.beans.BenutzerBean"%>
<%@page import="de.hwg_lu.bwi520.beans.ChangeDataUserBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TechnicalFailureBean"%>
<%@page import="de.hwg_lu.bwi520.keineBeans.Failure"%>
<%@page import="de.hwg_lu.bwi520.keineBeans.Bericht"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fixed Reports</title>
      <script type="text/javascript" src="../js/Task.js" ></script>
    <link rel="stylesheet" type="text/css" href="../css/Task.css">
</head>
<body id="portalview">
<script type="text/javascript" src="../js/Task.js" ></script>
<jsp:useBean id="myAnfrage" class="de.hwg_lu.bwi520.beans.AnfrageBean" scope="session" />
<jsp:useBean id="myFailure" class="de.hwg_lu.bwi520.beans.TechnicalFailureBean" scope="session" />
<jsp:useBean id="myCDU" class="de.hwg_lu.bwi520.beans.ChangeDataUserBean" scope="session" />
<jsp:useBean id="myBenutzer" class="de.hwg_lu.bwi520.beans.BenutzerBean" scope="session" />
<jsp:useBean id="myMel" class="de.hwg_lu.bwi520.beans.MeldungsBean" scope="session" />
<jsp:useBean id="myLog" class="de.hwg_lu.bwi520.beans.LoginBean" scope="session" />
<jsp:useBean id="myTask" class="de.hwg_lu.bwi520.beans.TaskBean" scope="session" />
<jsp:useBean id="myK" class="de.hwg_lu.bwi520.beans.KontaktBean" scope="session" />

<%
	if (!myLog.isLoggedIn()) response.sendRedirect("./TaskView.jsp");
%>

<header>
    <h1>Gelöste Anfragen</h1>
</header>
<main>
<table class="styled-table">
    <thead>
        <tr>
            <th>Bericht ID</th>
            <th>Anfrage ID</th>
            <th>Techniker ID</th>
            <th>Datum</th>
            <th>Lösungsdetails</th>
        </tr>
    </thead>
    <tbody>
        <%
        @SuppressWarnings("unchecked")
            List<Bericht> berichteList = (List<Bericht>) request.getAttribute("berichteList");
            if (berichteList != null && !berichteList.isEmpty()) {
                for (Bericht bericht : berichteList) {
        %>
        <tr>
            <td><%= bericht.getBerichtId() %></td>
            <td><%= bericht.getAnfrageId() %></td>
            <td><%= bericht.getTechnikerId() %></td>
            <td><%= bericht.getDatum() %></td>
            <td><%= bericht.getLoesungsDetails() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5">Bericht nicht verfügbar.</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
</main>
 <form action="./TaskAppl.jsp" method="get" >
	   <input type="submit" data-mdb-ripple-init id="btn" class="btn btn-primary btn-block mb-3" name="btnZurueckSuper" value="Zurueck" />
	   			 
   	</form>
</body>
</html>
