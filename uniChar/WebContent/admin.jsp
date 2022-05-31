 
<%
 
    productBean product = null;
 
    if(request.getAttribute("product")== null){
 
		product =  new productBean();
	}
	else{
		product = (productBean) request.getAttribute("product");
	}
 
%>
 
 
 
 
 
<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,tsw.uniChar.Beans.productBean"%>
<head>
<style>
 
 
 
 
#message{
	display: block;
    text-align: left;
    padding-top:50px;
}
 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin page</title>
</head>
<body>
 
<!-- TODO check if is admin, if not redirect loginpage -->
<%
 
String user = null;
if(session.getAttribute("user") == null)
{
	response.sendRedirect("loginPage.jsp");
}
else{
	user = (String) session.getAttribute("user");
}
 
 
 
 
%>
 
<!-- TODO handle return requests -->
 
 <h3>Salve ${user}</h3>
<br>
 
<div>
	<form method="post" action="product?action=search" name="SearchProduct">
	  <fieldset>
        <legend>Search by ID</legend>
		<input type="text" id="SearchID" name="SearchID"  placeholder="Search...">
		<input type="submit" value="Search"/>
		<br>	
	  </fieldset>
 
	 </form>
 
</div>
 
 
<div class="myInsert">
    <form method="post" action="product?action=insert" name="InsertProduct">
 
    <fieldset>
         <legend>Insert New Product</legend>
         <label id="lId" for="id">ID</label>
         <input id="id" type="text" name="id" placeholder="inserisci ID" readonly="readonly" value="<%=product.getId()%>" > 
         <br>
         <label id="lTitle" for="title">Titolo</label>
         <input id="title" type="text" name="title" placeholder="inserisci titolo" value="<%=product.getTitolo()%>" > 
         <br>   
         <label id="lDeveloper" for="developer">Sviluppatore</label>
         <input id="developer" type="text" name="developer" placeholder="inserisci sviluppatore"value="<%=product.getSviluppatore()%>"> 
         <br>
         <label id="lDescription" for="desc">Descrizione</label>
         <input id="desc" type="text" name="desc" placeholder="inserisci descrizione"value="<%=product.getDescrizione()%>"> 
         <br>
         <label id="lPrice" for="price">Prezzo</label>
         <input id="price" type="text" name="price" placeholder="inserisci prezzo"value="<%=product.getPrezzo()%>"> 
         <br>
         <label id="lImgPathOne" for="imgpathone">Percorso Immagine Uno</label>
         <input id="imgpathone" type="text" name="imgpathone" placeholder="inserisci percorso"value="<%=product.getImageOne()%>"> 
         <br>
         <label id="lImgPathTwo" for="imgpathtwo">Percorso Immagine Due</label>
         <input id="imgpathtwo" type="text" name="imgpathtwo" placeholder="inserisci percorso">
         <img src="images/<%= product.getImageOne() %>" alt=" " style="width:50px;height:50px;" > 
         <br>
         <label id="lImgPathThree" for="imgpaththree">Percorso Immagine Tre</label>
         <input id="imgpaththree" type="text" name="imgpaththree" placeholder="inserisci percorso"value="<%=product.getImageThree()%>"> 
         <input type="submit" value="Inserisci"/>
         <input type="reset" value="Reset"/>
         <input type="submit" value="Elimina"/>
         
    </fieldset>
    </form> 
    
    
     	
    	<form method="post" action="product?action=delete" name="DeleteProduct">
    	<fieldset>
    	<legend>Do you want to delete a product? </legend>
    	<input type="submit"  value="Elimina"/>
    	
    </fieldset>
    	</form>
    	
    </div>
 
 
 
 
 
 
 
 
</body>
</html>