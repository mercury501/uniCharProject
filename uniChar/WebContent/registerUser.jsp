<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,tsw.uniChar.Beans.productBean"%>



<%
 
	String message = "";
    if(request.getAttribute("registerResult") == "success"){
 
		message = "Registration Successful!";
		System.out.println(message);
	}
	else if(request.getAttribute("registerResult") == "error"){
		message = "Registration Error.";
		System.out.println(message);
	}
 
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" href="styles/style-registration.css">
    
</head>




<body>
    <div class="container">
         <div class="title">Registration</div>
         <form method="post" action="connection?action=register" name="HandleUsers">
             <div class="user-details">
                 <div class="input-box">
                     <span class="details">Nome</span>
                     <input type="text" name="name" placeholder="Nome" required>
                 </div>
                 <div class="input-box">
                    <span class="details">Cognome</span>
                    <input type="text" name="surname" id="surname" placeholder="Cognome" required>
                </div>
                <div class="input-box">
                    <span class="details">Username</span>
                    <input type="text" name="username" id="username" placeholder="Username" required>
                </div>
                <div class="input-box">
                    <span class="details">Email</span>
                    <input type="text" name="email" id="email"placeholder="Email" required>
                </div>
                <div class="input-box">
                    <span class="details">Password</span>
                    <input type="password" name="password" id="password" placeholder="Password" required>
                </div>
                <div class="input-box">
                    <span class="details">Conferma Password</span>
                    <input type="password" name="confirm-password" id="confirm-password"placeholder="Conferma password" required>
                </div>

             </div>

             
             <div class="button">
                 <input type="submit" value="Register">
             </div>
         </form>
    </div>
</body>
</html>
