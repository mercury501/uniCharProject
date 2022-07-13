
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
    <link rel="stylesheet" href="styles/styleGestCatalogoAdmin.css">
    <title>Gestione Utenti</title>
</head>
<body>

	<div class="insertProducts">
		<form action="product?action=insert&returnto=gestioneCatalogoAdmin.jsp" method="POST" name="HandleProducts">
		<label>INSERISCI UN NUOVO PRODOTTO</label>
		<input type="text" name="title" placeholder="Inserisci titolo" required>
		<input type="text" name="desc" placeholder="Inserisci descrizione" required>
		<input type="text" name="developer" placeholder="Inserisci developer" required>
		<input type="number" name="price" placeholder="Inserisci prezzo" required>
		<button type="submit" class="btnn">Inserisci prodotto</button>
		
		</form>
	</div>
	
	
    <div class="search-products">
        <input class="srch-products"type="search" name="search" placeholder="Cerca prodotti">
        <a href="#"><button class="btn-search">Search</button></a>
        
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