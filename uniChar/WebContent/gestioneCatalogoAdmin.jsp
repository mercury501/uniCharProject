
<%

Collection<?> products = (Collection<?>) request.getAttribute("catalog");
if(products == null) {
	response.sendRedirect("./product?action=catalog&returnto=AreaAdmin.jsp");
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
    <link rel="stylesheet" href="gestioneUtentiAdmin-style.css">
    <title>Gestione Utenti</title>
</head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
   background-color: #dddddd;
}

.product-image{
	width: 300px;
	height:200px;
	border: 7px solid black;
	
	
}
</style>
<body>

    <div class="search-products">
        <input class="srch-products"type="search" name="search" placeholder="Cerca prodotti">
        <a href="#"><button class="btn-search">Search</button></a>
        <link rel="stylesheet" href="styles/styleGestUtenteAdmin.css">
        
    </div>


   
   <div class="header_fixed">
    <table>
        <tr>
            <th>Immagine</th>
            <th>Titolo</th>
            <th>Descrizione</th>
            <th>Prezzo</th>
            <th>Operazioni</th>
         
        </tr>

 <% 
	if (products != null && products.size() != 0) {
		Iterator<?> it = products.iterator();
		while (it.hasNext()) {
			productBean bean = (productBean) it.next();
%>
   
        <tr>
            <td><img class="product-image" src="images/products/<%= bean.getImageOne()%>" alt=" "  ></td>
            <td><%=bean.getTitolo()%></td>
            <td><%=bean.getDescrizione()%></td>
            <td><%=bean.getPrezzo()%></td>
            <td>
            	<a href="product?action=delete&id=<%=bean.getId()%>&returnto=gestioneCatalogoAdmin.jsp">Rimuovi</a>
            	<a href="">Modifica</a>
            </td>
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