
<%


Collection<?> orders = (Collection<?>) request.getAttribute("getOrders");
if(orders == null) {
	response.sendRedirect("./connection?action=users&returnto=AreaAdmin.jsp");
	return;
}



%>



<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.orderBean"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
    <title>Gestione Ordine</title>
</head>
<body>


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
				<a href="/HandleInvoices?id=" + <%=ordine.getUserID() %>"></a><ion-icon name="document-attach-outline"></ion-icon></a>
				
				</td>
			</tr>
			
			<tr>
				<td><%=ordine.getOrderID()%></td>
			</tr>
			
			<tr><%=ordine.getDate() %></tr>
			<tr><%=ordine.getTotale() %></tr>
	<%
		}
	}
	%>		
		
		</table>






    
</body>
</html>