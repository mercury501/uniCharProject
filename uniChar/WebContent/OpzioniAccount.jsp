
    <%
    
	userBean utente = (userBean) request.getAttribute("user");
	
	if(utente == null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>




<!DOCTYPE html>
<html>
<head>
<link href="CSS/OpzioniAccount.css" rel="stylesheet" type="text/css">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.userBean"%>
<link rel="stylesheet" href="styles/OpzioniAccount-style.css">
<meta charset="UTF-8">
<title>Opzioni Account</title>
</head>
<body>


<%@ include file="navbar.jsp" %>
	
	<h1 class="TestoTabella">Modifica Account</h1>
	
	<form action="connection?action=update&userid=<%=utente.getId()%>&returnto=OpzioniAccount.jsp" method="POST">
	
	<table class="tabellaOpzioni">

    <tr>
        <th class="testoTabella">
            NOME
        </th>
    </tr>
    
    <tr>
        <th class="testoTabella testoValoriAccount">
            <input type="text" name="name" value="<%= utente.getName() %>" required>
        </th>
        
    </tr>

    <tr>
        <th class="testoTabella">
            COGNOME
        </th>
    </tr>

    <tr>
        <th class="testoTabella testoValoriAccount">
            <input type="text" name="surname" value="<%= utente.getSurname() %>" required>
            
        </th>
       
        
    </tr>
    <tr>
        <th class="testoTabella">
            USERNAME
        </th>
    </tr>

    <tr>
        <th class="testoTabella testoValoriAccount">
            
            <input type="text" name="username" value="<%= utente.getUser() %>">
            
        </th>
        

        
    </tr>
    <tr>
        <th class="testoTabella">
            MAIL
        </th>
    </tr>

    <tr>
        <th class="testoTabella testoValoriAccount" style="font-size: 15pt">
            <input type="text" name="email" value="<%= utente.getEmail() %>" required>
            
        </th>
 
      
     </tr>

    <tr>
        <th class="testoTabella">
            PASSWORD
        </th>
    </tr>

    <tr>
        <th class="testoTabella testoValoriAccount">
            
            <input type="password" name="password" value="<%=utente.getPassword() %>">
            
        </th>
        

        
    </tr>
	
	<tr>
		<th class="testoTabella testoValoriAccount"><div class="button">
                 <input type="submit" value="Inserisci">
       </div></th>
       
     </tr>

</table>


</form>



		
	
	<div class="content"></div>
	<div class="content"></div>
	
	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
     <script src="JavaScript/jquery-3.6.0.min.js" type="text/javascript"></script>	
    
  
    