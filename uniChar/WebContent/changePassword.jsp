<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,tsw.uniChar.Beans.productBean"%>



<%
 
	String message = "";
    if(request.getAttribute("result") == "success"){
 
		message = "Cambio password riuscito!";
	}
	else if(request.getAttribute("result") == "error"){
		message = "Errore cambio password.";
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
<title>Cambio Password</title>
</head>
<body>

<div class="myFs">
<form method="post" action="connection?action=changePass" name="HandleLogin">

<fieldset>
     <legend>Cambio Password</legend>
     <label id="lLogin" for="oldpass">Vecchia Password</label>
     <input id="oldpass" type="password" name="oldpass" placeholder="Inserisci Vecchia Password"> 
     <br>   
     <label for="newpass">Nuova Password</label>
     <input id="newpass" type="password" name="newpass" placeholder="Inserisci Nuova Password"> 
     <br>
     
     <input type="submit" value="Cambia Password"/>
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
