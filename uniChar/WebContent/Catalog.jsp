


<%
	Collection<?> products = (Collection<?>) request.getAttribute("catalog");
	if(products == null) {
		response.sendRedirect("./product?action=catalog&returnto=Catalog.jsp");
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
    <link rel="stylesheet" href="styles/style-catalog.css">
    <title>Prodotti</title>
</head>
<body>

		<%@ include file="navbar.jsp" %>
    
    <div class="card_container">
        <h1>I nostri prodotti</h1>
        <hr>
            <%
	if (products != null && products.size() != 0) {
		Iterator<?> it = products.iterator();
		while (it.hasNext()) {
			productBean bean = (productBean) it.next();
%>




	<div class="card">
	<a href="product?action=product&id=<%=bean.getId()%>&returnto=productPage.jsp">

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



    
</body>
</html>