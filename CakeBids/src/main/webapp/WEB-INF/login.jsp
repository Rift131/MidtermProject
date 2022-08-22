<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<jsp:include page="navbar.jsp"></jsp:include>
</head>
<body>

	<td><form action="login.do" method="POST">
			<h1>Customer Login</h1>
			Username<input type="text" name="username" value="${user.username }" />
			Password<input type="password" name="password" value="${user.password }" />
			<button class="btn btn-primary" type="submit">Login</button>
		</form></td>


</body>
</html>