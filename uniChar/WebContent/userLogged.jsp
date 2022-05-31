<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#message{
	display: block;
    text-align: left;
    padding-top:50px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user Logged</title>
</head>
<body>


<%
String isLogged = (String) request.getAttribute("username");
if (isLogged == null)
    response.sendRedirect("loginPage.jsp");

String message = (String) request.getAttribute("result");
if(message == null) {
	message = "";
}


%>


<div id="message" class="message">Salve, <%= message %></div>


</body>
</html>
