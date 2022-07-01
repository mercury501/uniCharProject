<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style-cart.css">
    <%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.cartBean"%>
    <%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.productBean"%>
    <%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.orderBean"%>
    <link rel="stylesheet" href="style-cart.css">
    <title>Carrello</title>
</head>
<body>




    <div class="container">

        <div class="title">

            <h2>Carrello</h2>
        </div>

        <div class="cart-items">

        <table>
           
            <thead> 
                <tr>
                	<td></td>
                    <td>Nome</td>
                    <td>Prezzo</td>
                    <td>Quantità</td>           
                </tr>
            </thead>
<%
  cartBean carrello = (cartBean) session.getAttribute("cart");
for (Map.Entry<Integer, productBean> set : carrello.getProducts().entrySet()) {
	
	%>

            <tbody>
                <tr>
                    <td><img class="image"src="images/products/<%=set.getValue().getImageOne()%>"></td>
                    <td><%=set.getValue().getTitolo()%></td>
                    <td><%=set.getValue().getPrezzo()%>&euro;</td>
                    <td>
                        <select name="quantità" id="quantità">
                        
                        <%
                        	for(int i=1; i<=10; i++){
                        		 
                        		
                        	if(carrello.getQuantity(set.getKey()) == i){
                        		
                        	
                        %>
                        
                        <option value="Quantity" selected ><%= i %></option>
                           
                            <%
                            } 
                        	else{
                        		
                        	
                        	%>	
                        	<option value="Quantity"><%= i %></option>
                        	
                        	<% 
                        	}
                        }
                            
                        %>  

                        </select>
                  
                </td>
                    <td><button class="btn"> Elimina </button></td>
                </tr>
<%
}
%>

        </table>

    </div>  




    </div>
    




</body>
</html>