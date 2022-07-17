<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style-cart.css">
	<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.cartBean" %>
		<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.productBean" %>
			<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.orderBean" %>
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
					<% cartBean carrello=(cartBean) session.getAttribute("cart"); if (carrello !=null) { for
						(Map.Entry<Integer, productBean> set : carrello.getProducts().entrySet()) {
						%>
						<div>
								<td>

									<div class="cart-info">
										<img class="image" src="images/products/<%=set.getValue().getImageOne()%>">
										<div>
											<p>
												<%=set.getValue().getTitolo()%>
											</p>
											<small>
												<%=set.getValue().getPrezzo()%>&euro;
											</small> <a
												href="cart?action=remove&id=<%=set.getValue().getId()%>">Rimovi</a>
										</div>
									</div>
								</td>

								<td>
								<form action="cart?action=modify&returnto=cart.jsp">
								<input type="hidden" name="id" value="<%=set.getValue().getId()%>">
								
								<select name="quantity" id="quantity" onchange="this.form.submit()">

										<% for (int i=1; i <=10; i++) { if (carrello.getQuantity(set.getKey())==i) { %>

											<option value="<%=i%>" selected>
												<%=i%>
											</option>

											<% } else { %>
												<option value="<%=i%>">
													<%=i%>
												</option>

												<% } } %>

									</select>
									</form>
									</td>
							
							<td>
								<%=set.getValue().getPrezzo() * carrello.getQuantities().get(set.getKey())%>
									&euro;
							</td>
							</tr>
							<% } } %>



				</table>
			</div>
	
	<a href="payment.jsp"><button class="btn-pay">Vai al pagamento</button></a>

	</div>



	<%@ include file="footer.html" %>


</body>

</html>