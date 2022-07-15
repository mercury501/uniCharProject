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
    <link rel="stylesheet" href="styles/style-cart.css">
    <title>Carrello</title>

</head>
<body>
  <div class="main">
	 <%@ include file="navbar.jsp" %>

    <div class="small-container cart-page">

        <table>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Subtotal</th>
            </tr>
            <%
            cartBean carrello = (cartBean) session.getAttribute("cart");
            
            if(carrello!= null){
          for (Map.Entry<Integer, productBean> set : carrello.getProducts().entrySet()) {
              
              %>
                      
	
            <td>
            <form action="cart?action=modify&returnto=cart.jsp">
                <div class="cart-info">
                    <img class="image"src="images/products/<%=set.getValue().getImageOne()%>">
                    <div>
                        <p><%=set.getValue().getTitolo()%></p>
                        <small><%=set.getValue().getPrezzo()%>&euro;</small>
                          <a href="cart?action=remove&id=<%=set.getValue().getId()%>">Rimovi</a>
                    </div>
                </div>
            </td>
            
                <td><select name="quantity" id="quantity" onchange="submit()">
                        
                    <%
                        for(int i=1; i<=10; i++){
                             
                            
                        if(carrello.getQuantity(set.getKey()) == i){
                            
                        
                    %>
                    
                    <option value="quantity" selected ><%= i %></option>
                       
                        <%
                        } 
                        else{
                            
                        
                        %>	
                        <option value="quantity"><%= i %></option>
                        
                        <% 
                        }
                    }
          
                        
                    %>  

                    </select>
              </td>
                <td><%=set.getValue().getPrezzo() * carrello.getQuantities().get(set.getKey())%> &euro;</td>
            </tr>
            <%
}
            }
       
            	
            
%>
		


        </table>
</form>
           
    </div>
    
   <a href="payment.jsp"><button>Vai al pagamento</button></a>
    

    </div>
  
 
    
</body>
</html>