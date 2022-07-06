<!DOCTYPE html>
<html>
<head>
	<title>Contact us</title>
	<link rel="stylesheet" type="text/css" href="styles/style-contatti.css">
	<link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
</head>
<body>
   <%@ include file="navbar.html" %>
	<div class="container">
		<div class="contact-box">
			<div class="left">
			
				<h2>Per noi ogni tipo di segnalazione è importante </h2>
				<p> Risponderemo in meno di 24h <p>
			</div>
			
			<form action="./email" name="HandleEmail" method="post">
			<div class="right">
				<h2>Contattaci</h2>
				<input type="text" class="field" name="username" placeholder="Nome" required>
				<input type="text" class="field" name="useremail"placeholder="Email" required>
				<input type="text" class="field" placeholder="Numero di telefono" required>
				<textarea placeholder="Messaggio" class="field" required></textarea>
				<button class="btn">Invia richiesta</button>
			</div>
		</form>
		</div>
	</div>



</body>
</html>