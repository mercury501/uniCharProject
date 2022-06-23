

<%
	Collection<?> products = (Collection<?>) request.getAttribute("catalog");
	if(products == null) {		
		response.sendRedirect("./index");	
		return;
	}
	

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
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="entry">
  <div class="entry_u">UNITED</div>
    <div class="entry_c">CHARITY</div>
    </div>
    <div class="main">
        
     <%@ include file="navbar.html" %>   

        <div class="content reveal">
            <h1> Game & <br><span>Charity</span> <br> Shop</h1>
            <p class="par">Acquista dal nostro shop i giochi più amati.<br>
                Gioca con i tuoi amici, gioca con noi. <br> 
                Scoprirai che il gioco più bello è aiutare perchè <br>

                <span class="text-important">  UNITI SI FA LA DIFFERENZA </span>
            </p>
            

            <button class="cn"><a href="#">SHOP NOW</a></button>



		<div class="form reveal">
			<form method="post" action="connection?action=login" name="HandleUsers">
           		 
                <h2>Login Here</h2>
                <input type="text"  name="username"placeholder="Enter Username Here"> 
                <input type="password" name ="password" placeholder="Enter Password Here"> 
                <button type="submit" class="btnn">Login</button>
			</form>
			
			
                <p class="link">Don't have an account<br>
        		<a href="registerUser.jsp">Sign up  </a> here 
        		
        		</p>
           
       
            </div>
        </div>
        
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

	

			
	<div class="card">
		
			 <img class="product-image" src="images/products/<%= bean.getImageOne().toLowerCase() %>" alt=" "  > 
			  <div class="container">
			    <h4><b><%=bean.getTitolo()%></b></h4>
			    <p><%=bean.getDescrizione()%></p>
			    <div class="shop-zone">
			    <p class="price">Prezzo stimato:<br>&euro;<%=bean.getPrezzo()%></p>
			    <button class="btn_card"><img class="add-cart-button"src="images/navbar/cart-button.png"></button>
			  </div>
			</div>
			</div>

			


<%
		}
	} else {
%>

	<td colspan="6">No products available</td>
</tr>
<%
	}
%>
        
        
        
        
        
        
    </div>
        
        
        
        
        
    


    

    
    <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
    <script>
    
    ScrollReveal().reveal('.reveal', {distance: '50px', duration: 1500});

    </script>
</body>
</html>




	
	