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

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Reports</title>
    <script type="text/javascript" src="../js/Task.js" ></script>
    <link rel="stylesheet" type="text/css" href="../css/Task.css">
</head>
<body id="portalview">
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
    <h1>Gemeldete Anfragen</h1>
</header>


<main>
<table  class="styled-table">
    <tr>
        <th>Anfrage ID</th>
            <th>Anfrage typ</th>
            <th>Kategorie</th>
            <th>Datum</th>
            <th>Beschreibung</th>
            <th>Status</th>
            <th>Mitarbeiter ID</th>
            <th>Update Status</th>
            <th>Document Resolution</th>
    </tr>
    <%
    @SuppressWarnings("unchecked")
        // Loop over the failureList in the session (now properly rendered)
        List<Failure> failureList = (List<Failure>) request.getAttribute("failureList");
        if (failureList != null) {
            for (Failure failure : failureList) {
    %>
    <tr>
        <td><%= failure.getAnfrage_Id() %></td>
        <td><%= failure.getAnfragetyp() %></td>
        <td><%= failure.getKategorie() %></td>
        <td><%= failure.getDatum() %></td>
        <td><%= failure.getBeschreibung() %></td>
        <td><%= failure.getStatus() %></td>
        <td><%= failure.getPersonalnummer() %></td>     
        <td>
            <form action="TaskAppl.jsp" method="post">
                <input type="hidden" name="action" value="updateStatus."/>
                <input type="hidden" name="anfrageId" value="<%= failure.getAnfrage_Id() %>"/>
                <select name="newStatus" onchange="this.form.submit()">
                    <option value="Reported" <%= "Reported".equals(failure.getStatus()) ? "selected" : "" %>>Reported</option>
                    <option value="In Progress" <%= "In Progress".equals(failure.getStatus()) ? "selected" : "" %>>In Progress</option>
                    <option value="Resolved" <%= "Resolved".equals(failure.getStatus()) ? "selected" : "" %>>Resolved</option>
                </select>
            </form>
        </td>
     <td>
	   <% if ("Resolved".equals(failure.getStatus())) { %>
	       <form action="DocumentResolutionView2.jsp" method="get">
	           <input type="hidden" name="anfrageId" value="<%= failure.getAnfrage_Id() %>"/>
	           <input type="submit" value="dokumentieren"/>
	       </form>
	   <% } else { %>
	       Noch nicht gelöst
	   <% } %>
	</td>

    </tr>
 <%
            }
        } else {
    %>
    <tr>
        <td colspan="7">Anfrage nicht verfügbar.</td>
    </tr>
    <%
        }
    %>

</table>
    
    <form action="./TaskAppl.jsp" method="get" >
	   <input type="submit" data-mdb-ripple-init id="btn" class="btn btn-primary btn-block mb-3" name="btnZurueckSuper" value="Zurueck" />
	   			 
   	</form>
</main>

<!-- <footer>
    <p>&copy; 2024 Task Application. All rights reserved.</p>
</footer> -->
</body>
</html>
