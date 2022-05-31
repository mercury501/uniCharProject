
<%
	Collection<?> products = (Collection<?>) request.getAttribute("catalog");
	if(products == null) {		
		response.sendRedirect("./index");	
		return;
	}
	

%>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.productBean"%>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="style.css">
<!--Link per font e inconcine-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>Insert title here</title>
</head>
<body>

<%
	if (products != null && products.size() != 0) {
		Iterator<?> it = products.iterator();
		while (it.hasNext()) {
			productBean bean = (productBean) it.next();
%>
<tr>
			<td><%=bean.getId()%></td>
			<td><%=bean.getTitolo()%></td>
			<td><%=bean.getDescrizione()%></td>
			 <img src="images/products/<%= bean.getImageOne() %>" alt=" " style="width:50px;height:50px;" > 
		</tr>
<%
		}
	} else {
%>
<tr>
	<td colspan="6">No products available</td>
</tr>
<%
	}
%>
		<!-- Footer -->
	        <section class="footer">
            <div class="social">
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-facebook"></i></a>
            </div>

            <ul class="list">
                <li><a href="#">Supporto</a></li>
                <li><a href="#">Informativa sulla privacy</a></li>
                <li><a href="#">Termini di utilizzo del sito web</a></li>
                <li><a href="#">Termini legali</a></li>
                <li><a href="#">Chi Siamo</a></li>
                <li><a href="#">Lavora con noi</a></li>
            </ul>

            <p class="copyright">United Charity @ 2022</p>

        </section>


</body>
</html>