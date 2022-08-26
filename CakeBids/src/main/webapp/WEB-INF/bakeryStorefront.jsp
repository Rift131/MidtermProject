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
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
<style>

body { 
  background: linear-gradient(to top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(https://cutewallpaper.org/27/black-sprinkle-wallpaper/3180111030.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

</style>
<main class="container-fluid">
<h1>${bakery.name}</h1>


<center><img alt="bakery image" src="${bakery.imageUrl }" style="border:10px solid #000000; padding:5px; margin: 5px"></center>

	
	<h3>Hours of Operation: ${bakery.hoursOfOperation}</h3>
	<h3>${bakery.owner.address.address}</h3>
	<h3>${bakery.owner.address.address2}</h3>
	<h3>${bakery.owner.address.city}</h3>
	<h3>${bakery.owner.address.state}</h3>
	<h3>${bakery.owner.address.phone}</h3>
	<h3>${bakery.description}</h3>
	
	
	
<jsp:include page="bootstrapfoot.jsp" />

</main>

</body>
</html> 