<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,tsw.uniChar.Beans.productBean"%>



<%
 
    productBean product = null;
 
    if(request.getAttribute("product")== null){
 
		product =  new productBean();
	}
	else{
		product = (productBean) request.getAttribute("product");
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
<title>Login form</title>
</head>
<body>

<%
String message = (String) request.getAttribute("result");
if(message == null) {
	message = "Input your credentials, please!";
}
%>



<div class="myFs">
<form method="post" action="connection" name="HandleLogin">

<fieldset>
     <legend>Federal Reserve Login</legend>
     <label id="lLogin" for="username">Login</label>
     <input id="username" type="text" name="username" placeholder="enter login"> 
     <br>   
     <label for="password">Password</label>
     <input id="password" type="password" name="password" placeholder="enter password"> 
     <br>
     <input type="submit" value="Login"/>
     <input type="reset" value="Reset"/>
</fieldset>
</form> 
</div>

<div id="message" class="message"><%= message %></div>

<br>
<br>
<br>
<br>


<%= request.getAttribute("products") %>








</body>
</html>
