
<%

String role = (String)request.getSession().getAttribute("role");

if (role == null || !role.equalsIgnoreCase("admin"))
	response.sendRedirect("index.jsp");

Collection<?> users = (Collection<?>) request.getAttribute("users");
if(users == null) {
	response.sendRedirect("./connection?action=users&returnto=gestioneUtenteAdmin.jsp");
	return;
}

userBean currentuser = (userBean) request.getAttribute("userdata");
if (currentuser == null)
	currentuser = new userBean();
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
 <%@ include file="navbar.jsp" %>
 
 
 
<div id="verticalStack">
   
 <div class="header_fixed"> 
    <table>
        <tr>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Username</th>
            <th>Email</th>
            <th>Ruolo</th>
            <th>Azioni</th>
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
            <td>
            	<a href="connection?action=delete&userid=<%= bean.getEmail()%>&returnto=gestioneUtenteAdmin.jsp">Rimuovi</a>
				<a href="connection?action=getuser&userid=<%=bean.getId()%>&returnto=gestioneUtenteAdmin.jsp">Modifica</a>
            </td>
        </tr>
    
<%
	}
		}
%>

	</table>
</div>
</div>

<div class="insertUser">
		<form action="connection?action=insert&returnto=gestioneUtenteAdmin.jsp" method="POST" onsubmit="event.preventDefault(); validate(this)" name="HandleUsers">
		<label>Gestione utenti</label>
		<input type="hidden" name="userid" value="<%= currentuser.getId() %>">
		<input type="text" name="name" placeholder="Inserisci nome" required maxlength="20" value="<%= currentuser.getName() %>">
		<input type="text" name="surname" placeholder="Inserisci cognome" required maxlength="20" value="<%= currentuser.getSurname() %>">
		<input type="text" name="username" placeholder="Inserisci username" required maxlength="20" value="<%= currentuser.getUser() %>">
		<input type="text" name="password" placeholder="Inserisci password" required maxlength="20" value="<%= currentuser.getPassword() %>">
		<input type="text" name="email" placeholder="Inserisci email" maxlength="40" required value="<%= currentuser.getEmail() %>">
		<input type="text" name="role" placeholder="Inserisci ruolo" required value="<%= currentuser.getRole() %>">
 
		<button type="submit" class="btnn">Salva Utente</button>
		<div id="errorMail" class="errors"><i> <ion-icon name="warning-outline"></ion-icon> </i></div>		
		</form>
	</div>
	<p id="errorMessageMailUsed">Utente presente con questa mail.</p>
	<p id="errorMessageMail">Email non valida.</p>
</body>
<script src="scripts/scriptUserManag.js"></script>
<script src="JavaScript/jquery-3.6.0.min.js" type="text/javascript"></script>

</html>