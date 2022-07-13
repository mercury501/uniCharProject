<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>Our Team</title>
    <!--link per font e iconcine-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!--fine link font e iconcine-->
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='styles/styleTeam.css'>
</head>
<body>


<%@ include file="navbar.jsp"%>

    <section>
        <div class="container">
            <div class="card">
                <div class="content">
                    <div class="imgBx">
                        <img src="images/teams/tommaso.jpg">
                    </div>
                    <div class="contentBox">
                        <h3>Tommaso De Solda<br><span>Web Developer</span></h3>
                    </div>
                </div>
            
            <ul class="sci">
                <!--  --i è la dichiarazione della variabile per le icone per poi fare un effetto in css -->
                <li style="--i:1"><a href="https://www.linkedin.com/in/tommaso-de-solda-52028a132/"><i class="fa-brands fa-linkedin-in"></i></a></li>
                <li style="--i:2"><a href="https://github.com/mercury501"><i class="fa-brands fa-github"></i></a></li>
                <li style="--i:3"><a href="https://www.instagram.com/tommylegend/"><i class="fa-brands fa-instagram"></i></a></li>

            </ul>
            </div>

            <div class="card">
                <div class="content">
                    <div class="imgBx">
                        <img src="images/teams/gerardo.jpg">
                    </div>
                    <div class="contentBox">
                        <h3>Gerardo Di Muro<br><span>Web Developer</span></h3>
                    </div>
                </div>
            
            <ul class="sci">
                <!--  --i è la dichiarazione della variabile per le icone per poi fare un effetto in css -->
                <li style="--i:1"><a href="https://www.linkedin.com/in/gerardo-di-muro-0971371b3/"><i class="fa-brands fa-linkedin-in"></i></a></li>
                <li style="--i:2"><a href="https://twitter.com/PugStyle69"><i class="fa-brands fa-twitter"></i></a></li>
                <li style="--i:3"><a href="https://www.instagram.com/pugstyle69/"><i class="fa-brands fa-instagram"></i></a></li>

            </ul>
            </div>

            <div class="card">
                <div class="content">
                    <div class="imgBx">
                        <img src="images/teams/luca.jpg">
                    </div>
                    <div class="contentBox">
                        <h3>Luca Pastore<br><span>Web Developer</span></h3>
                    </div>
                </div>
            
            <ul class="sci">
                <!--  --i è la dichiarazione della variabile per le icone per poi fare un effetto in css -->
                <li style="--i:1"><a href="https://www.linkedin.com/in/luca-pastore-25a680232/"><i class="fa-brands fa-linkedin-in"></i></a></li>
                <li style="--i:2"><a href="https://github.com/PastoreLuca"><i class="fa-brands fa-github"></i></a></li>
                <li style="--i:3"><a href="https://www.instagram.com/_aboutluca/"><i class="fa-brands fa-instagram"></i></a></li>

            </ul>
            </div>
        </div>
    </section>
  
</body>
</html>