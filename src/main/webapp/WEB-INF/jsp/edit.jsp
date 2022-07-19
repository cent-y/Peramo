<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>${errorEmail}</h2>
	<form action="/updateUser" method="POST">
		<table border="1">
			<tr>
				<th>Fullnamee</th>
				<td>
					<input type="text" name="fullname" value="<c:out value='${user.fullname}'/>"/>
				</td>
				<th>Email Address</th>
				<td>
					<input type="text" name="email" value="<c:out value='${user.email}'/>"/>
				</td>
			</tr>
		</table>
		<button type="submit">Submit</button>
	</form>
</body>
</html>