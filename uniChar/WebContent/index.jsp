
<%
	Collection<?> products = (Collection<?>) request.getAttribute("catalog");
	if(products == null) {		
		response.sendRedirect("./index");	
		return;
	}
	

%>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.productBean"%>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="style.css">
<!--Link per font e inconcine-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flickity/3.0.0/flickity.min.css" integrity="sha512-fJcFDOQo2+/Ke365m0NMCZt5uGYEWSxth3wg2i0dXu7A1jQfz9T4hdzz6nkzwmJdOdkcS8jmy2lWGaRXl+nFMQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/flickity/3.0.0/flickity.pkgd.min.js" integrity="sha512-achKCfKcYJg0u0J7UDJZbtrffUwtTLQMFSn28bDJ1Xl9DWkl/6VDT3LMfVTo09V51hmnjrrOTbtg4rEgg0QArA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>uniChar - Home</title>
</head>
<body>

		<header>
		  <a href="index.jsp"><img src="images/navbar/logo.png"alt="Logo"width="180"class="logo"></a>
		  <nav>
		    <ul class="menu">
		      <li><a href="#"> Giochi </a></li>
		      <li><a href="#"> Novità </a></li>
		      <li><a href="#"> Supporto </a></li>
		      <li><a href="#"> La nostra missione </a></li>
		    </ul>
		 </nav>
		 <div class="container_pulsanti">
		  <button onclick="location.href='loginPage.jsp'">Log In</button>
		  <button><img class="carrello" src="images/carrello.png"></button>
		 </div> 
		</header>
		
		
		
		
		
	<div class="main-carousel" data-flickity='{ "cellAlign": "center", "contain": true }'>
	
	  <div class="carousel-cell"><img src="images/products/1.jpg"></div>
	  <div class="carousel-cell"><img src="images/products/10.jpg"></div>
	  <div class="carousel-cell"><img src="images/products/9.jpg"></div>
	  
	</div>
		
<%
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


<tr>
			
	<div class="card">
		
			 <img src="images/products/<%= bean.getImageOne() %>" alt=" "  > 
			  <div class="container">
			    <h4><b><td><%=bean.getTitolo()%></td></b></h4>
			    <p><td><%=bean.getDescrizione()%></td></p>
			    <button>Aggiungi al Carrello</button>
			 <img class="product-image" src="images/products/<%= bean.getImageOne().toLowerCase() %>" alt=" "  > 
			  <div class="container">
			    <h4><b><%=bean.getTitolo()%></b></h4>
			    <p><%=bean.getDescrizione()%></p>
			    <div class="shop-zone">
			    <p class="price">Prezzo stimato:<br>&euro;<%=bean.getPrezzo()%></p>
			    <button class="btn_card"><img class="add-cart-button"src="images/navbar/cart-button.png"></button>
			  </div>
			
			</div>

			
</tr>

<%
		}
	} else {
%>
<tr>
	<td colspan="6">No products available</td>
</tr>
<%
	}
%>






	
		
	        <footer class="footer">
  <div class="footer__addr">
    <img src="images/navbar/logo.png"></h1>
        
    <h2>Contact</h2>
    
    <address>
      5534 Somewhere In. The World 22193-10212<br>
          
      <a class="footer__btn" href="mailto:example@gmail.com">Email Us</a>
    </address>
  </div>
  
  <ul class="footer__nav">
    <li class="nav__item">
      <h2 class="nav__title">Media</h2>

      <ul class="nav__ul">
        <li>
          <a href="#">Online</a>
        </li>

        <li>
          <a href="#">Print</a>
        </li>
            
        <li>
          <a href="#">Alternative Ads</a>
        </li>
      </ul>
    </li>
    
    <li class="nav__item nav__item--extra">
      <h2 class="nav__title">Technology</h2>
      
      <ul class="nav__ul nav__ul--extra">
        <li>
          <a href="#">Hardware Design</a>
        </li>
        
        <li>
          <a href="#">Software Design</a>
        </li>
        
        <li>
          <a href="#">Digital Signage</a>
        </li>
        
        <li>
          <a href="#">Automation</a>
        </li>
        
        <li>
          <a href="#">Artificial Intelligence</a>
        </li>
        
        <li>
          <a href="#">IoT</a>
        </li>
      </ul>
    </li>
    
    <li class="nav__item">
      <h2 class="nav__title">Legal</h2>
      
      <ul class="nav__ul">
        <li>
          <a href="#">Privacy Policy</a>
        </li>
        
        <li>
          <a href="#">Terms of Use</a>
        </li>
        
        <li>
          <a href="#">Sitemap</a>
        </li>
      </ul>
    </li>
  </ul>
  
  <div class="legal">
    <p>&copy; 2019 Something. All rights reserved.</p>
    
    <div class="legal__links">
      <span>Made with <span class="heart">♥</span>
    </div>
  </div>
</footer>


</body>
</html>