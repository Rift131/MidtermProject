<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bakery Page</title>
<jsp:include page="bootstraphead.jsp" />
<jsp:include page="navbar.jsp"></jsp:include>

</head>
<body>
<main class="container-fluid">
<h1>Welcome to ${bakery.name}</h1>
<img alt="bakery image" src="${bakery.imageUrl }">
	
	<h2>Hours of Operation: ${bakery.hoursOfOperation}</h2>
	<h2>${bakery.owner.address.address}</h2>
	<h2>${bakery.owner.address.address2}</h2>
	<h2>${bakery.owner.address.city}</h2>
	<h2>${bakery.owner.address.state}</h2>
	<h2>${bakery.owner.address.phone}</h2>
	
	
	
<jsp:include page="bootstrapfoot.jsp" />

</main>

</body>
</html> 