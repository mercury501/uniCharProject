
<%
String role = (String)request.getSession().getAttribute("role");

if (role == null || !role.equalsIgnoreCase("admin"))
	response.sendRedirect("index.jsp");


Collection<?> products = (Collection<?>) request.getAttribute("catalog");
if(products == null) {
	response.sendRedirect("./product?action=catalog&returnto=gestioneCatalogoAdmin.jsp");
	return;
}

productBean product = (productBean) request.getAttribute("product");

if (product == null)
	product = new productBean();

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
 <%@ include file="navbar.jsp" %>
	<div class="insertProducts">
		<form action="product?action=insert&returnto=gestioneCatalogoAdmin.jsp" method="POST" name="HandleProducts">
		<label>PRODOTTO</label>
		<input type="hidden" name="prodid" value="<%= product.getId() %>">
		<input type="text" name="title" placeholder="Inserisci titolo" required maxlength="30" value="<%= product.getTitolo() %>">
		<input type="text" name="desc" placeholder="Inserisci descrizione" required maxlength="255" value="<%= product.getDescrizione() %>">
		<input type="text" name="developer" placeholder="Inserisci developer" required maxlength="30" value="<%= product.getSviluppatore() %>">
		<input type="number" name="price" placeholder="Inserisci prezzo" required value="<%= product.getPrezzo() %>">
		<input type="number" name="stock" placeholder="Inserisci quantità" required value="<%= product.getStock() %>">
		<input type="text" name="imageone" placeholder="Inserisci nome immagine" required value="<%= product.getImageOne() %>">
 		<input id="ajaxfile" name="image" type="file"/> <br/>
 
		<button type="submit" onclick="uploadFile(); this.form.submit()" class="btnn">Salva prodotto</button>
		<button type="reset" class="btnn">Reset</button>
		<div id="errorMess" class="errors"><i> <ion-icon name="warning-outline"></ion-icon> </i></div>		
		</form>
	</div>
	 <p id="errorMessageMess">Prodotto con lo stesso titolo gia' esistente.</p>
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
				<a href="product?action=getproduct&id=<%=bean.getId()%>&returnto=gestioneCatalogoAdmin.jsp">Modifica</a>
            </td>
        </tr>
    
<%
	}
		}
%>

	</table>
 </div>
<%@ include file="footer.html" %>


  <!-- Ajax to Java File Upload Logic -->
  <script>
  async function uploadFile() {
    let formData = new FormData(); 

    if (ajaxfile.files[0] == null)
    	return;
    
    formData.append("file", ajaxfile.files[0]);
    const response = await fetch('uploadFile', {
      method: "POST", 
      body: formData
      
    }); 
    
    const message = await response.text();
   	alert(message);
   	console.log(message);
    
  }
  
  </script>
</body>
</html>