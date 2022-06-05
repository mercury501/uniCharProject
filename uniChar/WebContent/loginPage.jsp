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
<link rel="stylesheet" href="styleLogin.css">
<title>Login form</title>
</head>
<body>

<%
String message = (String) request.getAttribute("result");
if(message == null) {
	message = "Input your credentials, please!";
}
%>



			<form method="post" action="connection?action=login" name="HandleLogin">
				<div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>United<span>Charity</span></div>
		</div>
		<br>

		<div class="login">
				<input type="text" placeholder="username" name="username"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="submit" value="Login">
		</div>
	
			</form>



<br>
<br>
<br>
<br>




</body>
</html>
