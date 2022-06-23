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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" href="style-registration.css">
    
</head>




<body>
    <div class="container">
         <div class="title">Registration</div>
         <form method="post" action="connection?action=register" name="HandleLogin">
             <div class="user-details">
                 <div class="input-box">
                     <span class="details">Nome Completo</span>
                     <input type="text" id="nome-completo" placeholder="Nome Completo" required>
                 </div>
                 <div class="input-box">
                    <span class="details">Username</span>
                    <input type="text" id="username" placeholder="Username" required>
                </div>
                <div class="input-box">
                    <span class="details">Email</span>
                    <input type="text" id="email" placeholder="Email" required>
                </div>
                <div class="input-box">
                    <span class="details">Numero di Telefono</span>
                    <input type="text" id="numero-telefono"placeholder="Numero di telefono" required>
                </div>
                <div class="input-box">
                    <span class="details">Password</span>
                    <input type="password" id="password" placeholder="Password" required>
                </div>
                <div class="input-box">
                    <span class="details">Conferma Password</span>
                    <input type="password" id="confirm-password"placeholder="Conferma password" required>
                </div>

             </div>

             <div class="gender-details">
                 <input type="radio" name="gender" id="dot-1">
                 <input type="radio" name="gender" id="dot-2">
                 <input type="radio" name="gender" id="dot-3">

                 <span class="gender-title">Gender</span>
                 <div class="category">
                     <label for="dot-1">
                         <span class="dot one"></span>
                         <span class="gender">Male</span>
                     </label>
                     <label for="dot-2">
                        <span class="dot two"></span>
                        <span class="gender">Female</span>
                    </label>
                    <label for="dot-3">
                        <span class="dot three"></span>
                        <span class="gender">Prefer not to say</span>
                    </label>
                 </div>
             </div>
             <div class="button">
                 <input type="submit" value="Register">
             </div>
         </form>
    </div>
</body>
</html>
