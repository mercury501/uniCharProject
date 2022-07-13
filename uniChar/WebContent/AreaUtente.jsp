<%
String nome = (String) session.getAttribute("name");

if(nome == null){
	response.sendRedirect("index.jsp");
	return;
}


String message = "Benvenuto/a "+nome;
%>



<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.userBean"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/areaUtente-style.css">
    <title>Area Utente</title>
</head>
<body>

    <%@ include file="navbar.jsp" %>
    <div class="page">
        <h2 class="welcome"><%= message%></h2>
        <h3 class="operations">Scegli le operazioni che vuoi effettuare</h3>


        <div class="cards">
        
            <a href="UserInvoiceControl">
                <div class="card">
                    <ion-icon class="iconFunction" name="document-text-outline" size="large"></ion-icon><p>Ordini</p>
                </div>
            </a>
            
            <a href="AccountControl">
                <div class="card">
                    <ion-icon class="iconFunction" name="cog-outline" size="large"></ion-icon><p>Impostazioni Account</p>
                </div>
            </a>
            
            <a href="connection?action=logout">
                <div class="cardLogout">
                    <ion-icon class="iconFunction" name="log-out-outline" size="large"></ion-icon><p>Esci</p>
                </div>
            </a>
        
        
        </div>
        
        <div class="content"></div>
        <div class="content"></div>
        <div class="content"></div>
    
        
        
    </div>
        
        
    
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <%@ include file="footer.html" %>
    </body>
    
    </html>