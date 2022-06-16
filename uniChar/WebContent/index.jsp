

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
        <div class="navbar">
            <div class="icon">
                <h2 class="logo">UC</h2>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="#">HOME</a></li>
                    <li><a href="#">ABOUT</a></li>
                    <li><a href="#">PRODUCTS</a></li>
                    <li><a href="#">CONTACT</a></li>
                </ul>
            </div>

            <div class="search">
                <input class="srch"type="search" name="">
                <a href="#"><button class="btn">Search</button></a>
            </div>

            <div class="shop">
                <a href="#"><img class="shop_icon" src="images/navbar/shop.png" alt=""></a>
            </div>


        </div>

        <div class="content reveal">
            <h1> Game & <br><span>Charity</span> <br> Shop</h1>
            <p class="par">Acquista dal nostro shop i giochi più amati.<br>
                Gioca con i tuoi amici, gioca con noi. <br> 
                Scoprirai che il gioco più bello è aiutare perchè <br>

                <span class="text-important">  UNITI SI FA LA DIFFERENZA </span>
            </p>
            

            <button class="cn"><a href="#">SHOP NOW</a></button>


            <div class="form reveal">
                <h2>Login Here</h2>
                <input type="email" name="email" placeholder="Enter Email Here"> 
                <input type="password" name="" placeholder="Enter Password Here"> 
                <button class="btnn"><a href="#">Login</a></button>

                <p class="link">Don't have an account<br>
                <a href="#">Sign up  </a> here </a></p>
           
       
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
		
			 <img class="product-image" src="images/products/<%= bean.getImageOne() %>" alt=" "  > 
			  <div class="container">
			    <h4><b><%=bean.getTitolo()%></td></b></h4>
			    <p><%=bean.getDescrizione()%></td></p>
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




	
	