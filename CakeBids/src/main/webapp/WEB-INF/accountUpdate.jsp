<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/styles.css">
<meta charset="UTF-8">
<title>Update Account</title>
</head>
<style>

body { 
  background: linear-gradient(to top, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url(img/IMG_4322.PNG) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

</style>
<!-- ADD CSS LINKS -->
<jsp:include page="navbar.jsp"></jsp:include>
<body>
 
       <h1>Update Account:</h1>
<center><form action="accountUpdated.do" method="POST">
		
		<label for="firstName"><h4>First Name: </h4> </label> <input type="text"
			name="firstName" value="${user.firstName }"> <br>
		<label for="lastName"><h4>Last Name: </h4> </label> <input type="text"
			name="lastName" value="${user.lastName }"> <br>
		 <label for="address.address"><h4>Home Address: </h4> </label> <input type="text"
			name="address.address" value="${user.address.address }"> <br> 
			<label for="address.address2"><h4>Home Address 2: </h4> </label> <input type="text"
			name="address.address2"value="${user.address.address2 }"> <br> 
			<label for="address.city"><h4>City: </h4> </label> <input type="text"
			name="address.city"value="${user.address.city }"> <br> 
			<label for="address.state"><h4>State: </h4> </label> <input type="text"
			name="address.state"value="${user.address.state }"> <br> 
			<label for="address.zip"><h4>Postal Code/Zip: </h4> </label> <input type="text"
			name="address.zip"value="${user.address.zip }"> <br> 
		<label for="address.phone"><h4>Phone: </h4> </label> <input type="text"
			name="address.phone"value="${user.address.phone }"> <br>
       <label for="aboutMe"><h4>About Me: </h4> </label> <textarea  cols="30" rows="10" name="aboutMe" value="${user.aboutMe }"></textarea> <br> 
			<input type="hidden" name="id" value="${user.id }"/>
			<input type="hidden" name="address.id" value="${user.address.id }"/>
		<input class="btn btn-success" type="submit" value="Update Account">
	
	</form></center>

   
</body>
</html>