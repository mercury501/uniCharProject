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


<%@ include file="navbar.html" %>
	
	<h1 class="TestoTabella">Modifica Account</h1>
	
	
	
	<table class="tabellaOpzioni">

    <tr>
        <th class="testoTabella">
            NOME
        </th>
    </tr>
    
    <tr>
        <th class="testoTabella testoValoriAccount">
            <%= utente.getName() %>
        </th>
        
   
    <th>
    <button class="modificaElemento" id="modificaNome">
                    <div>
                        <ion-icon class="iconaModificaPulsante" name="create-outline" size="large"></ion-icon>
                    </div>
                    
                    <div class="testoModificaElemento">
                        MODIFICA
                    </div>  
                </button>
    
    </th>
    </tr>

    <tr>
        <th class="testoTabella">
            COGNOME
        </th>
    </tr>

    <tr>
        <th class="testoTabella testoValoriAccount">
            <%= utente.getSurname() %>
        </th>
        
        <th>
    <button class="modificaElemento" id="modificaNome">
                    <div>
                        <ion-icon class="iconaModificaPulsante" name="create-outline" size="large"></ion-icon>
                    </div>
                    
                    <div class="testoModificaElemento">
                        MODIFICA
                    </div>  
                </button>
    
    </th>
        
    </tr>
    <tr>
        <th class="testoTabella">
            MAIL
        </th>
    </tr>

    <tr>
        <th class="testoTabella testoValoriAccount" style="font-size: 15pt">
            <%= utente.getEmail() %>
        </th>
      
       <th>
    <button class="modificaElemento" id="modificaNome">
                    <div>
                        <ion-icon class="iconaModificaPulsante" name="create-outline" size="large"></ion-icon>
                    </div>
                    
                    <div class="testoModificaElemento">
                        MODIFICA
                    </div>  
                </button>
    
    </th>
      
     </tr>

    <tr>
        <th class="testoTabella">
            PASSWORD
        </th>
    </tr>

    <tr>
        <th class="testoTabella testoValoriAccount">
            ********
        </th>
        
         <th>
    <button class="modificaElemento" id="modificaNome">
                    <div>
                        <ion-icon class="iconaModificaPulsante" name="create-outline" size="large"></ion-icon>
                    </div>
                    
                    <div class="testoModificaElemento">
                        MODIFICA
                    </div>  
                </button>
    
    </th>
        
    </tr>


</table>


		
	
	<div class="content"></div>
	<div class="content"></div>
	
	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    
    
    
    