<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style>


</style>
<meta charset="UTF-8">
<title>LOGIN</title>
<jsp:include page="bootstraphead.jsp" />
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/carousel.css">
<main class="container-fluid">
<body>

	<td><form action="login.do" method="POST">
			<h1>Customer Login</h1>
		<p style="text-align:center;">	Username<input type="text" name="username" value="${user.username }" />
			Password<input type="password" name="password" value="${user.password }" />
			<button class="btn btn-dark" type="submit">Login</button></p>
		</form></td>
		
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 6"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/841B1728-7A97-4F4E-8C13-CE53CAB0F916.JPG" class="d-block w-100" alt="cake 1">
    </div>
    <div class="carousel-item">
      <img src="img/IMG_1375.PNG" class="d-block w-100" alt="cake 2">
    </div>
    <div class="carousel-item">
      <img src="img/IMG_3351.PNG" class="d-block w-100" alt="cake 3">
    </div>
    <div class="carousel-item">
      <img src="img/IMG_3922.PNG" class="d-block w-100" alt="cake 4">
    </div>
    <div class="carousel-item">
      <img src="img/IMG_3628.PNG" class="d-block w-100" alt="cake 5">
    </div>
    <div class="carousel-item">
      <img src="img/IMG_1377.PNG" class="d-block w-100" alt="cake 6">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


</body>
</main>

<jsp:include page="bootstrapfoot.jsp" />
</html>