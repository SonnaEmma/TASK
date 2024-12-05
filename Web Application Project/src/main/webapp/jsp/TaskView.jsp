
<%@page import="de.hwg_lu.bwi520.beans.AnfrageBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TechnicalFailureBean"%>
<%@page import="de.hwg_lu.bwi520.beans.ChangeDataUserBean"%>
<%@page import="de.hwg_lu.bwi520.beans.KontaktBean"%>
<%@page import="de.hwg_lu.bwi520.beans.LoginBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MeldungsBean"%>
<%@page import="de.hwg_lu.bwi520.beans.BenutzerBean"%>
<%@page import="de.hwg_lu.bwi520.beans.TaskBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TASK</title>
    <link rel="stylesheet" type="text/css" href="../css/Task.css">
    <script type="text/javascript" src="../js/Task.js" ></script>
    <script type="text/javascript" src="../js/HelloTask.js" ></script>
</head>
<body>
<jsp:useBean id="myAnfrage" class="de.hwg_lu.bwi520.beans.AnfrageBean" scope="session" />
<jsp:useBean id="myFailure" class="de.hwg_lu.bwi520.beans.TechnicalFailureBean" scope="session" />
<jsp:useBean id="myCDU" class="de.hwg_lu.bwi520.beans.ChangeDataUserBean" scope="session" />
<jsp:useBean id="myTask" class="de.hwg_lu.bwi520.beans.TaskBean" scope="session" />
<jsp:useBean id="myUser" class="de.hwg_lu.bwi520.beans.BenutzerBean" scope="session" />
<jsp:useBean id="myMel" class="de.hwg_lu.bwi520.beans.MeldungsBean" scope="session" />
<jsp:useBean id="myLog" class="de.hwg_lu.bwi520.beans.LoginBean" scope="session" />
<jsp:useBean id="myK" class="de.hwg_lu.bwi520.beans.KontaktBean" scope="session" />

<form action="../jsp/PortalAppl.jsp" method="get" >
     <header>
        <img src="../img/firm logo.png" alt="Company Logo" class="logo">
        <h1>Willkommen bei TASK</h1>

    
     <nav>
        <ul id="HelloTask">
           	<li id="HelloTask"><a id="HelloTask" href="#" onmouseover="showTooltip(event, 'In der heutigen Zeit stoßen viele Unternehmen auf das Problem, dass ihre IT-Unterstützung nicht mehr effektiv ist. Angesichts dieser Herausforderungen haben wir, eine Gruppe motivierter Wirtschaftsinformatik-Studenten, bestehend aus Emmanuel Sonna, Laurel Pangui und Loic Fodjo, beschlossen, ein neues Anwendungswerkzeug zu entwerfen. Diese Lösung soll die IT-Unterstützung in Unternehmen revolutionieren.')" onmouseout="hideTooltip()">Über uns</a></li>
		    <li id="HelloTask"><a id="HelloTask" href="#" onmouseover="showTooltip(event, 'So erreichen Sie uns im Falle einer Anforderung oder bei sonstigen Anliegen: <br>Emmanuel Sonna: emmanuelfranck.silinnousonna@studmail.hwg-lu.de <br>Laurel Pangui: laurelcabrel.ngoumpa@studmail.hwg-lu.de <br>Loic Fodjo: <br>loic.fodjo@studmail.hwg-lu.de')" onmouseout="hideTooltip()">Kontakt</a></li>
		</ul>
    </nav>
    
    </header>
    <main>
         <nav>
        <ul>
            <li><a href="../jsp/LoginView.jsp">
                <img src="../img/employee icon.png" alt="Employee Portal" class="nav-image">
                Portal Entrance
            </a></li>

        </ul>
       
    </nav>
    </main>
    <div id="tooltip" class="tooltip"></div>
    <footer>
    <p>&copy; 2024 TASK. All rights reserved.</p>
</footer>

</form>
</body>
</html>