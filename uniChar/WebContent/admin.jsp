 
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,tsw.uniChar.Beans.productBean"%>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/style-dashboard.css">
    <title>Admin Dashboard</title>
 
 
</head>
<body>
 
<!-- TODO check if is admin, if not redirect loginpage -->
<%
 
String user = null;
if(session.getAttribute("user") == null)
{
	response.sendRedirect("loginPage.jsp");
}
else{
	user = (String) session.getAttribute("user");
}
 
 
 
 
%>

 <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon"><ion-icon name="laptop-outline"></ion-icon></span>
                        <span class="title">United Charity</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <span class="icon"><ion-icon name="home-outline"></ion-icon></span>
                        <span class="title">Dashboard</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
                        <span class="title">Utenti</span>
                    </a>
                </li>

                <li>
                    <a href="#" onClick="logOut()">
                        <span class="icon"><ion-icon name="log-out-outline"></ion-icon></span>
                        <span class="title">Sign out</span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- main -->

        <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>
        
            <div class="search">
                <label>
                    <input type="text" placeholder="Search Here">
                    <ion-icon name="search-outline"></ion-icon>
                </label>
                
            </div>

            <!-- user Image -->
            <div class="user">
                <img src="images/users/user.jpg">
            </div>
        </div>

        <!-- order details list -->
        <div class="details">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2> Ordini Recenti</h2>
                    <a href="#" class="btn"> Vedi tutto</a>

                </div>

                <table>
                   <thead>
                       <tr>
                           <td>ID</td>
                           <td>Nome</td>
                           <td>Prezzo</td>
                           <td>Quantità</td>
                           <td>Data </td>
                           <td>Stato</td>
                           

                       </tr>

                   </thead>

                   <tbody>
                        <tr>
                            <td>1</td>
                            <td>Succhiamelo</td>
                            <td>50 &euro;</td>
                            <td>5</td>
                            <td>10 Agosto </td>
                            <td><span class="status delivered">Pagato</span></td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td>Succhiacelo</td>
                            <td>100 &euro;</td>
                            <td>90</td>
                             <td>10 Agosto </td>
                            <td><span class="status delivered">Pagato</span></td>
                        </tr>

                   </tbody>

                </table>
            </div>

            <!-- Clienti-->

            <div class="recentCustomers">
                <div class="cardHeader">
                    <h2>Clienti Recenti</h2>
                </div>  

                <table>
                    <tr>
                        <td width="60px">

                            <div class="imgB">
                               <img src="images/users/gerardo.jpeg" alt="">
                            </div>
                        </td>

                        <td>
                            <h4>Gerardo <br><span>Italia</span></h4>
                        </td>
                    </tr>
                    
                <tr>
                     <td width="60px">
                        <div class="imgB">
                            <img src="images/users/luca.jpeg" alt="">
                         </div>

                    </td>

                         <td>
                            <h4>Luca <br><span>Italia</span></h4>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        </div>


    </div>






<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>




<script>

    //Menu Toggle
    let toggle = document.querySelector('.toggle');
    let navigation = document.querySelector('.navigation');
    let main = document.querySelector('.main');


    toggle.onclick = function(){
        navigation.classList.toggle('active');
        main.classList.toggle('active');
    }

    //Fine Menu Toggle

    function logOut(){
       let result = window.confirm("Vuoi effettuare il logout?");
        
       if(result)
        location.href='index.jsp';
    }


    let list = document.querySelectorAll('.navigation li');
    
    function activeLink(){
        list.forEach((item)=>
        item.classList.remove('hovered'));
        this.classList.add('hovered')
    }

    list.forEach((item)=>
        item.addEventListener('mousehover', activeLink)
    );
    
</script>



</body>
</html>

 