<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Create Customer Account</title>
<link rel="stylesheet" href="css/styles.css">
<jsp:include page="navbar.jsp"></jsp:include>
</head>
<body>
		<style>
body {
	background: linear-gradient(to top, rgba(0, 0, 0, 0.7),
		rgba(0, 0, 0, 0.7)), url(img/IMG_3923.PNG)
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
	<h1>Create Account:</h1>
	<center> <form action="accountCreated.do" method="GET" id="createForm">
		
		<label for="username"><h4>Username </h4> </label> <input type="text"
			name="username"> <br>
			
			<label for="password"><h4>Password </h4> </label> <input type="password"
			name="password"> <br>
		
		<label for="firstName"><h4>First Name </h4> </label> <input type="text"
			name="firstName"> <br>
		
		<label for="lastName"><h4>Last Name </h4> </label> <input type="text"
			name="lastName"> <br>
		 
		 <label for="address.address"><h4>Home Address </h4> </label> <input type="text"
			name="address.address"> <br> 
			
			<label for="address.address2"><h4>Home Address 2 </h4> </label> <input type="text"
			name="address.address2"> <br> 
			<label for="address.city"><h4>City </h4> </label> <input type="text"
			name="address.city"> <br> 
			<label for="address.state"><h4>State </h4> </label> <input type="text"
			name="address.state"> <br> 
			<label for="address.zip"><h4>Postal Code/Zip </h4> </label> <input type="text"
			name="address.zip"> <br> 
		<label for="address.phone"><h4>Phone </h4> </label> <input type="text"
			name="address.phone"> <br>
       <label for="aboutMe"><h4>About Me </h4> </label> <textarea  cols="30" rows="10" id="aboutMe" name="aboutMe"></textarea> <br> 
	
		
		<input class="btn btn-dark" type="submit" value="Create Account">
	
	</form></center>

	

    






</body>
</html>