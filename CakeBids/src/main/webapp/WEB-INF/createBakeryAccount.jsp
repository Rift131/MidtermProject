<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Create Bakery Account</title>

<jsp:include page="navbar.jsp"></jsp:include>
</head>
<body>

	<h3>Create Account:</h3>
	<form action="bakeryAccountCreated.do" method="POST">
		<label for="owner.username"><h4>Username: </h4> </label> <input type="text"
			name="owner.username"> <br>
			<label for="owner.password"><h4>Password: </h4> </label> <input type="password"
			name="owner.password"> <br>
			<label for="name"><h4> Business Name: </h4> </label> <input type="text"
			name="name"> <br>
		<label for="owner.firstName"><h4>Owner First Name: </h4> </label> <input type="text"
			name="owner.firstName"> <br>
		<label for="owner.lastName"><h4>Owner Last Name: </h4> </label> <input type="text"
			name="owner.lastName"> <br>
		<label for="owner.email"><h4>Business Email: </h4> </label> <input type="text"
		    name="owner.email"> <br>
		    <label for="websiteUrl"><h4>Website URL: </h4> </label> <input type="text"
		    name="websiteUrl"> <br>
		    <label for="hoursOfOperation"><h4>Hours of Operation: </h4> </label> <input type="text"
		    name="hoursOfOperation"> <br>
		 <label for="owner.address.address"><h4>Business Address: </h4> </label> <input type="text"
			name="owner.address.address"> <br> 
			<label for="owner.address.address2"><h4>Business Address 2: </h4> </label> <input type="text"
			name="owner.address.address2"> <br> 
			<label for="owner.address.city"><h4>City: </h4> </label> <input type="text"
			name="owner.address.city"> <br> 
			<label for="owner.address.state"><h4>State: </h4> </label> <input type="text"
			name="owner.address.state"> <br> 
			<label for="owner.address.zip"><h4>Postal Code/Zip: </h4> </label> <input type="text"
			name="owner.address.zip"> <br> 
		<label for="owner.address.phone"><h4>Phone: </h4> </label> <input type="text"
			name="owner.address.phone"> <br>
       <label for="description"><h4>About Me: </h4> </label> <textarea  cols="30" rows="10" name="description"></textarea> <br> 
		<label for="owner.profilePic"><h4>Profile Picture:</h4></label> <input type="file" name="owner.profilePic" id="file"/>
		
		<input class="btn btn-success" type="submit" value="Create Account">
	
	</form>

	
    






</body>
</html>