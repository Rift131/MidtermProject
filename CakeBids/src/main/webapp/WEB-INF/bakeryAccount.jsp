<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="navbar.jsp"></jsp:include>
</head>
<body>


	<form action="reviews.do" method="GET">
		<input class="form-control" type="number" name="id" /> <input
			class="btn btn-primary" type="submit" value="All Bakery Reviews" />
	</form>

	<form action="logout.do" method="GET">
		<input class="btn btn-primary" type="submit" value="Logout" />
	</form>

</body>
</html>