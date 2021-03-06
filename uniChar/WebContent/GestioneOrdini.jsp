
<%


Collection<?> orders = (Collection<?>) request.getAttribute("orders");
if(orders == null) {
	response.sendRedirect("./HandleOrders?action=getOrders&returnto=GestioneOrdini.jsp");
	return;
}

DecimalFormat formatPrice = new DecimalFormat();
formatPrice.setMaximumFractionDigits(2);
formatPrice.setMinimumFractionDigits(2);


%>



<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.orderBean,java.text.DecimalFormat"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
         <link rel="stylesheet" href="styles/style-gestioneordini.css">
         
    <title>Gestione Ordini</title>
</head>
<body>
    <%@ include file="navbar.jsp" %>


	<div class="object-container">

	
		<table>
			<tr>
				<th>Fattura</th>
				<th>Numero</th>
				<th>Data</th>
				<th>Totale</th>
				
			</tr>
			
		<% 
	if (orders != null && orders.size() != 0) {
		Iterator<?> it = orders.iterator();
		while (it.hasNext()) {
			orderBean ordine = (orderBean) it.next();
	%>	
			<tr>
				<td>
				<a href="HandleInvoices?id=<%=ordine.getUserID()%>"><ion-icon name="document-attach-outline"></ion-icon></a>
				
				</td>
			<td><%=ordine.getOrderID()%></td>
		
			
			<td><%=ordine.getDate() %></td>
			<td><%=formatPrice.format(ordine.getTotale()) %></td>
			
			</tr>
	<%
		}
	}
	%>		
		
		</table>
</div>

    <%@ include file="footer.html" %>
</body>
</html>