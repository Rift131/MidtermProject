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
	<form action="accountCreated.do" method="GET">
		<label for="username"><h4>Username: </h4> </label> <input type="text"
			name="username"> <br>
			<label for="password"><h4>Password: </h4> </label> <input type="password"
			name="password"> <br>
		<label for="firstName"><h4>First Name: </h4> </label> <input type="text"
			name="firstName"> <br>
		<label for="lastName"><h4>Last Name: </h4> </label> <input type="text"
			name="lastName"> <br>
		 <label for="address.address"><h4>Home Address: </h4> </label> <input type="text"
			name="address.address"> <br> 
			<label for="address.address2"><h4>Home Address 2: </h4> </label> <input type="text"
			name="address.address2"> <br> 
			<label for="address.city"><h4>City: </h4> </label> <input type="text"
			name="address.city"> <br> 
			<label for="address.state"><h4>State: </h4> </label> <input type="text"
			name="address.state"> <br> 
			<label for="address.zip"><h4>Postal Code/Zip: </h4> </label> <input type="text"
			name="address.zip"> <br> 
		<label for="address.phone"><h4>Phone: </h4> </label> <input type="text"
			name="address.phone"> <br>
       <label for="aboutMe"><h4>About Me: </h4> </label> <textarea  cols="30" rows="10" name="aboutMe"></textarea> <br> 
<!-- 		<label for="profilePic"><h4>Profile Pic:</h4></label> <input type="file" name="profilePic" id="file"/>
 -->		
		<input class="btn btn-success" type="submit" value="Create Account">
	
	</form>

	
    






</body>
</html>