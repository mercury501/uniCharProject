
<%
	Collection<?> products = (Collection<?>) request.getAttribute("catalog");
	if(products == null) {		
		response.sendRedirect("./index");	
		return;
	}
	
	productBean bean = new productBean();
	

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

		
			
            <!--Dettaglio prodotto-->
      <main>
        <div class="main-wrapper">
          <div class="container">
            <div class="product-div">
              <div class="product-div-left">
                <div class="img-container">
                  <img src="images/products/<%= bean.getImageOne() %>" alt="Mgsolid">
                </div>

                <div class="hover-container">
                  <div>
                    <img src="images/products/<%= bean.getImageOne() %>">
                  </div>

                  <div>
                    <img src="images/products/<%= bean.getImageTwo() %>">
                  </div>

                  <div>
                    <img src="images/products/<%= bean.getImageThree() %>">
                  </div>


                </div>
              </div>

              <div class="product-div-right">
                  <span class="product-name"><%=bean.getTitolo()%></span>
                  <span class="product-price"><%=bean.getPrezzo()%></span>
                  <p class="product-description"><%=bean.getDescrizione()%></p>
                  <div class="btn-groups">
                    <button type="button" class="add-cart-btn">
                    <i class="fas fa-shopping-cart"> Aggiungi al carrello</i>
                    </button>
                  </div>
                </div>

            </div>
          </div>
        </div>

        
			</main>

			<!--Fine Dettaglio prodotto-->
			
			
		<jsp:include page="footer.html" />
	       
<script src="script.js"></script>
</body>
</html>

