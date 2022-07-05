<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/style-contatti.css">
    <title>Contattaci</title>
</head>
<body>

    <form name="formmail" method="post" action="#" onsubmit="controlloForm()">

        <input type="hidden" name="successo" value="http://www.miosito.com/pagina-successo.html">
      
        <label for="nome">Nome e Cognome</label>
        <input type="text" id="nome" name="nome" placeholder="Inserisci Nome e Cognome">
      
        <label for="email">Email</label>
        <input type="text" id="email" name="email" placeholder="Indirizzo di posta elettronica">
      
        <label for="tel">Telefono</label>
        <input type="text" id="tel" name="tel" placeholder="Numero di telefono">
      
        <label for="msg">Messaggio</label>
        <textarea id="msg" name="msg" placeholder="Scrivi il tuo messaggio"></textarea>
      
        <input type="submit" value="Invia Richiesta">
      
      </form>



      <script>
        function verificaEmail(email) {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
            }

            function controlloForm() {
            var nome = document.forms["formmail"]["nome"].value;
            var email = document.forms["formmail"]["email"].value;
            var tel = document.forms["formmail"]["tel"].value;
            var msg = document.forms["formmail"]["msg"].value;

            if (nome == "" || email == "" || msg == "") {
                alert("I campi Nome, Email e Messaggio sono obbligatori!");
                return false;
            }
            else if (verificaEmail(email) !== true) {
                alert("L'indirizzo email non sembra corretto!");
                return false;  
            }else{
                return true;
            }
            }
      </script>
    
</body>
</html>