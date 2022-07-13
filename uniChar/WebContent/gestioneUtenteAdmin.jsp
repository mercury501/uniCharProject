
<%

Collection<?> users = (Collection<?>) request.getAttribute("users");
if(users == null) {
	response.sendRedirect("./connection?action=users&returnto=AreaAdmin.jsp");
	return;
}
%>



<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,tsw.uniChar.Beans.userBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/styleGestUtenteAdmin.css">
    <title>Gestione Utenti</title>
</head>

<body>
    

    <div class="search">

        <input class="srch"type="search" name="search" placeholder="Cerca utenti">
        <a href="#"><button class="btn-search">Search</button></a>
    </div>


   
 <div class="header_fixed"> 
    <table>
        <tr>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Username</th>
            <th>Email</th>
            <th>Ruolo</th>
        </tr>

 <% 
	if (users != null && users.size() != 0) {
		Iterator<?> it = users.iterator();
		while (it.hasNext()) {
			userBean bean = (userBean) it.next();
%>
   
        <tr>
            <td><%=bean.getName() %></td>
            <td><%=bean.getSurname() %></td>
            <td><%=bean.getUser() %></td>
            <td><%=bean.getEmail()%></td>
            <td><%=bean.getRole() %></td>
        </tr>
    


<%
	}
		}
%>

	</table>
</div>

</body>
</html>