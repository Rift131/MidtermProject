<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CakeBids Homepage</title>
<jsp:include page="navbar.jsp"></jsp:include>
</head>
<body>
	<h1>Welcome to CakeBids</h1>

	<form action="login.do">
		<input class="btn btn-primary" type="submit" value="Login" />
	</form>

	<form action="createAccount.do" method="GET">
		<input class="btn btn-primary" type="submit"
			value="Create Customer Account" />
	</form>
	<form action="createBakeryAccount.do" method="GET">
		<input class="btn btn-primary" type="submit"
			value="Create Bakery Account" />
	</form>

	<form action="results.do" method="GET">
		<h4>Search Bakeries and Cakes:</h4>
		<input class="form-control" type="number" name="id" /> <input
			class="btn btn-primary" type="submit" value="Search" />
	</form>
	<br>


</body>
</html>