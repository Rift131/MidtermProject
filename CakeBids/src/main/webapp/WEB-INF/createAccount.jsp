<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Create Customer Account</title>

<jsp:include page="navbar.jsp"></jsp:include>
</head>
<body>

	<h3>Create Account:</h3>
	<form action="accountCreated.do" method="POST">
		<label for="Username"><h4>Username: </h4> </label> <input type="text"
			name="username"> <br>
		<label for="firstname"><h4>First Name: </h4> </label> <input type="text"
			name="firstname"> <br>
		<label for="lastname"><h4>Last Name: </h4> </label> <input type="text"
			name="lastname"> <br>
		<label for="password"><h4>Password: </h4> </label> <input type="password"
			name="password"> <br>
		<label for="email"><h4>Email: </h4> </label> <input type="text"
		    name="username"> <br>
		<label for="homeAddress"><h4>Home Address: </h4> </label> <input type="text"
			name="homeAddress"> <br>
		<label for="phone"><h4>Phone: </h4> </label> <input type="text"
			name="phone"> <br>
		<input class="btn btn-success" type="submit" value="Create Account">
       

	</form>







</body>
</html>