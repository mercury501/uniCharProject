<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,tsw.uniChar.Beans.productBean"%>



<%
 
	String message = "";
    if(request.getAttribute("registerResult") == "success"){
 
		message = "Registration Successful!";
	}
	else if(request.getAttribute("registerResult") == "error"){
		message = "Registration Error.";
	}
 
%>



<!DOCTYPE html>
<html>
<head>
<style>
div.myFs{
	width: 25%;
}
#message{
	display: block;
    text-align: left;
    padding-top:50px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registrati</title>
</head>
<body>

<div class="myFs">
<form method="post" action="connection?action=register" name="HandleLogin">

<fieldset>
     <legend>Registrati</legend>
     <label id="lLogin" for="username">Utente</label>
     <input id="username" type="text" name="username" placeholder="Inserisci Nome Utente"> 
     <br>   
     <label for="password">Password</label>
     <input id="password" type="password" name="password" placeholder="Inserisci Password"> 
     <br>
     <label for="name">Nome</label>
     <input id="name" type="text" name="name" placeholder="Inserisci Nome"> 
     <br>
     <label for="surname">Cognome</label>
     <input id="surname" type="text" name="surname" placeholder="Inserisci Cognome"> 
     <br>
     
     <input type="submit" value="Registrati"/>
     <input type="reset" value="Reset"/>
</fieldset>
</form> 
</div>


<br>
<br>
<br>
<br>
<div id="message" class="message"><%= message %></div>



</body>
</html>
