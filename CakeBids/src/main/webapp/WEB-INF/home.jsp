<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CakeBids Homepage</title><link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<jsp:include page="bootstraphead.jsp" />
<jsp:include page="navbar.jsp"></jsp:include>
</head>
<body>
<main class="container-fluid">
	<h1>Welcome to CakeBids</h1>

	<form action="login.do">
		<input class="btn btn-light" type="submit" value="Login" />
	</form>

	<form action="createAccount.do" method="GET">
		<input class="btn btn-light" type="submit"
			value="Create Customer Account" />
	</form>
	<form action="createBakeryAccount.do" method="GET">
		<input class="btn btn-light" type="submit"
			value="Create Bakery Account" />
	</form>

	<form action="searchKeyword.do" method="GET">
		<h4>Search Bakeries:</h4>
		<input class="form-control" type="text" name="keyword" /> <input
			class="btn btn-success" type="submit" value="Search" />
	</form>
	<br>

  <jsp:include page="bootstrapfoot.jsp" />
      </main> 
</body>
</html>