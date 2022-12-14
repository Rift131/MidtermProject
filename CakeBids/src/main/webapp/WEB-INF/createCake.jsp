<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Cake Order Form</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!--  CSS FILES AFTER BOOTSRAP-->
<jsp:include page="bootstraphead.jsp" />
<link rel="stylsheet" href="css/cakeForm.css">
 
		<style>
body {
	background: linear-gradient(to top, rgba(0, 0, 0, 0.7),
		rgba(0, 0, 0, 0.7)), url(img/IMG_1375.PNG)
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<main class="container-fluid">

	<h1>Cake Order Form</h1>
	<div id="cakeOrderMain"><form action="cakeCreated.do" method="GET">
		    <br>
			<h4><label>Venue For Your Occasion</label></h4>
			<br>
			<h6><label for="occasion.name">What is the occasion for your cake order?</label></h6>
			<input type="text" id="occasionName" name="occasion.name" required="required"/>
			<h6><label for="occasionStreet">Street Address</label></h6>
			<input type="text" id="occasionStreet" name="occasion.address.address"/>
			<h6><label for="occasionStreet2">Apartment, Suite, etc.</label></h6>
			<input type="text" id="occasionStreet2" name="occasion.address.address2"/>
			<h6><label for="occasionCity">City</label></h6>
			<input type="text" id="occasionCity" name="occasion.address.city"/>
			<h6><label for="occasionState">State/Province</label></h6>
			<input type="text" id="occasionState" name="occasion.address.state"/>
			<h6><label for="occasionState">Zip/Postal Code</label></h6>
			<input type="text" id="occasionZip" name="occasion.address.zip" required="required"/>     
			<h6><label for="occasionPhone">Best Phone Number For Any Questions Regarding This Occasion</label></h6>
			<input type="text" id="occasionPhone" name="occasion.address.phone"/>
			<br>
			<br>
			<h4><label>Build Your Cake!</label></h4>
			<br>
		    <h6><label for="name">Name your cake<input type="text" id="name" name="name" required="required"></label></h6>
			<br>
			<h6><label for="description">Describe your vision for this cake  <input type="text" id="description" name="description"></label></h6> 
			<br>
			  <h6><label for="cakeInspiration">URL for example picture of your cake  <input type="text" id="name" name="cakeInspiration"></label></h6>
			<br>
			<label for="cakeType.id">Select the type of cake you would like</label>
			<select name="cakeType.id">
			<c:forEach items="${cakeTypes}" var="cakeType">
			<option  value="${cakeType.id}">${cakeType.name}</option>
			</c:forEach>
			</select>
			<br>
			<br>
			<label for="flavor.id">Select your flavor</label> <!-- label for matches the select name -->
			<c:forEach items="${flavors}" var="flavor"> <!-- flavors is the controller calls this element. Flavor is the name of the ENTITY, lowercase first letter -->
			<input type="checkbox" name="flavorIds" value="${flavor.id}">${flavor.name} <!-- value is the primary key, after that is the path to the value in the table you want to appear -->
			</c:forEach>
			
			<br>
			<br>
			<label for="filling.id">What filling would you like?</label>
			<c:forEach items="${fillings}" var="filling"> <!-- flavors is the controller calls this element. Flavor is the name of the ENTITY, lowercase first letter -->
			<input type="checkbox" name="fillingIds" value="${filling.id}">${filling.fillingType} <!-- value is the primary key, after that is the path to the value in the table you want to appear -->
			</c:forEach>
			
			<br>
		    <br>
		    <label for="bakeryId">Choose your favorite bakery</label>
		    <select name="bakeryId">
			<c:forEach items="${bakeries}" var="bakery">
			<option  value="${bakery.id}">${bakery.name}</option>
			</c:forEach>
			</select> 
			<br>
			<br>
		    <label for="deliveryMethod.id">Choose your delivery method</label>
		    <select name="deliveryMethods.id">
			<c:forEach items="${deliveryMethods}" var="deliveryMethod">
			<option  value="${deliveryMethod.id}">${deliveryMethod.deliveryType}</option>
			</c:forEach>
			</select>
			<br>
			<br>
			<h4><label>Final Details</label></h4>
		    <br>
		    <h6><label for="budget">What is your budget for this cake?  <input type="number" step=".01" id="cakeBudget" name="budget"></label></h6>  
			<br>
		    <h6><label for="neededByDate">What day would you like your cake to be ready by?</label></h6> 
		    <input type="date" id="dateAdded" name="neededByDate" required="required"> 
			<br>
			<br>
			<h6><label for="specialInstructions">Do you have any special instructions?</label></h6> 
			<input type="text" id="specialInstructions" name="specialInstructions">
			<br>
			<br>
		    <h6><label for="userContact">Your Contact information</label></h6> 
		    <label for="firstName">First Name</label>
		    <input type="text" name="occasion.user.firstName" value="${loggedIn.firstName}"/>
		    <label for="lastName">Last Name</label>
		    <input type="text" name="occasion.user.lastName" value="${loggedIn.lastName}"/>
		    <label for="phone">Phone</label>
		    <input type="text" name="occasion.user.address.phone" value="${loggedIn.address.phone}"/>
		    <br>
		    <br>
		    <br> 
		    <input class="btn btn-success" type="submit" id="submit" value="Submit Your Order!">
	
			<input type="hidden" name="addressId" value="${loggedIn.address.id }">
	</form></div> 
	</main>

<jsp:include page="bootstrapfoot.jsp" />
</body>
</html>