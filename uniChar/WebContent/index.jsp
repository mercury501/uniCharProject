

<%
	Collection<?> products = (Collection<?>) request.getAttribute("catalog");
	if(products == null) {
		response.sendRedirect("./product?action=catalog&returnto=index.jsp");
		return;
	}
	
	
	Integer userID = (Integer)session.getAttribute("userid");
	String utente = (String)session.getAttribute("user");


%>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.productBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://unpkg.com/scrollreveal@4.0.0/dist/scrollreveal.min.js"></script>


    <title>United Charity</title>
    <link rel="stylesheet" href="styles/style.css">
</head>


<body>

    <div class="main">

     <%@ include file="navbar.html" %>

        <div class="content reveal">
            <h1> Game & <br><span>Charity</span> <br> Shop</h1>
            <p class="par">Acquista dal nostro shop i giochi più amati.<br>
                Gioca con i tuoi amici, gioca con noi. <br>
                Scoprirai che il gioco più bello è aiutare perchè <br>

                <span class="text-important">  UNITI SI FA LA DIFFERENZA </span>
            </p>


            <button class="cn"><a href="Catalog.jsp">SHOP NOW</a></button>


		<%
			if(userID == null){
		
		%>
		<div class="form reveal">
			<form method="post" action="connection?action=login" name="HandleUsers">

                <h2>Login</h2>
                <input type="text"  name="username"placeholder="Username">
                <input type="password" name ="password" placeholder="Password">
                <button type="submit" class="btnn">Login</button>
			</form>


                <p class="link">Non hai un account?<br>
        		<a href="registerUser.jsp">Registrati </a> qui

        		</p>


            </div>
        </div>



<%
} 
	
			
				%>
			
       </div>

			 

       <div class="card_container">
        <h1>Sconti in evidenza</h1>
        <hr>
            <%
	if (products != null && products.size() != 0) {
		Iterator<?> it = products.iterator();
		while (it.hasNext()) {
			productBean bean = (productBean) it.next();
%>




	<div class="card"><a href="product?action=product&id=<%=bean.getId()%>&returnto=productPage.jsp">

			 <img class="product-image" src="images/products/<%= bean.getImageOne().toLowerCase() %>" alt=" "  >
			  <div class="container">
			    <h4><b><%=bean.getTitolo()%></b></h4>
			    <p><%=bean.getDescrizione()%></p>
			    <div class="shop-zone">
			    <p class="price">Prezzo stimato:<br>&euro;<%=bean.getPrezzo()%></p>
			    <a href="cart?action=add&id=<%=bean.getId()%>&quantity=1" ><button class="btn_card"><img class="add-cart-button"src="images/navbar/shopping.png"></button></a>
			  </div>
			</div>
			</div>

	</a>


<%
		}
	} else {
%>

	<p>No products available</p>

<%
	}
	
%>






    </div>










	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
  
  <script type="text/javascript">
    ScrollReveal().reveal('.reveal', {distance: '50px', duration: 1500});

    </script>
    
    <%@ include file="footer.html" %>
</body>
</html>
