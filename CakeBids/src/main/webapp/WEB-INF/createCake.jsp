<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Cake Order Form</title>

<jsp:include page="navbar.jsp"></jsp:include>
</head>
<body>

	<h3>Cake Order Form</h3>
	<form action="createCake.do" method="GET">
		<label for="username"><h4>Username: </h4> </label> <input type="text"
			name="username"> <br>
			<label for="password"><h4>Password: </h4> </label> <input type="password"
			name="password"> <br>
			<label for="bakery.name"><h4> Business Name: </h4> </label> <input type="text"
			name="bakery.name"> <br>
		<label for="firstName"><h4>Owner First Name: </h4> </label> <input type="text"
			name="firstName"> <br>
		<label for="lastName"><h4>Owner Last Name: </h4> </label> <input type="text"
			name="lastName"> <br>
		<label for="email"><h4>Business Email: </h4> </label> <input type="text"
		    name="email"> <br>
		    <label for="bakery.websiteUrl"><h4>Website URL: </h4> </label> <input type="text"
		    name="bakery.websiteUrl"> <br>
		    <label for="bakery.hoursOfOperation"><h4>Hours of Operation: </h4> </label> <input type="text"
		    name="bakery.hoursOfOperation"> <br>
		 <label for="address.address"><h4>Business Address: </h4> </label> <input type="text"
			name="address.address"> <br> 
			<label for="address.address2"><h4>Business Address 2: </h4> </label> <input type="text"
			name="address.address2"> <br> 
			<label for="address.city"><h4>City: </h4> </label> <input type="text"
			name="address.city"> <br> 
			<label for="address.state"><h4>State: </h4> </label> <input type="text"
			name="address.state"> <br> 
			<label for="address.zip"><h4>Postal Code/Zip: </h4> </label> <input type="text"
			name="address.zip"> <br> 
		<label for="address.phone"><h4>Phone: </h4> </label> <input type="text"
			name="address.phone"> <br>
       <label for="bakery.description"><h4>About Me: </h4> </label> <textarea  cols="30" rows="10" name="bakery.description"></textarea> <br> 
		<label for="profilePic"><h4>Profile Picture:</h4></label> <input type="file" name="profilePic" id="file"/>
		
		<input class="btn btn-success" type="submit" value="Create Account">
	
	</form>

	
    






</body>
</html>